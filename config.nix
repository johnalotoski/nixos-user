let unstable = import ~/.nix-defexpr/channels/nixunstable {};
in {
  allowUnfree = true;
  packageOverrides = super: let self = super.pkgs; in {

    # Listing declarative packages in this set
    # rather than a buildEnv allows them to still
    # be visible to `nix-env -qc` and similar commands.
    # Note, however, that removing packages from here
    # won't remove them from the user environment
    # which will still need to be done imperatively.
    # Compare that to the buildEnv approach which will
    # remove packages upon removing them declaratively
    # and re-installing the resulting buildEnv.
    #
    # Install this package set with:
    #   nix-env -iA <channel_name>.jlotoski [--dry-run]
    #
    # Check for updates against various channels with:
    #   nix-env qc -f <channel_path>
    #   Where <channel_path> example is:
    #     ~/.nix-defexpr/channels/<channel_name>

    jlotoski = rec {

      # The following declarative apps are listed
      # in alphabetical order in each of the following sections:
      #
      # 1) kdeApplications (per package attribute path)
      # 2) kde related applications (not in kdeApplications)
      # 3) Other software
      #
      # Inherit paths, meta priorities and package overrides
      # are applied where necessary.


      hiPrio = super.lib.hiPrio;
      lowPrio = super.lib.lowPrio;


      # KDE apps selected from:
      # https://nixos.org/nixos/packages.html#
      # and
      # https://github.com/NixOS/nixpkgs/issues/6899
      # also see:
      # https://github.com/NixOS/nixpkgs/issues/38887


      #
      # 1) kdeApplications pkgs, alphabetized
      #

      inherit (super.kdeApplications) akonadi-calendar
      akonadi-contacts;
      akonadi-mime = lowPrio super.kdeApplications.akonadi-mime;
      inherit (super.kdeApplications) akonadi-notes
      akonadi-search
      akonadiconsole
      kdf
      kleopatra
      kmail
      kmail-account-wizard
      kmailtransport
      kolourpaint
      kontact
      kontactinterface
      korganizer
      kdepim-apps-libs;
      kdepim-runtime = lowPrio super.kdeApplications.kdepim-runtime;
      inherit (super.kdeApplications) kmix
      kompare
      kpimtextedit
      ksystemlog;
      # ksystemlog = unstable.kdeApplications.ksystemlog;
      inherit (super.kdeApplications) libkdepim;
      okteta = lowPrio super.kdeApplications.okteta;
      inherit (super.kdeApplications) pim-data-exporter
      pim-sieve-editor
      pimcommon
      spectacle;

      #
      # 2) kde related pkgs, alphabetized
      #

      akonadi = lowPrio super.akonadi;
      inherit (super) ark
      filelight
      gwenview
      kate
      kaddressbook
      kcalc
      kcolorchooser
      # kdeplasma-addons
      kgpg
      kgraphviewer
      konversation
      ktorrent
      okular;

      #
      # 3) Other software, alphabetized
      #

      inherit (super) adobe-reader
      ag
      atom
      bc
      bind
      byobu
      calc
      cointop
      firefox
      fish;
      gitFull = hiPrio super.gitAndTools.gitFull;
      inherit (super) gitkraken
      glxinfo
      gcc;
      inherit (super.python36Packages) glances;
      inherit (super) gnumake
      google-chrome
      graphviz
      grive2
      hping
      inkscape;
      inherit (super.python27Packages) ipython;
      inherit (super.jetbrains) pycharm-community;
      inherit (super) jq
      jupyter
      keepass
      libreoffice-fresh
      ncat
      ncdu
      nix-diff
      nix-index;
      nixops = unstable.nixopsUnstable;
      inherit (super) notepadqq
      nox
      obs-studio
      openssl
      packet
      patchelf
      pidgin
      pwgen
      python3;
      inherit (super.qt5) full;                                      # For KDE shortcuts, etc
      inherit (super) quiterss
      remmina
      s-tui
      shellcheck
      skanlite
      slack
      sqlite
      sqlite-interactive
      sqlitebrowser;
      sublime-merge = unstable.sublime-merge;
      inherit (super) sublime3
      syncthing
      tdesktop
      thunderbird
      tig
      tmux
      tree
      unzip
      vagrant
      vlc
      wkhtmltopdf
      xsane
      yadm
      zip
      zlib
      zoom-us;
    };
  };
}
