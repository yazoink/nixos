{
  search = {
    order = ["4get" "ddg" "google" "Bookmarks" "History" "Tabs"];
    force = true;
    default = "brave";
    privateDefault = "brave";
    engines = {
      "4get" = {
        urls = [
          {
            template = "https://4get.yazo.ink/web?s={searchTerms}";
          }
        ];
        definedAliases = ["@4g"];
      };
      "brave" = {
        urls = [
          {
            template = "https://search.brave.com/search?q={searchTerms}";
          }
        ];
        definedAliases = ["@br"];
      };
    };
  };
}
