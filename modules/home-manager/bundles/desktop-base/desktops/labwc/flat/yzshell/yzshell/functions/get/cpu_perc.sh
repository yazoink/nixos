#!/usr/bin/env bash

function get_cpu_perc() {
    prev_total=0
    prev_idle=0
    cpu_file="${YZSHELL_CACHE_DIR}/.cpu_usage"
    if [[ -f "${cpu_file}" ]]; then
        file_cont=$(cat "${cpu_file}")
        prev_total=$(echo "${file_cont}" | head -n 1)
        prev_idle=$(echo "${file_cont}" | tail -n 1)
    fi

    cpu=(`cat /proc/stat | grep '^cpu '`) # Get the total cpu statistics.
    unset cpu[0]                          # Discard the "cpu" prefix.
    idle=${cpu[4]}                        # Get the idle cpu time.

    # Calculate the total cpu time.
    total=0

    for VALUE in "${cpu[@]:0:4}"; do
        let "total=$total+$VALUE"
    done

    if [[ "${prev_total}" != "" ]] && [[ "${prev_idle}" != "" ]]; then
        # Calculate the cpu usage since we last checked.
        let "diff_idle=$idle-$prev_idle"
        let "diff_total=$total-$prev_total"
        let "diff_usage=(1000*($diff_total-$diff_idle)/$diff_total+5)/10"
        echo "${diff_usage}"
    else
        echo "?"
    fi

    # Remember the total and idle cpu times for the next check.
    echo "${total}" > "${cpu_file}"
    echo "${idle}" >> "${cpu_file}"
}