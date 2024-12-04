{ pkgs, lib, config, ... }:

let
  hackingPackages = with pkgs; [
    gobuster
    thc-hydra
    ffuf
    nmap
    sqlmap
    wfuzz
    wordlists
    nikto
    metasploit
  ];
in 
{
  home.username = "root";
  home.homeDirectory = "/root";
 
  # Common packages
  home.packages = with pkgs; [
    git
    cloudflared
    python312
    curl
    neovim
    byobu
    gnused
    locale

    (pkgs.writeShellScriptBin "http-ts" ''
      nohup python -m http.server 8000 > ~/.log/pyserver.log 2>&1 &
      nohup cloudflared --url localhost:8000 > ~/.log/cloudflared.log 2>&1 &
    '')
  ] ++ hackingPackages;


  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash.enable = true;
  programs.bat.enable = true;
  programs.lsd.enable = true;
  programs.btop.enable = true;
  programs.tmux.enable = true;

  home.file.wordlists.source = config.lib.file.mkOutOfStoreSymlink "${pkgs.wordlists}/share/wordlists";

  i18n.glibcLocales = pkgs.glibcLocales;

  home.shellAliases = {
    ls = "lsd";
    ll = "ls -l";
    l = "ls -la";
    tree = "lsd --tree";
    cat = "bat";
  };

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "nvim";
  };


  home.stateVersion = "24.11";
}
