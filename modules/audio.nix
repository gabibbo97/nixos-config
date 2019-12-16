{ config, pkgs, ... }: {
  # Enable PulseAudio
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    daemon.config = {
      alternate-sample-rate = 44100;
      avoid-resampling = "yes";
      default-sample-format = "float32ne";
      default-sample-rate = 48000;
      flat-volumes = "yes";
    };
  };
}
