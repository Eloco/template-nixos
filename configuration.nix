{ pkgs, ... }: {

  networking.firewall.enable = false;

  services.openssh.enable = true;
  services.openssh.listenAddresses = [{ addr = "0.0.0.0"; port = 22; }];
  services.openssh.passwordAuthentication = true;

  environment.systemPackages = with pkgs; [
    curl
    httpie
    gitAndTools.gitFull
    htop
    sudo
    tmux
    neovim
  ];

  security.sudo.enable = true;

  users.users.root.password = "root";

  users.users.nixos = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    password = "nixos";
  };
}
