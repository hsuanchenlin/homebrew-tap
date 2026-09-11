class Yazi < Formula
  desc "Blazing fast terminal file manager with built-in AI summaries and renames"
  homepage "https://github.com/hsuanchenlin/yazi"
  version "26.9.2-ai"

  head "https://github.com/hsuanchenlin/yazi.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsuanchenlin/yazi/releases/download/v26.9.2-ai/yazi-26.9.2-ai-darwin-arm64.tar.gz"
      sha256 "69e5f87540479e89769afc452342978daf7246ebdce6471b58ac44c16c7cdb3a"
    end
  end

  depends_on "rust" => :build if build.head?

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args(path: "yazi-fm")
      system "cargo", "install", *std_cargo_args(path: "yazi-cli")
      bin.install "scripts/ya-summarize", "scripts/ya-rename"
    else
      bin.install "yazi"
      bin.install "ya"
      bin.install "ya-summarize"
      bin.install "ya-rename"
    end
  end

  test do
    assert_match(/yazi/i, shell_output("#{bin}/yazi --version"))
    assert_match(/\bya\b/i, shell_output("#{bin}/ya --version"))
    assert_predicate bin/"ya-summarize", :exist?
    assert_predicate bin/"ya-rename", :exist?
  end
end
