class Eternalmac < Formula
  desc "Turn a Mac Mini into a personal devserver"
  homepage "https://github.com/eternalMac/eternalMac"
  url "https://github.com/eternalMac/eternalMac/releases/download/v0.1.0/eternalmac-0.1.0-aarch64-apple-darwin.tar.gz"
  sha256 "632bb440afb47711e1b3c7f56e8d0f53d105e09c18521e4b64649f7335a7b202"
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
