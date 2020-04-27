let unstable = import ~/.nix-defexpr/channels/nixunstable {};
in {
  # allowBroken = true;
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
    #   nix-env -iA <channel_name>.user [--dry-run]
    #
    # Check for updates against various channels with:
    #   nix-env qc -f <channel_path>
    #   Where <channel_path> example is:
    #     ~/.nix-defexpr/channels/<channel_name>

    user = rec {

      # Inherit paths, meta priorities and package overrides
      # are applied where necessary.

      hiPrio = super.lib.hiPrio;
      lowPrio = super.lib.lowPrio;

      inherit (super)
      cointop
      firefox
      google-chrome
      gimp
      grive2
      inkscape
      libreoffice-fresh
      sublime-merge;

      inherit (super.jetbrains) pycharm-community;
    };
  };
}
