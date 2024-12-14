{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.home-manager.enable = true; # alwayas enabled
  
  imports = [
    #../../modules/home-manager/emacs/default.nix
    #../../modules/home-manager/fonts/default.nix
    ../../modules/home-manager/git/default.nix
    #../../modules/home-manager/hyprland/default.nix
    #../../modules/home-manager/sops/default.nix
    #../../modules/home-manager/ssh/default.nix
    #../../modules/home-manager/stylix/default.nix
    #../../modules/home-manager/waybar/default.nix

    #outputs.homeManagerModules.fonts
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home = {
    username = "astraeaf";
    homeDirectory = "/home/astraeaf";
    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };
  };

  # Home packages & programs
  home.packages = with pkgs; [
    atool
    httpie
  ];
  programs = {
    # Shell & CLI
    bash.enable = true;
    gh.enable = true;
    gh-dash.enable = true;
  };

  # To be made into packages
  gtk.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}