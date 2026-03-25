class NooxMac < Formula
  desc "Use an Android tablet as a macOS USB terminal display (macOS host bridge)"
  homepage "https://github.com/charlie-xing/noox"
  url "https://github.com/charlie-xing/noox/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  head "https://github.com/charlie-xing/noox.git", branch: "master"

  # Build-time dependency only — Rust is not needed at runtime.
  depends_on "rust" => :build

  # noox-mac has NO runtime brew dependencies:
  # libusb is statically linked via rusb's "vendored" feature.
  # All other dependencies are standard macOS frameworks
  # (CoreFoundation, IOKit, Security).

  def install
    system "cargo", "build", "--release", "-p", "noox-mac",
           *std_cargo_args(root: buildpath, path: "crates/noox-mac")
    bin.install "target/release/noox-mac"
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
