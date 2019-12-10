{ config, pkgs, ... }:
{
  # Utilities
  environment.systemPackages = with pkgs; [
    kind
    kubectl
    kubernetes-helm
    minikube
    stern
  ];
}