{writeShellScriptBin}:
let
  dollarSign = "$";
  wordsTxt = ./words.txt;
in
writeShellScriptBin "pswdgen" ''
  main() {
      word_num=3
      wordlist_num=0
      words=()

      case "$1" in
	  "-w" | "--words")
	      if is_num "$2"; then
		  word_num=$2
	      else
		  printf "Error: %s is not a number.\n" "$2"
		  exit 1
	      fi
	      ;;
	  "-h" | "--help")
	      help
	      exit 0
	      ;;
	  "")
	      ;;
	  *)
	      printf "Error: unknown argument, see --help\n"
	      exit 1
	      ;;
      esac

      if [[ -z "${wordsTxt}" ]]; then
	  printf "Error: cannot locate %s.\n" "${wordsTxt}"
	  exit 1
      fi


      wordlist_num=$(wc -l < "${wordsTxt}")

      for (( i=0; i<$word_num; i++ )); do
	  word_index=$(shuf -i 1-$wordlist_num -n 1)
	  word="$(sed -n "${dollarSign}{word_index}p" ${wordsTxt} | awk '{print $1}')"
	  words+=("$word")
      done

      for i in "${dollarSign}{words[@]}"; do
	  printf "%s" "${dollarSign}{i^}"
      done
      printf "\n"
  }

  help() {
      printf "Usage: pswdgen [option] [argument]
	  Options:
	      --words, -w: the number of words to generate
	      --help, -h: help\n"
  }

  is_num() {
      re='^[0-9]+$'
      if [[ $1 =~ $re ]]; then
	  return 0
      else
	  return 1
      fi
  }

  main "$@"
''
