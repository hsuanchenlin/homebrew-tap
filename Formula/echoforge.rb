class Echoforge < Formula
  desc "Local control and inspection tool for EchoForge macOS app"
  homepage "https://github.com/hsuanchenlin/EchoForge"
  version "0.9.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsuanchenlin/EchoForge/releases/download/0.9.6/echoforge-0.9.6-darwin-arm64.tar.gz"
      sha256 "2c01661b5e5c9766800d76e20809fcc3fcfc00b9e78ff47d58da39958de9bdde"
    end
  end

  def install
    bin.install "echoforge"
  end

  test do
    assert_match "echoforge", shell_output("#{bin}/echoforge --version")
  end
end
