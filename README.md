# a non GUI Pentest Nixos demo based on [RedNix](https://github.com/redcode-labs/RedNix)

>are you wanting a configuration.nix for NixOS? that probably won’t work, that is meant to manage an entire OS. You can do that with nixos-container or LXC, but not in docker (there are some advanced caveats here, but it’s very likely not what you should be doing).


## Imperative mode

>https://github.com/redcode-labs/RedNix/wiki/2.-Installation,-configuration-and-usage

```
nixos-container create --flake github:Eloco/pentest-nixos#<arch> rednix
```
Where `<arch>` is one of `{aarch64,x86_64}-{linux,darwin}`.

```
nixos-container start rednix
systemctl status container@rednix
nixos-container root-login rednix
```

## Declarative

>As mentioned earlier, this container can be added to your system config. To do this, you have to add RedNix as an input to your system flake, then include container in your config like this:

```
# system configuration
{ config, pkgs, inputs, ... }: {
  imports = [ inputs.rednix.container ];
}
```

>When you run nixos-rebuild switch, your container will be built.


## gitpod

>due to the 10G storage limit of Gitpod, Gitpod use ./packages.nix.gitpod which is just contains couple of packages. just show u part of the build process.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/Eloco/pentest-nixos)

