class Yazi < Formula
  desc "Blazing fast terminal file manager with built-in AI summaries and renames"
  homepage "https://github.com/hsuanchenlin/yazi"
  version "26.9.1-ai"

  head "https://github.com/hsuanchenlin/yazi.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsuanchenlin/yazi/releases/download/v26.9.1-ai/yazi-26.9.1-ai-darwin-arm64.tar.gz"
      sha256 "c2b103cb6bd68919230b087c51364ee7771dd04b8727e0e9fdd22b7608f28435"
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
