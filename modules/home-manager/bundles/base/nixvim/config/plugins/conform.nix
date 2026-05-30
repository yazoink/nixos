{pkgs, ...}: {
  conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notify_on_error = true;
      formatters_by_ft = {
        html = ["prettierd" "prettier"];
        css = ["prettierd" "prettier"];
        javascript = ["prettierd" "prettier"];
        # typescript = ["prettierd" "prettier"];
        markdown = ["prettierd" "prettier"];
        python = ["black"];
        lua = ["stylua"];
        nix = ["alejandra"];
        bash = ["shfmt" "beautysh"];
        sh = ["shellcheck" "beautysh"];
        yaml = ["yamllint" "yamlfmt"];
        c = ["uncrustify"];
        json = ["fixjson"];
        php = ["phpcbf"];
        rust = ["rustfmt"];
        # zig = ["zigfmt"];
        # latex = ["llf"];
      };
      formatters = {
        # phpcbf = { # build failed
        #   command = "${pkgs.php83Packages.php-codesniffer}/bin/phpcbf";
        # };
      };
    };
  };
}
