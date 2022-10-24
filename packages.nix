https://search.nixos.org/packages?channel=22.05&from=0&size=50&sort=relevance&type=packages&query=oshka
{
  pkgs,
  inputs,
}: let
  packages = {



    # from https://github.com/redcode-labs/RedNix/blob/master/packages.nix

    RCL = with pkgs; [
      sammler   # tool to extract useful data from documents
      gosh      # Reverse/bind shell generator
      godspeed  # Manager for reverse shells
      snowcrash # Polyglot payload generator
    ];

    # https://github.com/NixOS/nixpkgs/blob/master/lib/attrsets.nix
    # WTF?
    # applePrincessPackages = pkgs.lib.mapAttrsToList (_: v: v) inputs.hackpkgs.packages.${pkgs.system};

    archive-tools = with pkgs; [
      cabextract #Free Software for extracting Microsoft cabinet files
      p7zip
      unrar
      unzip
    ];

    #bluetooth = with pkgs; [
    #  bluez
    #  python3Packages.bleak
    #  bluewalker
    #  redfang
    #  ubertooth
    #];

    # ci = with pkgs; [
    #   oshka #Tool for extracting nested CI/CD supply chains and executing commands
    # ];

    # containers = with pkgs; [
    # cdk-go                    # Container penetration toolkit
    # clair                     # Vulnerability Static Analysis for Containers
    # cliam
    # cloudlist
    # dive
    # dockle
    # grype
    # trivy
    # fwanalyzer
    # ];

    databases = with pkgs; [
      mongoaudit # MongoDB auditing and pentesting tool
      sqlmap
    ];

    crypto = with pkgs; [
      (sage.override {
        requireSageTests = false;
        extraPythonPackages = p:
          with p; [
            pwntools     # CTF framework and exploit development library
            pycryptodome # Python Cryptography Toolkit
            #gmpy2       # GMP/MPIR, MPFR, and MPC interface to Python 2.6+ and 3.x
          ];
      })
    ];

    dns = with pkgs; [
      aiodnsbrute # DNS brute force utility
      amass       # In-Depth DNS Enumeration and Network Mapping
      bind        # Domain name server  provides dig and nslookup
      dnsenum     # A tool to enumerate DNS information
      dnsmon-go   # Tool to collect DNS traffic
      dnsmonster
      dnsrecon
      dnstake
      dnstracer
      dnstwist
      dnsx
      fierce
      findomain
      knockpy
      subfinder
      subzerod
    ];

    forensics = with pkgs; [
      afflib
      amoco
      dcfldd
      ddrescue
      ddrescueview
      dislocker
      dismember
      python3Packages.distorm3
      exiv2
      ext4magic
      extundelete
      foremost
      gef
      gzrt
      hivex
      ntfs3g
      ntfsprogs
      nwipe
      recoverjpeg
      safecopy
      sleuthkit
      srm
      stegseek
      testdisk
      wipe
      xorex
      capstone
      pdf-parser
      acquire
    ];

    fuzzers = with pkgs; [
      afl
      aflplusplus
      feroxbuster
      ffuf
      honggfuzz
      radamsa
      regexploit
      ssdeep
      wfuzz
      zzuf
      spike
    ];

    general = with pkgs; [
      chrony
      clamav
      curl
      flashrom
      htop
      httpie
      i2pd
      inetutils
      inxi
      iproute2
      iw
      lynx
      macchanger
      ngrok
      neovim
      parted
      pwgen
      util-linux
      wget
      coreutils
      killall
      usbutils
      ntfs3g
      ripgrep
      ripgrep-all
      ranger
      file
      tor
      torsocks
      xh
      python3
      firefox-bin
      exa
      bat
      fd
      procs
      sd
      grex
      linux-exploit-suggester
    ];

    git = with pkgs; [
      cargo-audit
      credential-detector
      detect-secrets
      # freeze
      garble
      gitjacker
      gitleaks
      gitls
      git-secret
      gokart
      osv-detector
      pip-audit
      python310Packages.safety
      secretscanner
      shhgit
      skjold
      trufflehog
      whispers
    ];

    #hardware = with pkgs; [
    #  arduino
    #  cantoolz
    #  # chipsec
    #  esptool
    #  extrude
    #  gallia
    #  hachoir
    #  python3Packages.angr
    #  python3Packages.angrop
    #  python3Packages.can
    #  python3Packages.pyi2cflash
    #  python3Packages.pyspiflash
    #];

    ids = with pkgs; [
      teler
      waf-tester
    ];

    info-gathering = with pkgs; [
      metabigor
      sn0int
      p0f
      theharvester
      urlhunter
      cloudbrute
      ntopng
      urlhunter
    ];

    cloud = with pkgs; [
      cloud-nuke
      cloudfox
    ];

    kubernetes = with pkgs; [
      cfripper
      # checkov
      kdigger
      kube-score
      kubeaudit
      kubescape
      popeye
      cirrusgo
    ];

    ldap = with pkgs; [
      python3Packages.ldapdomaindump
      adenum
      ldapmonitor
      ldapnomnom
      ldeep
      silenthound
    ];

    load-testing = with pkgs; [
      drill
      cassowary
      ddosify
      siege
      tsung
      vegeta
    ];

    misc = with pkgs; [
      badchars
      changetower
      deepsea
      doona
      honeytrap
      jwt-cli
      nmap-formatter
      pwntools
      python3Packages.pytenable
      snscrape
    ];

    mobile = with pkgs; [
      abootimg
      androguard
      apkeep
      apkleaks
      apktool
      dex2jar
      genymotion
      ghost
      simg2img
    ];

    network = with pkgs; [
      arping
      atftp
      bandwhich
      crackmapexec
      evillimiter
      ipcalc
      iperf2
      lftp
      mtr
      ncftp
      netcat-gnu
      netdiscover
      netkittftp
      netmask
      nload
      # nuttcp
      p0f
      putty
      pwnat
      rustcat
      sshping
      sslh
      wbox
      whois
      yersinia
    ];

    packet-generators = with pkgs; [
      boofuzz
      gping
      fping
      hping
      ostinato
      pktgen
      python3Packages.scapy
    ];

    passwords = with pkgs; [
      badtouch
      authoscope
      bruteforce-luks
      brutespray
      crunch
      hashcat
      hashcat-utils
      hashdeep
      john
      medusa
      nasty
      ncrack
      nth
      phrasendrescher
      # python38Packages.patator
      thc-hydra
      truecrack
      chntpw
      crowbar
      hcxtools
    ];

    port-scanners = with pkgs; [
      arp-scan
      ipscan
      masscan
      naabu
      nmap
      rustscan
      sx-go
      zmap
    ];

    protocols = with pkgs; [
      cifs-utils
      freerdp
      mosh
      net-snmp
      nfs-utils
      ntp
      openssh
      tailscale
      n2n
      openvpn
      samba
      step-cli
      tigervnc
      tightvnc
      wireguard-go
      wireguard-tools
      xrdp
    ];

    reporting = with pkgs; [
      cherrytree
      dos2unix
    ];

    reverse-engineering = with pkgs; [
      bingrep
      cutter
      gdb
      ghidra-bin
      jd-gui
      mono
      pev
      pwndbg
      python3Packages.binwalk
      python3Packages.binwalk-full
      python3Packages.karton-core
      python3Packages.malduck
      python3Packages.r2pipe
      python3Packages.unicorn
      radare2
      cutter
      rizin
      stacks
      unicorn 
      valgrind
      volatility3
      xortool
      yara
      zkar
      zydis
    ];

    services = with pkgs; [
      enum4linux
      enum4linux-ng
      ike-scan
      # python3Packages.ldapdomaindump
      ldeep #In-depth LDAP enumeration utility
      metasploit
      nikto
      nuclei
      checkip
      onesixtyone
      # siege
      swaks
      traitor
      # wafw00f
      uncover
      ruler
    ];

    smartcards = with pkgs; [
      cardpeek
      libfreefare
      mfcuk
      mfoc
      python3Packages.emv
    ];

    snmp = with pkgs; [
      onesixtyone
      snmpcheck
    ];

    sql = with pkgs; [sqlmap];

    ssh = with pkgs; [
      sshchecker
      ssh-audit
      ssh-mitm
      ssb
    ];

    ssl-tls = with pkgs; [
      ssldump
      sslsplit
      testssl
      tlsx
      sslscan
    ];

    supply-chain = with pkgs; [
      chain-bench
      witness
    ];

    terminals = with pkgs; [
      cutecom # A graphical serial terminal
      minicom # Modem control and terminal emulation program
      picocom # Minimal dumb-terminal emulation program
      socat   # Utility for bidirectional data transfer between two independent data channels
      x3270   # IBM 3270 terminal emulator for the X Window System
      tmate   # Instant Terminal Sharing

      # multiplexers
      # screen
      tmux
    ];

    terraform = with pkgs; [
      terrascan
      tfsec
    ];

    traffic = with pkgs; [
      anevicon
      dhcpdump
      dnstop
      driftnet
      dsniff
      goreplay
      httpdump
      junkie
      netsniff-ng
      ngrep
      secrets-extractor
      sniffglue
      tcpdump
      tcpflow
      tcpreplay
      termshark
      python3Packages.pyshark
      wireshark
      wireshark-cli
      zeek
    ];

    tunnels = with pkgs; [
      bore-cli
      corkscrew
      hans
      chisel
      httptunnel
      iodine
      sish
      stunnel
      udptunnel
      wstunnel
    ];

    voip = with pkgs; [
      sipp
      sipsak
      sipvicious
      sngrep
    ];

    vuln-analysis = with pkgs; [
      checksec
      chkrootkit
      lynis
      safety-cli
      tracee
      vulnix
    ];

    web = with pkgs; [
      bettercap
      brakeman
      burpsuite
      cameradar
      cariddi
      chopchop
      clairvoyance
      commix
      corsair
      crackql
      crlfsuite
      dalfox
      dirstalk
      dirb
      dismap
      dontgo403
      ettercap
      galer
      gau
      gobuster
      gospider
      gotestwaf
      gowitness
      graphqlmap
      graphw00f
      hakrawler
      hey
      httpx
      jaeles
      jsubfinder
      jwt-hack
      kiterunner
      mitmproxy
      mitmproxy2swagger
      monsoon
      mubeng
      nikto
      ntlmrecon
      photon
      proxify
      proxychains
      python3Packages.corsair-scan
      redsocks
      rshijack
      scraper
      slowlorust
      snallygaster
      subjs
      swaggerhole
      uddup
      wad
      webanalyze
      whatweb
      wprecon
      wpscan
      wuzz
      zap
      davtest
    ];

    windows = with pkgs; [
      adreaper
      certipy
      coercer
      enum4linux
      enum4linux-ng
      erosmb
      evil-winrm
      go365
      gomapenum
      kerbrute
      nbtscanner
      offensive-azure
      python3Packages.pypykatz
      # smbscan
    ];

    #wireless = with pkgs; [
    #  aircrack-ng
    #  airgeddon
    #  bully
    #  cowpatty
    #  horst
    #  kismet
    #  pixiewps
    #  reaverwps
    #  reaverwps-t6x
    #  wavemon
    #  wifite2
    #  util-linux
    #  gqrx
    #  kalibrate-hackrf
    #  kalibrate-rtl
    #  multimon-ng
    #  dbmonster
    #];
  };
in
  packages
