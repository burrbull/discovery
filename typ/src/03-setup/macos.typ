#import "../../config.typ": *

#h1((en: [macOS],
), offset: whole)
<install-macos>

#tr((
en: [
  All the tools can be installed using #link("http://brew.sh/")[Homebrew]:
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
