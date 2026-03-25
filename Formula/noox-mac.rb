class NooxMac < Formula
  desc "Use an Android tablet as a macOS USB terminal display (macOS host bridge)"
  homepage "https://github.com/charlie-xing/noox"
  url "https://github.com/charlie-xing/noox-releases/releases/download/v0.1.0/noox-mac-0.1.0-macos.tar.gz"
  sha256 "631d873ae595f8a528be364c647c3633594895d3b73cb958221b056b68929bdd"
  version "0.1.0"
  license "MIT"

  # Pre-built universal binary (arm64 + x86_64).
  # No build-time or runtime dependencies:
  # libusb is statically linked; all other deps are standard macOS frameworks.

  def install
    bin.install "noox-mac"
  end

  def caveats
    <<~EOS
      USB AOA mode (recommended — no adb needed):
        noox-mac --usb

      TCP mode (requires adb reverse first):
        adb reverse tcp:7878 tcp:7878
        noox-mac --port 7878

      Before connecting, make sure the noox app is running on the Android tablet.
    EOS
  end

  test do
    assert_match "Android tablet USB terminal bridge", shell_output("#{bin}/noox-mac --help")
  end
end
