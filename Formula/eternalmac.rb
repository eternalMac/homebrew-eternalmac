class Eternalmac < Formula
  desc "Turn a Mac Mini into a personal devserver"
  homepage "https://github.com/eternalMac/eternalMac"
  url "https://github.com/eternalMac/eternalMac/releases/download/v0.1.1/eternalmac-0.1.1-aarch64-apple-darwin.tar.gz"
  sha256 "e3875c2960ec3b25d2ee5df8cc84eb17b5e6cc5f6f169f2383a640b11835107b"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on "et"
  depends_on :macos
  depends_on "mutagen-io/mutagen/mutagen"
  depends_on "tmux"

  def install
    bin.install "eternalMac"
    prefix.install "LICENSE", "NOTICE"
  end

  def caveats
    <<~EOS
      Run `eternalMac setup server` on the Mac Mini.
      Run `eternalMac setup client` on the laptop.

      Setup may prompt for role-specific permissions and can install the
      Tailscale cask if it is missing.
    EOS
  end

  test do
    assert_match "Turn a Mac Mini into a personal devserver", shell_output("#{bin}/eternalMac --help")
    assert_match "Show the current server status", shell_output("#{bin}/eternalMac status --help")
  end
end
