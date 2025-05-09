{
  search = {
    order = ["4get" "ddg" "google" "Bookmarks" "History" "Tabs"];
    force = true;
    default = "4get";
    privateDefault = "4get";
    engines = {
      "4get" = {
        urls = [
          {
            template = "https://4get.yazo.ink/web?s={searchTerms}";
          }
        ];
        definedAliases = ["@4g"];
      };
    };
  }
}
