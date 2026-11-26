#import "../../config.typ": *

#h1((en: [Windows],
), offset: whole)

= #tr((
  en: [`arm-none-eabi-gdb`],
))
<install-windows>

#let url_gnu_toolchain = "https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads"
#tr((
en: [
  ARM provides `.exe` installers for Windows. Grab one from #link(url_gnu_toolchain)[here],
  and follow the instructions. Just before the installation process
  finishes tick/select the "Add path to environment variable" option. Then
  verify that the tools are in your `%PATH%`:
]))

```console
$ arm-none-eabi-gcc -v
(..)
gcc version 5.4.1 20160919 (release) (..)
```

= #tr((
  en: [PuTTY],
))

#let url_putty = "http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html"
#tr((
en: [
  Download the latest `putty.exe` from #link(url_putty)[this site]
  and place it somewhere in your `%PATH%`.
]))

#tr((
en: [
  Now, go to the #link(<verify-installation>)[next section].
]))
