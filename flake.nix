{
  description = "8086 + masm 5.0";

  inputs.nixpkgs.url = "https://channels.nixos.org/nixos-21.11/nixexprs.tar.xz";

  outputs = { self, nixpkgs }:
  let pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    devShell.x86_64-linux = pkgs.mkShell {
      buildInputs = with pkgs; [
        emu2
        (vim_configurable.customize {
          name = "vim";
          vimrcConfig.customRC = ''
            set nocompatible
            set noundofile
            set nobackup

            set tabstop=8
            set shiftwidth=8
            set expandtab
            set smarttab
            set backspace=indent,eol,start
            
            syntax on
            set number
          '';
        })
      ];
      shellHook = ''
      alias masm="emu2 masm/MASM.EXE"
      alias link="emu2 masm/LINK.EXE"
      alias debug="emu2 masm/DEBUG.EXE"
      '';
    };
  };
}
