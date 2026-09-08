class ControlCenter < Formula
  desc "Local keyboard-first TUI launcher and configurator for CLI tools"
  homepage "https://github.com/hsuanchenlin/control-center"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsuanchenlin/control-center/releases/download/v0.2.0/control-center_0.2.0_darwin_arm64.tar.gz"
      sha256 "336ee28879ad2fdf63f8a7efef186399319992e0bb124be8044042783d573a48"
    else
      url "https://github.com/hsuanchenlin/control-center/releases/download/v0.2.0/control-center_0.2.0_darwin_amd64.tar.gz"
      sha256 "c3ad3bf693419ac912f231a50b9c845d166d97c389c7a2e9961ef93ba37f1186"
    end
  end

  def install
    bin.install "control-center"
  end

  test do
    assert_match "control-center", shell_output("#{bin}/control-center --help")
  end
end
