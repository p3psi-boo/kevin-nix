self: super: {
  linux_gru_4_4 = super.callPackage ./linux_gru_4_4 {
    kernelPatches = with self; [
      kernelPatches.bridge_stp_helper
      kernelPatches.cpu-cgroup-v2."4.4"
      kernelPatches.modinst_arg_list_too_long

      { name = "arch-1"; patch = ./linux_gru_4_4/0001-Input-atmel_mxt_ts-Use-KERN_DEBUG-loglevel-for-statu.patch; }
      { name = "arch-2"; patch = ./linux_gru_4_4/0002-Revert-CHROMIUM-drm-rockchip-Add-PSR-residency-debug.patch; }
      { name = "arch-3"; patch = ./linux_gru_4_4/0003-temporary-hack-to-fix-console-output.patch; }
    ];
  };

  linuxPackages_gru_4_4 = super.linuxPackagesFor self.linux_gru_4_4;

  linux_gru_4_4_86 = super.callPackage ./linux_gru_4_4_86 {
    kernelPatches = with self; [
      kernelPatches.bridge_stp_helper
      kernelPatches.cpu-cgroup-v2."4.4"
      kernelPatches.modinst_arg_list_too_long

      { name = "arch-1"; patch = ./linux_gru_4_4_86/0001-Input-atmel_mxt_ts-Use-KERN_DEBUG-loglevel-for-statu.patch; }
      { name = "arch-2"; patch = ./linux_gru_4_4_86/0002-Revert-CHROMIUM-drm-rockchip-Add-PSR-residency-debug.patch; }
      { name = "arch-3"; patch = ./linux_gru_4_4_86/0003-temporary-hack-to-fix-console-output.patch; }
      { name = "arch-4"; patch = ./linux_gru_4_4_86/0004-skip-HDCP-setup.patch; }
    ];
  };

  linuxPackages_gru_4_4_86 = super.linuxPackagesFor self.linux_gru_4_4_86;

  rockchip-linux-libmali = super.callPackage ./rockchip-linux-libmali/generic.nix {
    driverName = "libmali-midgard-t86x-r13p0-wayland.so";
  };

  libmali-gldriver = super.callPackage ./rockchip-linux-libmali/gldriver.nix {};

  rockchip-linux-libmali-gldriver = self.libmali-gldriver {
    libmali = self.rockchip-linux-libmali;
  };

  panfrost = super.callPackage ./panfrost.nix {};

  otf2bdf = super.callPackage ./otf2bdf {};

  ttf-console-font = super.callPackage ./ttf-console-font.nix {};
}
