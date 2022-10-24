# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  networking.firewall.enable = false;

  # https://channels.nixos.org/
  system.stateVersion = "21.05";

  # nixpkgs config
  # https://github.com/NixOS/nixpkgs/blob/nixos-22.05/nixos/modules/misc/nixpkgs.nix
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowInsecurePredicate = p: true;
  };

  services.openssh.enable = true;
  services.openssh.listenAddresses = [{ addr = "0.0.0.0"; port = 22; }];
  services.openssh.passwordAuthentication = true;

  #The set of packages that appear in /run/current-system/sw. These packages are automatically available to all users, and are automatically updated every time you rebuild the system configuration
  #environment.systemPackages = with pkgs; [ git ];
  environment.systemPackages = builtins.concatLists (builtins.attrValues (import ./packages.nix { inherit pkgs inputs; }));

  security.sudo.enable = true;

  users.users.root.password = "root";

  users.users.nixos = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    password = "nixos";
  };
}


#todo
## zsh neovim tmux
