# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  lib,
  inputs,
  ...
} @ args: {
  networking.firewall.enable = false;


  # nixpkgs config
  # https://github.com/NixOS/nixpkgs/blob/nixos-22.05/nixos/modules/misc/nixpkgs.nix
  # https://nixos.org/manual/nixpkgs/stable/
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowInsecurePredicate = p: true;
  };

  # service
  services.openssh.enable = true;
  services.openssh.listenAddresses = [{ addr = "0.0.0.0"; port = 22; }];
  services.openssh.passwordAuthentication = true;

  # The set of packages that appear in /run/current-system/sw. These packages are automatically available to all users, and are automatically updated every time you rebuild the system configuration
  # environment.systemPackages = builtins.concatLists (builtins.attrValues (import ./packages.nix { inherit pkgs inputs; }));
  environment.systemPackages = with pkgs; [ 
    neovim
    zsh
    tmux
    openssh
  ];

  # security
  security.sudo.enable = true;

  # system
  system.stateVersion = "22.05";   # https://channels.nixos.org/

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # user
  users.users.root.password = "root";

  users.users.nixos = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    password = "nixos";
  };

  ## rednix container
  containers.rednix = {
    privateNetwork = true;
    hostAddress = "192.168.100.2";
    localAddress = "192.168.100.11";

    forwardPorts = [
      {
        containerPort = 22;
        hostPort = 2222;
        protocol = "tcp";
      }
      {
        containerPort = 80;
        hostPort = 8080;
        protocol = "tcp";
      }
    ];

    bindMounts = {
      "/" = {
        hostPath = "/mnt/rednix";
        isReadOnly = false;
      };
    };

    config = import ./container.nix args;
  };

  #imports = [ inputs.rednix.container ];
  #containers.rednix.autoStart = true;
}


#todo
## zsh neovim tmux
