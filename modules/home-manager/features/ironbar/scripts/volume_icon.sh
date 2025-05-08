#!/usr/bin/env bash

output=$(amixer get Master)

# Check if muted
if [[ $output == *"[off]"* ]]; then
    echo ""
    exit 0
fi

# Extract the first percentage value using Bash string manipulation
volume=${output#*[\[}
volume=${volume%%%*}
volume=${volume%\%*}

# Fallback if parsing fails (e.g., if output format changes)
if ! [[ $volume =~ ^[0-9]+$ ]]; then
    volume=0
fi

if (( volume > 50 )); then
    echo ""
elif (( volume > 25 )); then
    echo ""
else
    echo ""
fi
