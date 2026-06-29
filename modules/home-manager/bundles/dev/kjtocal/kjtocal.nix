{pkgs, ...}:
let
  pythonScript = pkgs.writeText "myscript.py" ''
import sys

def main():
  argc = len(sys.argv)
  if argc > 2 or argc == 1:
    help()
    exit(1)
  input = sys.argv[1]
  if input == "--help" or input == "-h":
    help()
    exit(0)
  if input.isdigit() == False:
    print("Error: \"" + input + "\" is not a numerical value.")
    exit(1)
  input = int(input)
  output = input / 4.184
  print(str(input) + " kj is equal to " + str(round(output, 2)) + " cal.")

def help():
  print("kjtocal -- yazoink 2024")
  print("a simple kilojoule to calorie converter")
  print()
  print("Usage:")
  print("    kjtocal (numerical value)")

main()
'';
in
pkgs.writeShellScriptBin "kjtocal" ''
  ${pkgs.python3}/bin/python ${pythonScript} "$@"
''
