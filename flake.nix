{
  description = "8086 + masm 5.0";

  inputs.nixpkgs.url = "https://channels.nixos.org/nixos-21.11/nixexprs.tar.xz";

  outputs = { self, nixpkgs }:
  let pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    devShell.x86_64-linux = pkgs.mkShell {
      buildInputs = with pkgs; [
        vim
        emu2
      ];
      shellHook = ''
      alias masm="emu2 masm/MASM.EXE"
      alias link="emu2 masm/LINK.EXE"
      alias debug="emu2 masm/DEBUG.EXE"
      '';
    };
  };
}
