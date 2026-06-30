{...}: [
  # do not disturb
  {
    "@key" = "W-S-d";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../../common/scripts/dnd.sh}";
    };
  }
]
