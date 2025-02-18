{
  pkgs,
  inputs,
  ...
}: let
  packages = {
    #https://search.nixos.org/packages?channel=22.05&from=0&size=50&sort=relevance&type=packages&query=oshka
    MySOF = with pkgs; [];

    # from https://github.com/redcode-labs/RedNix/blob/master/packages.nix

    RCL = with pkgs; [
      # sammler            # tool to extract useful data from documents
      # gosh               # Reverse/bind shell generator
      # godspeed           # Manager for reverse shells
      # snowcrash          # Polyglot payload generator
    ];

    # https://github.com/NixOS/nixpkgs/blob/master/lib/attrsets.nix
    # WTF?
    # applePrincessPackages = pkgs.lib.mapAttrsToList (_: v: v) inputs.hackpkgs.packages.${pkgs.system};

    archive-tools = with pkgs; [
      p7zip # A new p7zip fork with additional codecs and improvements
      unrar # Utility for RAR archives
      unzip # An extraction utility for archives compressed in .zip format

      # cabextract # Free Software for extracting Microsoft cabinet files
    ];

    bluetooth = with pkgs; [
      # bluez                    # Bluetooth support for Linux
      # bluewalker               # Simple command line Bluetooth LE scanner
      # redfang                  # A small proof-of-concept application to find non discoverable bluetooth devices
      # ubertooth                # Open source wireless development platform suitable for Bluetooth experimentation
    ];

    # ci = with pkgs; [
    #   oshka #Tool for extracting nested CI/CD supply chains and executing commands
    # ];

    containers = with pkgs; [
      # cdk-go                    # Container penetration toolkit
      # clair                     # Vulnerability Static Analysis for Containers
      # cliam                     # Cloud agnostic IAM permissions enumerator
      # cloudlist                 # Tool for listing assets from multiple cloud providers
      # dive                      # A tool for exploring each layer in a docker image
      # dockle                    # Container Image Linter for Security
      # grype                     # Vulnerability scanner for container images and filesystems
      # trivy                     # A simple and comprehensive vulnerability scanner for containers, suitable for CI
      # fwanalyzer                # Tool to analyze filesystem images
    ];

    databases = with pkgs; [
      # mongoaudit   # MongoDB auditing and pentesting tool
      sqlmap       # Automatic SQL injection and database takeover tool
    ];

    crypto = with pkgs; [
      (sage.override {
        requireSageTests = false;
        extraPythonPackages = p:
          with p; [
            pwntools     # CTF framework and exploit development library
            #pycryptodome # Python Cryptography Toolkit
            ##gmpy2       # GMP/MPIR, MPFR, and MPC interface to Python 2.6+ and 3.x
          ];
      })
    ];

    dns = with pkgs; [
      bind        # Domain name server  provides dig and nslookup
      amass       # In-Depth DNS Enumeration and Network Mapping
      dnsrecon    # DNS Enumeration script
      dnsenum     # A tool to enumerate DNS information
      dnsmon-go   # Tool to collect DNS traffic
      dnsmonster  # Passive DNS Capture and Monitoring Toolkit
      dnstake     # Tool to check missing hosted DNS zones
      findomain   # The fastest and cross-platform subdomain enumerator
      knockpy     # Tool to scan subdomains
      fierce      # DNS reconnaissance tool for locating non-contiguous IP space

      # aiodnsbrute # DNS brute force utility
      # dnstracer   # Determines where a given Domain Name Server (DNS) gets its information from, and follows the chain of DNS servers back to the servers which know the data
      # dnstwist    # Domain name permutation engine for detecting homograph phishing attacks
      # dnsx        # Fast and multi-purpose DNS toolkit
      # subfinder   # Subdomain discovery tool
      # subzerod    # Python module to help with the enumeration of subdomains
    ];

    forensics = with pkgs; [
      mat2       # A handy tool to trash your metadata
      pdf-parser # provides various tools to extract data from a PDF file.
      amoco      # Tool for analysing binaries
      exiv2      # A library and command-line utility to manage image metadata
      dislocker  # Read BitLocker encrypted partitions in Linux
      srm        # Delete files securely

      # ddrescueview               # A tool to graphically examine ddrescue mapfiles
      # fflib                      # Advanced forensic format library
      # dismember                  # Tool to scan memory for secrets
      # python310Packages.distorm3 # Disassembler library for x86/AMD64
      # dcfldd                     # An enhanced version of GNU dd
      # ddrescue                   # GNU ddrescue, a data recovery tool
      # ext4magic                  # Recover / undelete files from ext3 or ext4 partitions
      # extundelete                # Utility that can recover deleted files from an ext3 or ext4 partition
      # foremost                   # Recover files based on their contents
      # gef                        # A modern experience for GDB with advanced debugging features for exploit developers & reverse engineers
      # gzrt                       # The gzip Recovery Toolkit
      # hivex                      # Windows registry hive extraction library
      # ntfs3g                     # FUSE-based NTFS driver with full write support
      # nwipe                      # Securely erase disks
      # recoverjpeg                # Recover lost JPEGs and MOV files on a bogus memory card or disk
      # safecopy                   # Data recovery tool for damaged hardware
      # sleuthkit                  # A forensic/data recovery tool
      # stegseek                   # Tool to crack steganography
      # testdisk                   # Data recovery utilities
      # wipe                       # Secure file wiping utility
      # xorex                      # XOR Key Extractor
      # capstone                   # Advanced disassembly library
      # acquire                    # Abstraction over management of resources
    ];

    fuzzers = with pkgs; [
      wfuzz # Web content fuzzer to facilitate web applications assessments
      ffuf  # Fast web fuzzer written in Go

      # afl         # Powerful fuzzer via genetic algorithms and instrumentation
      # aflplusplus # A heavily enhanced version of AFL, incorporating many features and improvements from the community
      # feroxbuster # Fast, simple, recursive content discovery tool
      # honggfuzz   # A security oriented, feedback-driven, evolutionary, easy-to-use fuzzer
      # radamsa     # A general purpose fuzzer
      # regexploit  # Tool to find regular expressions which are vulnerable to ReDoS
      # ssdeep      # A program for calculating fuzzy hashes
      # zzuf        # Transparent application input fuzzer
      # spike       # A RISC-V ISA Simulator
    ];

    general = with pkgs; [
      chrony                  # Sets your computer's clock from time servers on the Net
      clamav                  # Antivirus engine designed for detecting Trojans, viruses, malware and other malicious threats
      curl                    # A command line tool for transferring files with URL syntax
      htop                    # An interactive process viewer
      httpie                  # A command line HTTP client whose goal is to make CLI human-friendly
      neovim                  # Vim text editor fork focused on extensibility and agility
      file                    # A program that shows the type of files
      tor                     # Anonymizing overlay network
      torsocks                # Wrapper to safely torify applications
      python310                 # GNAT Components Collection - Bindings to C libraries
      firefox-bin             # Mozilla Firefox, free web browser (binary package)
      exa                     # Replacement for 'ls' written in Rust
      bat                     # A cat(1) clone with syntax highlighting and Git integration
      fd                      # A simple, fast and user-friendly alternative to find
      procs                   # A modern replacement for ps written in Rust
      sd                      # Intuitive find & replace CLI (sed alternative)
      grex                    # A command-line tool for generating regular expressions from user-provided test cases
      linux-exploit-suggester # Tool designed to assist in detecting security deficiencies for given Linux kernel/Linux-based machine
      ngrok                   # Allows you to expose a web server running on your local machine to the internet
      inetutils               # Collection of common network programs
      ripgrep                 # A utility that combines the usability of The Silver Searcher with the raw speed of grep
      ripgrep-all             # Ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, and more
      wget                    # Tool for retrieving files using HTTP, HTTPS, and FTP
      killall                 #
      util-linux              # A set of system utilities for Linux
      ntfs3g                  # FUSE-based NTFS driver with full write support
      iproute2                # A collection of utilities for controlling TCP/IP networking and traffic control in Linux
      iw                      # Tool to use nl80211
      lynx                    # A text-mode web browser
      xh                      # Friendly and fast tool for sending HTTP requests
      git                     # Distributed version control system
      gh                      # GitHub CLI tool


      # flashrom   # Utility for reading, writing, erasing and verifying flash ROM chips
      # i2pd       # Minimal I2P router written in C++
      # inxi       # A full featured CLI system information tool
      # macchanger # A utility for viewing/manipulating the MAC address of network interfaces
      # parted     # Create, destroy, resize, check, and copy partitions
      # pwgen      # Password generator which creates passwords which can be easily memorized by a human
      # coreutils  # The basic file, shell and text manipulation utilities of the GNU operating system
      # usbutils   # Tools for working with USB devices, such as lsusb
      # ranger     # File manager with minimalistic curses interface
    ];

    git = with pkgs; [
      # cargo-audit              # Audit Cargo.lock files for crates with security vulnerabilities
      # credential-detector      # Tool to detect potentially hard-coded credentials
      # detect-secrets           # An enterprise friendly way of detecting and preventing secrets in code
      # garble                   # Obfuscate Go code by wrapping the Go toolchain
      # gitjacker                # Leak git repositories from misconfigured websites
      # gitleaks                 # Scan git repos (or files) for secrets
      # gitls                    # Tools to enumerate git repository URL
      # git-secret               # A bash-tool to store your private data inside a git repository
      # gokart                   # Static analysis tool for securing Go code
      # osv-detector             # Auditing tool for detecting vulnerabilities
      # pip-audit                # Tool for scanning Python environments for known vulnerabilities
      # python310Packages.safety # Checks installed dependencies for known vulnerabilities
      # secretscanner            # Tool to find secrets and passwords in container images and file systems
      # shhgit                   # Tool to detect secrets in repositories
      # skjold                   # Tool to Python dependencies against security advisory databases
      # trufflehog               # Searches through git repositories for high entropy strings and secrets, digging deep into commit history
      # whispers                 # Tool to identify hardcoded secrets in static structured text

      #  # freeze # Payload toolkit for bypassing EDRs
    ];

    hardware = with pkgs; [
      # arduino                      # Open-source electronics prototyping platform
      # cantoolz                     # Black-box CAN network analysis framework
      # chipsec                      # Platform Security Assessment Framework
      # esptool                      # ESP8266 and ESP32 serial bootloader utility
      # extrude                      # Tool to analyse binaries for missing security features
      # gallia                       # Pentesting framework with the focus on the automotive domain
      # hachoir                      # Python library to view and edit a binary stream
      # python310Packages.angr       # Powerful and user-friendly binary analysis platform
      # python310Packages.angrop     # ROP gadget finder and chain builder
      # python310Packages.can        # CAN support for Python
      # python310Packages.pyi2cflash # I2C eeprom device drivers in Python
      # python310Packages.pyspiflash # SPI data flash device drivers in Python
    ];

    ids = with pkgs; [
      # teler      # Real-time HTTP Intrusion Detection
      # waf-tester # Tool to test Web Application Firewalls (WAFs)
    ];

    info-gathering = with pkgs; [
      theharvester # Gather E-mails, subdomains and names from different public sources
      sn0int       # Semi-automatic OSINT framework and package manager
      sherlock     # Hunt down social media accounts by username across social networks

      # cloudbrute # Cloud enumeration tool
      # urlhunter  # Recon tool that allows searching shortened URLs
      # metabigor  # Tool to perform OSINT tasks
      # p0f        # Passive network reconnaissance and fingerprinting tool
      # ntopng     # High-speed web-based traffic analysis and flow collection tool
    ];

    cloud = with pkgs; [
      cloud-nuke # A tool for cleaning up your cloud accounts by nuking (deleting) all resources within it
      cloudfox # Tool for situational awareness of cloud penetration tests
    ];

    kubernetes = with pkgs; [
      # cfripper   # Tool for analysing CloudFormation templates
      # checkov    # Static code analysis tool for infrastructure-as-code
      # kdigger    # An in-pod context discovery tool for Kubernetes penetration testing
      # kube-score # Kubernetes object analysis with recommendations for improved reliability and security
      # kubeaudit  # Audit tool for Kubernetes
      # kubescape  # Tool for testing if Kubernetes is deployed securely
      # popeye     # A Kubernetes cluster resource sanitizer
      # cirrusgo   # Tool to scan SAAS and PAAS applications
    ];

    ldap = with pkgs; [
      # python310Packages.ldapdomaindump # Active Directory information dumper via LDAP
      # adenum                           # Tool to find misconfiguration through LDAP
      # ldapmonitor                      # Tool to monitor creation, deletion and changes to LDAP objects
      # ldapnomnom                       # Tool to anonymously bruteforce usernames from Domain controllers
      # ldeep                            # In-depth LDAP enumeration utility
      # silenthound                      # Tool to enumerate an Active Directory Domain
    ];

    load-testing = with pkgs; [
      # drill     # HTTP load testing application inspired by Ansible syntax
      # cassowary # Modern cross-platform HTTP load-testing tool written in Go
      # ddosify   # High-performance load testing tool, written in Golang
      # siege     # HTTP load tester
      # tsung     # A high-performance benchmark framework for various protocols including HTTP, XMPP, LDAP, etc
      # vegeta    # Versatile HTTP load testing tool
    ];

    misc = with pkgs; [
      nmap-formatter # Tool that allows you to convert nmap output
      pwntools       # CTF framework and exploit development library

      # badchars                    # HEX badchar generator for different programming languages
      # changetower                 # Tools to watch for webppage changes
      # deepsea                     # Phishing tool for red teams and pentesters
      # doona                       # A fork of the Bruteforce Exploit Detector Tool (BED)
      # honeytrap                   # Advanced Honeypot framework
      # jwt-cli                     # Super fast CLI tool to decode and encode JWTs
      # python310Packages.pytenable # Python library for the Tenable.io and TenableSC API
      # snscrape                    # A social networking service scraper
    ];

    mobile = with pkgs; [
      # apktool    # A tool for reverse engineering Android apk files
      # abootimg   # Manipulate Android Boot Images
      # androguard # Tool and Python library to interact with Android Files
      # apkeep     # A command-line tool for downloading APK files from various sources
      # apkleaks   # Scanning APK file for URIs, endpoints and secrets
      # dex2jar    # Tools to work with android .dex and java .class files
      # genymotion # Fast and easy Android emulation
      # ghost      # Android post-exploitation framework
      # simg2img   # Tool to convert Android sparse images to raw images
    ];

    network = with pkgs; [
      arping      # Broadcasts a who-has ARP packet on the network and prints answers
      netcat-gnu  # Utility which reads and writes data across network connections
      netdiscover # A network address discovering tool, developed mainly for those wireless networks without dhcp server, it also works on hub/switched networks
      atftp       # Advanced tftp tools
      bandwhich   # A CLI utility for displaying current network utilization
      putty       # A Free Telnet/SSH Client
      whois       # Intelligent WHOIS client from Debian
      iperf2      # Tool to measure IP bandwidth using UDP or TCP
      ipinfo      # Command Line Interface for the IPinfo API
      ipcalc      # Simple IP network calculator

      # crackmapexec # Tool for pentesting networks
      # evillimiter  # Tool that monitors, analyzes and limits the bandwidth
      # lftp         # A file transfer program supporting a number of network protocols
      # mtr          # A network diagnostics tool
      # ncftp        # Command line FTP (File Transfer Protocol) client
      # netkittftp   # Netkit TFTP client and server
      # netmask      # An IP address formatting tool
      # nload        # Monitors network traffic and bandwidth usage with ncurses graphs
      # nuttcp       # Network performance measurement tool
      # p0f          # Passive network reconnaissance and fingerprinting tool
      # pwnat        # ICMP NAT to NAT client-server communication
      # rustcat      # Port listener and reverse shell
      # sshping      # Measure character-echo latency and bandwidth for an interactive ssh session
      # sslh         # Applicative Protocol Multiplexer (e.g. share SSH and HTTPS on the same port)
      # wbox         # A simple HTTP benchmarking tool
      # yersinia     # A framework for layer 2 attacks
    ];

    packet-generators = with pkgs; [
      # python310Packages.scapy # A Python-based network packet manipulation program and library
      # boofuzz                 # Network protocol fuzzing tool
      # gping                   # Ping, but with a graph
      # fping                   # Send ICMP echo probes to network hosts
      # hping                   # A command-line oriented TCP/IP packet assembler/analyzer
      # ostinato                # A packet traffic generator and analyzer
      # pktgen                  # Traffic generator powered by DPDK
    ];

    passwords = with pkgs; [
      john          # John the Ripper password cracker
      ncrack        # Network authentication tool
      hashcat       # Fast password cracker
      hashcat-utils # Small utilities that are useful in advanced password cracking
      thc-hydra     # A very fast network logon cracker which support many different services

      # authoscope      # Scriptable network authentication cracker
      # bruteforce-luks # Cracks passwords of LUKS encrypted volumes
      # brutespray      # Tool to do brute-forcing from Nmap output
      # crunch          # Wordlist generator
      # hashdeep        # A set of cross-platform tools to compute hashes
      # medusa          # A speedy, parallel, and modular, login brute-forcer
      # nasty           # Recover the passphrase of your PGP or GPG-key
      # nth             # Module and CLI for the identification of hashes
      # phrasendrescher # A modular and multi processing pass phrase cracking tool
      # truecrack       # TrueCrack is a brute-force password cracker for TrueCrypt volumes. It works on Linux and it is optimized for Nvidia Cuda technology.
      # chntpw          # An utility to reset the password of any user that has a valid local account on a Windows system
      # crowbar         # A brute forcing tool that can be used during penetration tests
      # hcxtools        # Tools for capturing wlan traffic and conversion to hashcat and John the Ripper formats
    ];

    port-scanners = with pkgs; [
      arp-scan # ARP scanning and fingerprinting tool
      ipscan   # Fast and friendly network scanner
      masscan  # Fast scan of the Internet
      nmap     # A free and open source utility for network discovery and security auditing
      zmap     # Fast single packet network scanner designed for Internet-wide network surveys
      rustscan # Faster Nmap Scanning with Rust
      naabu    # Fast SYN/CONNECT port scanner
      sx-go    # Command-line network scanner
    ];

    protocols = with pkgs; [
      openssh         # An implementation of the SSH protocol
      tailscale       # The node agent for Tailscale, a mesh VPN built on WireGuard
      n2n             # Peer-to-peer VPN
      openvpn         # A robust and highly flexible tunneling application
      ntp             # An implementation of the Network Time Protocol
      samba           # The standard Windows interoperability suite of programs for Linux and Unix
      wireguard-go    # Userspace Go implementation of WireGuard
      wireguard-tools # Tools for the WireGuard secure network tunnel
      xrdp            # An open source RDP server

      # cifs-utils # Tools for managing Linux CIFS client filesystems
      # freerdp    # A Remote Desktop Protocol Client
      # mosh       # Mobile shell (ssh replacement)
      # net-snmp   # Clients and server for the SNMP network monitoring protocol
      # nfs-utils  # Linux user-space NFS utilities
      # step-cli   # A zero trust swiss army knife for working with X509, OAuth, JWT, OATH OTP, etc
      # tigervnc   # Fork of tightVNC, made in cooperation with VirtualGL
      # tightvnc   # Improved version of VNC
    ];

    reporting = with pkgs; [
      # cherrytree # An hierarchical note taking application
      # dos2unix   # Convert text files with DOS or Mac line breaks to Unix line breaks and vice versa
    ];

    reverse-engineering = with pkgs; [
      hexyl                     # A command-line hex viewer
      hexdump                   # hexdump
      python310Packages.binwalk # A tool for searching a given binary image for embedded files

      # python310Packages.binwalk-full # A tool for searching a given binary image for embedded files
      # bingrep                        # Greps through binaries from various OSs and architectures, and colors them
      # cutter                         # Free and Open Source Reverse Engineering Platform powered by rizin
      # gdb                            # The GNU Project debugger
      # ghidra-bin                     # A software reverse engineering (SRE) suite of tools developed by NSA's Research Directorate in support of the Cybersecurity mission
      # jd-gui                         # Fast Java Decompiler with powerful GUI
      # mono                           # Cross platform, open source .NET development framework
      # pev                            # A full-featured, open source, multiplatform command line toolkit to work with PE (Portable Executables) binaries
      # pwndbg                         # Exploit Development and Reverse Engineering with GDB Made Easy
      # python310Packages.karton-core  # Distributed malware processing framework
      # python310Packages.malduck      # Helper for malware analysis
      # python310Packages.r2pipe       # Interact with radare2
      # python310Packages.unicorn      # Python bindings for Unicorn CPU emulator engine
      # radare2                        # unix-like reverse engineering framework and commandline tools
      # cutter                         # Free and Open Source Reverse Engineering Platform powered by rizin
      # rizin                          # UNIX-like reverse engineering framework and command-line toolset.
      # stacks                         # Software pipeline for building loci from short-read sequences
      # unicorn                        # Lightweight multi-platform CPU emulator library
      # valgrind                       # Debugging and profiling tool suite
      # volatility3                    # Volatile memory extraction frameworks
      # xortool                        # Tool to analyze multi-byte XOR cipher
      # yara                           # The pattern matching swiss knife for malware researchers
      # zkar                           # Java serialization protocol analysis tool
      # zydis                          # Fast and lightweight x86/x86-64 disassembler library
    ];

    services = with pkgs; [
      enum4linux    # A tool for enumerating information from Windows and Samba systems
      enum4linux-ng # Windows/Samba enumeration tool
      metasploit    # Metasploit Framework - a collection of exploits
      nikto         # Web server scanner
      nuclei        # Tool for configurable targeted scanning
      checkip       # CLI tool that checks an IP address using various public services
      wafw00f       # Tool to identify and fingerprint Web Application Firewalls (WAF)

      # ike-scan                         # Tool to discover, fingerprint and test IPsec VPN servers
      # python310Packages.ldapdomaindump # Active Directory information dumper via LDAP
      # ldeep                            # In-depth LDAP enumeration utility
      # onesixtyone                      # Fast SNMP Scanner
      # siege                            # HTTP load tester
      # swaks                            # A featureful, flexible, scriptable, transaction-oriented SMTP test tool
      # traitor                          # Automatic Linux privilege escalation
      # uncover                          # API wrapper to search for exposed hosts
      # ruler                            # Tool to abuse Exchange services
    ];

    smartcards = with pkgs; [
      # cardpeek              # A tool to read the contents of ISO7816 smart cards
      # libfreefare           # The libfreefare project aims to provide a convenient API for MIFARE card manipulations
      # mfcuk                 # MiFare Classic Universal toolKit
      # mfoc                  # Mifare Classic Offline Cracker
      # python310Packages.emv # Implementation of the EMV chip-and-pin smartcard protocol
    ];

    snmp = with pkgs; [
      # onesixtyone # Fast SNMP Scanner
      # snmpcheck   # SNMP enumerator
    ];

    sql = with pkgs; [sqlmap];

    # ssh = with pkgs; [
    #                    # sshchecker # Dedicated SSH brute-forcing tool
    #                    # ssh-audit  # Tool for ssh server auditing
    #                    # ssh-mitm   # Tool for SSH security audits
    #                    # ssb        # Tool to bruteforce SSH server
    # ];

    ssl-tls = with pkgs; [
      # ssldump  # An SSLv3/TLS network protocol analyzer
      # sslsplit # Transparent SSL/TLS interception
      # testssl  # CLI tool to check a server's TLS/SSL capabilities
      # tlsx     # TLS grabber focused on TLS based data collection
      # sslscan  # Tests SSL/TLS services and discover supported cipher suites
    ];

    # supply-chain = with pkgs; [
    # chain-bench                 # An open-source tool for auditing your software supply chain stack for security compliance based on a new CIS Software Supply Chain benchmark
    # witness                     # A pluggable framework for software supply chain security. Witness prevents tampering of build materials and verifies the integrity of the build process from source to target
    # ];

    terminals = with pkgs; [
      tmate # Instant Terminal Sharing
      tmux  # Terminal multiplexer

      # cutecom # A graphical serial terminal
      # minicom # Modem control and terminal emulation program
      # picocom # Minimal dumb-terminal emulation program
      # socat   # Utility for bidirectional data transfer between two independent data channels
      # x3270   # IBM 3270 terminal emulator for the X Window System
      # screen  # A window manager that multiplexes a physical terminal
    ];

    terraform = with pkgs; [
      # terrascan # Detect compliance and security violations across Infrastructure
      # tfsec     # Static analysis powered security scanner for terraform code
    ];

    traffic = with pkgs; [
      tcpdump       # Network sniffer
      termshark     # A terminal UI for wireshark-cli, inspired by Wireshark
      httpdump      # Parse and display HTTP traffic from network device or pcap file
      ngrep         # Network packet analyzer
      wireshark     # Powerful network protocol analyzer
      wireshark-cli # Powerful network protocol analyzer

      # anevicon                  # UDP-based load generator
      # dhcpdump                  # A tool for visualization of DHCP packets as recorded and output by tcpdump to analyze DHCP server responses
      # dnstop                    # libpcap application that displays DNS traffic on your network
      # driftnet                  # Watches network traffic, and picks out and displays JPEG and GIF images for display
      # dsniff                    # collection of tools for network auditing and penetration testing
      # goreplay                  # Open-source tool for capturing and replaying live HTTP traffic
      # junkie                    # Deep packet inspection swiss-army knife
      # netsniff-ng               # Swiss army knife for daily Linux network plumbing
      # secrets-extractor         # Tool to check packets for secrets
      # sniffglue                 # Secure multithreaded packet sniffer
      # tcpflow                   # TCP stream extractor
      # tcpreplay                 # A suite of utilities for editing and replaying network traffic
      # python310Packages.pyshark # Python wrapper for tshark, allowing Python packet parsing using Wireshark dissectors
      # zeek                      # Network analysis framework much different from a typical IDS
    ];

    tunnels = with pkgs; [
      # bore-cli   # Rust tool to create TCP tunnels
      # corkscrew  # A tool for tunneling SSH through HTTP proxies
      # hans       # Tunnel IPv4 over ICMP
      # chisel     # TCP/UDP tunnel over HTTP
      # httptunnel # Creates a bidirectional virtual data connection tunnelled in HTTP requests
      # udptunnel  # Tunnels TCP over UDP packets
      # wstunnel   # Tunneling program over websocket protocol
      # iodine     # Tool to tunnel IPv4 data through a DNS server
      # sish       # HTTP(S)/WS(S)/TCP Tunnels to localhost
      # stunnel    # Universal tls/ssl wrapper
    ];

    voip = with pkgs; [
      # sipp       # The SIPp testing tool
      # sipsak     # SIP Swiss army knife
      # sipvicious # Set of tools to audit SIP based VoIP systems
      # sngrep     # A tool for displaying SIP calls message flows from terminal
    ];

    vuln-analysis = with pkgs; [
      # checksec   # Tool for checking security bits on executables
      # chkrootkit # Locally checks for signs of a rootkit
      # lynis      # Security auditing tool for Linux, macOS, and UNIX-based systems
      # safety-cli # Checks installed dependencies for known vulnerabilities
      # tracee     # Linux Runtime Security and Forensics using eBPF
      # vulnix     # NixOS vulnerability scanner
    ];

    web = with pkgs; [
      mitmproxy         # Man-in-the-middle proxy
      mitmproxy2swagger # Tool to automagically reverse-engineer REST APIs
      bettercap         # A man in the middle tool
      burpsuite         # An integrated platform for performing security testing of web applications
      ettercap          # Comprehensive suite for man in the middle attacks
      dirb              # A web content scanner
      whatweb           # Next generation web scanner
      httpx             # Fast and multi-purpose HTTP toolkit
      wprecon           # WordPress vulnerability recognition tool
      wpscan            # Black box WordPress vulnerability scanner
      wuzz              # Interactive cli tool for HTTP inspection
      zap               # Java application for web penetration testing
      nikto             # Web server scanner
      photon            # a lightning fast web crawler which extracts URLs, files, intel & endpoints from a target
      webanalyze        # Tool to uncover technologies used on websites
      swaggerhole       # Tool to searching for secret on swaggerhub
      proxychains       # Proxifier for SOCKS proxies
      gobuster          # Tool used to brute-force URIs, DNS subdomains, Virtual Host names on target web servers
      gospider          # Fast web spider written in Go
      monsoon           # Fast HTTP enumerator

      # brakeman                       # Static analysis security scanner for Ruby on Rails
      # cameradar                      # RTSP stream access tool
      # cariddi                        # Crawler for URLs and endpoints
      # chopchop                       # CLI to search for sensitive services/files/folders
      # clairvoyance                   # Tool to obtain GraphQL API schemas
      # commix                         # Automated Command Injection Exploitation Tool
      # corsair                        # Python module to check for Cross-Origin Resource Sharing (CORS) misconfigurations
      # crackql                        # GraphQL password brute-force and fuzzing utility
      # crlfsuite                      # CRLF injection (HTTP Response Splitting) scanner
      # dalfox                         # Tool for analysing parameter and XSS scanning
      # dirstalk                       # Tool to brute force paths on web servers
      # dismap                         # Asset discovery and identification tools
      # dontgo403                      # Tool to bypass 40X response codes
      # galer                          # Tool to fetch URLs from HTML attributes
      # gau                            # Tool to fetch known URLs
      # gotestwaf                      # Tool for API and OWASP attack simulation
      # gowitness                      # Web screenshot utility
      # graphqlmap                     # Tool to interact with a GraphQL endpoint
      # graphw00f                      # GraphQL Server Engine Fingerprinting utility
      # hakrawler                      # Web crawler for the discovery of endpoints and assets
      # hey                            # HTTP load generator, ApacheBench (ab) replacement
      # jaeles                         # Tool for automated Web application testing
      # jsubfinder                     # Tool to search for in Javascript hidden subdomains and secrets
      # jwt-hack                       # Tool for attacking JWT
      # kiterunner                     # Contextual content discovery tool
      # mubeng                         # Proxy checker and IP rotator
      # ntlmrecon                      # Information enumerator for NTLM authentication enabled web endpoints
      # proxify                        # Proxy tool for HTTP/HTTPS traffic capture
      # python310Packages.corsair-scan # Python module to check for Cross-Origin Resource Sharing (CORS) misconfigurations
      # redsocks                       # Transparent redirector of any TCP connection to proxy
      # rshijack                       # TCP connection hijacker
      # scraper                        # A tool to query HTML files with CSS selectors
      # slowlorust                     # Lightweight slowloris (HTTP DoS) tool
      # snallygaster                   # Tool to scan for secret files on HTTP servers
      # subjs                          # Fetcher for Javascript files
      # uddup                          # Tool for de-duplication URLs
      # wad                            # Tool for detecting technologies used by web applications
      # davtest                        # Tests WebDAV servers by uploading test files, and then optionally testing for command execution or other actions directly on the target
    ];

    windows = with pkgs; [
      enum4linux    # A tool for enumerating information from Windows and Samba systems
      enum4linux-ng # Windows/Samba enumeration tool
      kerbrute      # Kerberos bruteforce utility
      smbscan       # Tool to enumerate file shares

      # adreaper                   # Enumeration tool for Windows Active Directories
      # certipy                    # Tool to enumerate and abuse misconfigurations in Active Directory Certificate Services
      # coercer                    # Tool to automatically coerce a Windows server
      # erosmb                     # SMB network scanner
      # evil-winrm                 # WinRM shell for hacking/pentesting
      # go365                      # Office 365 enumeration tool
      # gomapenum                  # Tools for user enumeration and password bruteforce
      # nbtscanner                 # NetBIOS scanner written in Rust
      # offensive-azure            # Collection of offensive tools targeting Microsoft Azure
      # python310Packages.pypykatz # Mimikatz implementation in Python
    ];

    wireless = with pkgs; [
      # aircrack-ng      # Wireless encryption cracking tools
      # airgeddon        # Multi-use TUI to audit wireless networks.
      # bully            # Retrieve WPA/WPA2 passphrase from a WPS enabled access point
      # cowpatty         # Offline dictionary attack against WPA/WPA2 networks
      # horst            # Small and lightweight IEEE802.11 wireless LAN analyzer with a text interface
      # kismet           # Wireless network sniffer
      # pixiewps         # An offline WPS bruteforce utility
      # reaverwps        # Brute force attack against Wifi Protected Setup
      # reaverwps-t6x    # Online and offline brute force attack against WPS
      # wavemon          # Ncurses-based monitoring application for wireless network devices
      # wifite2          # Rewrite of the popular wireless network auditor, wifite
      # gqrx             # Software defined radio (SDR) receiver
      # kalibrate-hackrf # Calculate local oscillator frequency offset in hackrf devices
      # kalibrate-rtl    # Calculate local oscillator frequency offset in RTL-SDR devices
      # multimon-ng      # Multimon is a digital baseband audio protocol decoder
      # dbmonster        # Tool to track WiFi devices by signal strength
    ];
  };
in
  packages # 
