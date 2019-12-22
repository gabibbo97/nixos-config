{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc # C
    go # Go
    python3 python3Packages.virtualenvwrapper # Python
    jdk # Java
  ] ++ [
    android-studio
  ] ++ [
    (eclipses.eclipseWithPlugins {
      eclipse = pkgs.eclipses.eclipse-sdk;
      jvmArgs = [ "-Xmx2g" ];
      plugins = with eclipses.plugins;
        [
          cdt
          jdt
        ];
    })
  ];
}
