#import "../../config.typ": *

#h1((en: [Linux],
), offset: whole)
<install-linux>

#tr((
en: [
  Here are the installation commands for a few Linux distributions.
]))

= #tr((
  en: [Ubuntu 20.04 or newer / Debian 10 or newer],
))

#quote(block: true)[
#tr((
en: [
  *NOTE* `gdb-multiarch` is the GDB command you'll use to debug
  your ARM Cortex-M programs
]))
]

```console
$ sudo apt-get install \
  gdb-multiarch \
  minicom
```

= #tr((
  en: [Fedora 32 or newer],
))

#quote(block: true)[
#tr((
en: [
  *NOTE* `gdb` is the GDB command you'll use to debug your ARM
  Cortex-M programs
]))
]

```console
$ sudo dnf install \
  gdb \
  minicom
```

= #tr((
  en: [Arch Linux],
))

#quote(block: true)[
#tr((
en: [
  *NOTE* `arm-none-eabi-gdb` is the GDB command you'll use to debug
  your ARM Cortex-M programs
]))
]

```console
$ sudo pacman -S \
  arm-none-eabi-gdb \
  minicom
```

= #tr((
  en: [Other distros],
))

#quote(block: true)[
#tr((
en: [
  *NOTE* `arm-none-eabi-gdb` is the GDB command you'll use to debug
  your ARM Cortex-M programs
]))
]

#tr((
en: [
  For distros that don't have packages for
  #link("https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads")[ARM's pre-built toolchain],
  download the "Linux 64-bit" file and put its `bin` directory on your
  path. Here's one way to do it:
]))

```console
$ mkdir -p ~/local && cd ~/local
$ tar xjf /path/to/downloaded/file/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2
```

#tr((
en: [
  Then, use your editor of choice to append to your `PATH` in the
  appropriate shell init file (e.g.~`~/.zshrc` or `~/.bashrc`):
]))

```
PATH=$PATH:$HOME/local/gcc-arm-none-eabi-9-2020-q2-update/bin
```

= #tr((
  en: [udev rules],
))
<linux-udev-rules>

#tr((
en: [
  These rules let you use USB devices like the micro:bit without root
  privilege, i.e.~`sudo`.
]))

#tr((
en: [
  Create this file in `/etc/udev/rules.d` with the content shown below.
]))

```console
$ cat /etc/udev/rules.d/69-microbit.rules
```

```text
# CMSIS-DAP for microbit

ACTION!="add|change", GOTO="microbit_rules_end"

SUBSYSTEM=="usb", ATTR{idVendor}=="0d28", ATTR{idProduct}=="0204", TAG+="uaccess"

LABEL="microbit_rules_end"
```

#tr((
en: [
  Then reload the udev rules with:
]))

```console
$ sudo udevadm control --reload
```

#tr((
en: [
  If you had any board plugged to your computer, unplug them and then plug
  them in again, or run the following command.
]))

```console
$ sudo udevadm trigger
```

#tr((
en: [
  Now, go to the #link(<verify-installation>)[next section].
]))
