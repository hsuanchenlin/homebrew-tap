class ControlCenter < Formula
  desc "Local keyboard-first TUI launcher and configurator for CLI tools"
  homepage "https://github.com/hsuanchenlin/control-center"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsuanchenlin/control-center/releases/download/v0.3.0/control-center_0.3.0_darwin_arm64.tar.gz"
      sha256 "657d2d1b3f61388bb066557d73b91e8057f655b88b43a607f0c9565a0a36240e"
    else
      url "https://github.com/hsuanchenlin/control-center/releases/download/v0.3.0/control-center_0.3.0_darwin_amd64.tar.gz"
      sha256 "abf53eded018956477272c5155ddf8a15afed5da76e8f5c4093af2bdab1ae1d8"
    end
  end

  def install
    bin.install "control-center"
  end

  test do
    assert_match "control-center", shell_output("#{bin}/control-center --help")
  end
end
