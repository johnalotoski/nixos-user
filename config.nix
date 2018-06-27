{
  packageOverrides = pkgs: with pkgs; {
    jlotoski = pkgs.buildEnv {
      name = "jlotoski";
      paths = [ 
        byobu
        git
        tmux
      ];
    };
  };
}
