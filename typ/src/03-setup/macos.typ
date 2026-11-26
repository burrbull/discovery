#import "../../config.typ": *

#h1((en: [macOS],
), offset: whole)
<install-macos>

#let ln_brew = link("http://brew.sh/")[Homebrew]
#tr((
en: [
  All the tools can be installed using #ln_brew:
]))

```console
$ # ARM GCC debugger
$ brew install arm-none-eabi-gdb

$ # Minicom
$ brew install minicom

$ # lsusb (list connected USB devices)
$ brew install lsusb
```

#tr((
en: [
  That's all! Go to the #link(<verify-installation>)[next section].
]))
