class ControlCenter < Formula
  desc "Local keyboard-first TUI launcher and configurator for CLI tools"
  homepage "https://github.com/hsuanchenlin/control-center"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsuanchenlin/control-center/releases/download/v0.4.0/control-center_0.4.0_darwin_arm64.tar.gz"
      sha256 "7863b749e84b26eb5e7a07c67cd64cf86a2cf3d917788dbaa4779d9ed8e6c66f"
    else
      url "https://github.com/hsuanchenlin/control-center/releases/download/v0.4.0/control-center_0.4.0_darwin_amd64.tar.gz"
      sha256 "bcd03623c4c29c2859d15820412595235e7fd4d996f1c89a69cfd685badda87b"
    end
  end

  def install
    bin.install "control-center"
  end

  test do
    assert_match "control-center", shell_output("#{bin}/control-center --help")
  end
end
