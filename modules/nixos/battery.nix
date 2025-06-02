{ lib, ... }:
{
  # This bro is not compatible with auto-cpufreq
  services.power-profiles-daemon.enable = lib.mkForce false;

  # Better process scheduling
  services.system76-scheduler.enable = true; # (sacrifices power performance a bit for lower latency)
  services.system76-scheduler.settings.cfsProfiles.enable = true;

  # Automatic CPU frequency adjustments on the fly
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      energy_performance_preference = "power";
      platform_profile = "low-power";
      turbo = "never";
    };
    charger = {
      governor = "powersave";
      energy_performance_preference = "power";
      platform_profile = "low-power";
      turbo = "never";
    };
  };
}
