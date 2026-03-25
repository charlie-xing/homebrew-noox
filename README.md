# homebrew-noox

Homebrew tap for [noox](https://github.com/charlie-xing/noox) — use an Android tablet as a macOS USB terminal display.

## Install

```bash
brew install charlie-xing/noox/noox-mac
```

## Usage

**USB AOA mode** (recommended — no adb needed):
```bash
noox-mac --usb
```

**TCP mode** (requires `adb reverse` first):
```bash
adb reverse tcp:7878 tcp:7878
noox-mac --port 7878
```

## Requirements

- macOS (Apple Silicon or Intel)
- Android tablet running the noox app
- USB cable

No external dependencies — libusb is statically linked into the binary.

## Contact

xjohn1666@gmail.com
