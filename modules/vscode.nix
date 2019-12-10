{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.vscode-with-extensions.override {
      vscodeExtensions = with pkgs.vscode-extensions; [
        bbenoist.Nix
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [

      ];
    })
  ];
}
