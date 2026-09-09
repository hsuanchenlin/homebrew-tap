class Echoforge < Formula
  desc "Local control and inspection tool for EchoForge macOS app"
  homepage "https://github.com/hsuanchenlin/EchoForge"
  version "0.9.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsuanchenlin/EchoForge/releases/download/0.9.5/echoforge-0.9.5-darwin-arm64.tar.gz"
      sha256 "6b89d37e82da36a30c21065593f8dacb866b4e7ebbd33c50d4bee07400667eb7"
    end
  end

  def install
    bin.install "echoforge"
  end

  test do
    assert_match "echoforge", shell_output("#{bin}/echoforge --version")
  end
end
