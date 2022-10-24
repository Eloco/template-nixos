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
  environment.systemPackages = with pkgs; [ git ];

  networking.firewall.enable = false;

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
