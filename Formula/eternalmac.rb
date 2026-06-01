class Eternalmac < Formula
  desc "Turn a Mac Mini into a personal devserver"
  homepage "https://github.com/eternalMac/eternalMac"
  url "https://github.com/eternalMac/eternalMac/releases/download/v0.2.0/eternalmac-0.2.0-aarch64-apple-darwin.tar.gz"
  sha256 "0bbe0460c2bf1653e07be3606b2499e12b7e751944e5c062c308a2e83d3013a5"
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
      Server setup may ask for your macOS password to start Eternal Terminal
      through Homebrew's root service.
    EOS
  end

  test do
    assert_match "Turn a Mac Mini into a personal devserver", shell_output("#{bin}/eternalMac --help")
    assert_match "Show the current server status", shell_output("#{bin}/eternalMac status --help")
  end
end
