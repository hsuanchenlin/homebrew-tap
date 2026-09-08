class ControlCenter < Formula
  desc "Local keyboard-first TUI launcher and configurator for CLI tools"
  homepage "https://github.com/hsuanchenlin/control-center"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsuanchenlin/control-center/releases/download/v0.1.0/control-center_0.1.0_darwin_arm64.tar.gz"
      sha256 "f4223e3bb4e9c066ef7a0a351501c6e2dcbbe308388c02178507c6cd141d3e17"
    else
      url "https://github.com/hsuanchenlin/control-center/releases/download/v0.1.0/control-center_0.1.0_darwin_amd64.tar.gz"
      sha256 "d4576a5d5e043d5bb698ec2b5a3d554fd131aa557cdc6e778bd50dfc25270f32"
    end
  end

  def install
    bin.install "control-center"
  end

  test do
    assert_match "control-center", shell_output("#{bin}/control-center --help")
  end
end
