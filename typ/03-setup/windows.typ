= Windows
<windows>
== `arm-none-eabi-gdb`
<arm-none-eabi-gdb>
ARM provides `.exe` installers for Windows. Grab one from
#link("https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads")[here],
and follow the instructions. Just before the installation process
finishes tick/select the "Add path to environment variable" option. Then
verify that the tools are in your `%PATH%`:

```console
$ arm-none-eabi-gcc -v
(..)
gcc version 5.4.1 20160919 (release) (..)
```

== PuTTY
<putty>
Download the latest `putty.exe` from
#link("http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html")[this site]
and place it somewhere in your `%PATH%`.

Now, go to the #link("verify.md")[next section].
