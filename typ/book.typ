#import "config.typ": *
#import "mdbook/lib.typ": book

#let sources = (
  "index": (
    content: include "README.typ",
    title: tr((
      en: [Introduction],
    )),
  ),
  "01-background/index": (
    content: include "01-background/README.typ",
    title: tr((
      en: [Background],
    )),
  ),
  "02-requirements/index": (
    content: include "02-requirements/README.typ",
    title: tr((
      en: [Hardware/knowledge requirements],
    )),
  ),
  "03-setup/index": (
    content: include "03-setup/README.typ",
    title: tr((
      en: [Setting up a development environment],
    )),
    sub: (
      "03-setup/linux": (
        content: include "03-setup/linux.typ",
        title: tr((
          en: [Linux],
        )),
      ),
      "03-setup/windows": (
        content: include "03-setup/windows.typ",
        title: tr((
          en: [Windows],
        )),
      ),
      "03-setup/macos": (
        content: include "03-setup/macos.typ",
        title: tr((
          en: [macOS],
        )),
      ),
      "03-setup/verify": (
        content: include "03-setup/verify.typ",
        title: tr((
          en: [Verify the installation],
        )),
      ),
      "03-setup/IDE": (
        content: include "03-setup/IDE.typ",
        title: tr((
          en: [Setting up your IDE],
        )),
      ),
    ),
  ),
  "04-meet-your-hardware/index": (
    content: include "04-meet-your-hardware/README.typ",
    title: tr((
      en: [Meet your hardware],
    )),
    sub: (
      "04-meet-your-hardware/microbit-v2": (
        content: include "04-meet-your-hardware/microbit-v2.typ",
        title: tr((
          en: [micro:bit v2],
        )),
      ),
      "04-meet-your-hardware/microbit-v1": (
        content: include "04-meet-your-hardware/microbit-v1.typ",
        title: tr((
          en: [micro:bit v1],
        )),
      ),
      "04-meet-your-hardware/terminology": (
        content: include "04-meet-your-hardware/terminology.typ",
        title: tr((
          en: [Rust Embedded terminology],
        )),
      ),
    ),
  ),
  "05-led-roulette/index": (
    content: include "05-led-roulette/README.typ",
    title: tr((
      en: [LED roulette],
    )),
    sub: (
      "05-led-roulette/build-it": (
        content: include "05-led-roulette/build-it.typ",
        title: tr((
          en: [Build it],
        )),
      ),
      "05-led-roulette/flash-it": (
        content: include "05-led-roulette/flash-it.typ",
        title: tr((
          en: [Flash it],
        )),
      ),
      "05-led-roulette/debug-it": (
        content: include "05-led-roulette/debug-it.typ",
        title: tr((
          en: [Debug it],
        )),
      ),
      "05-led-roulette/light-it-up": (
        content: include "05-led-roulette/light-it-up.typ",
        title: tr((
          en: [Light it up],
        )),
      ),
      "05-led-roulette/it-blinks": (
        content: include "05-led-roulette/it-blinks.typ",
        title: tr((
          en: [It blinks],
        )),
      ),
      "05-led-roulette/the-challenge": (
        content: include "05-led-roulette/the-challenge.typ",
        title: tr((
          en: [The challenge],
        )),
      ),
      "05-led-roulette/my-solution": (
        content: include "05-led-roulette/my-solution.typ",
        title: tr((
          en: [My solution],
        )),
      ),
    ),
  ),
  "06-serial-communication/index": (
    content: include "06-serial-communication/README.typ",
    title: tr((
      en: [Serial communication],
    )),
    sub: (
      "06-serial-communication/nix-tooling": (
        content: include "06-serial-communication/nix-tooling.typ",
        title: tr((
          en: [\*nix tooling],
        )),
      ),
      "06-serial-communication/windows-tooling": (
        content: include "06-serial-communication/windows-tooling.typ",
        title: tr((
          en: [Windows tooling],
        )),
      ),
      "06-serial-communication/minicom-on-macos": (
        content: include "06-serial-communication/minicom-on-macos.typ",
        title: tr((
          en: [Minicom on macOS],
        )),
      ),
    ),
  ),
  "07-uart/index": (
    content: include "07-uart/README.typ",
    title: tr((
      en: [UART],
    )),
    sub: (
      "07-uart/send-a-single-byte": (
        content: include "07-uart/send-a-single-byte.typ",
        title: tr((
          en: [Send a single byte],
        )),
      ),
      "07-uart/send-a-string": (
        content: include "07-uart/send-a-string.typ",
        title: tr((
          en: [Send a string],
        )),
      ),
      "07-uart/naive-approch-write": (
        content: include "07-uart/naive-approch-write.typ",
        title: tr((
          en: [Naive approach and `write!`],
        )),
      ),
      "07-uart/receive-a-single-byte": (
        content: include "07-uart/receive-a-single-byte.typ",
        title: tr((
          en: [Receive a single byte],
        )),
      ),
      "07-uart/echo-server": (
        content: include "07-uart/echo-server.typ",
        title: tr((
          en: [Echo server],
        )),
      ),
      "07-uart/reverse-a-string": (
        content: include "07-uart/reverse-a-string.typ",
        title: tr((
          en: [Reverse a string],
        )),
      ),
      "07-uart/my-solution": (
        content: include "07-uart/my-solution.typ",
        title: tr((
          en: [My solution],
        )),
      ),
    ),
  ),
  "08-i2c/index": (
    content: include "08-i2c/README.typ",
    title: tr((
      en: [I2C],
    )),
    sub: (
      "08-i2c/the-general-protocol": (
        content: include "08-i2c/the-general-protocol.typ",
        title: tr((
          en: [The general protocol],
        )),
      ),
      "08-i2c/lsm303agr": (
        content: include "08-i2c/lsm303agr.typ",
        title: tr((
          en: [LSM303AGR],
        )),
      ),
      "08-i2c/read-a-single-register": (
        content: include "08-i2c/read-a-single-register.typ",
        title: tr((
          en: [Read a single register],
        )),
      ),
      "08-i2c/using-a-driver": (
        content: include "08-i2c/using-a-driver.typ",
        title: tr((
          en: [Using a driver],
        )),
      ),
      "08-i2c/the-challenge": (
        content: include "08-i2c/the-challenge.typ",
        title: tr((
          en: [The challenge],
        )),
      ),
      "08-i2c/my-solution": (
        content: include "08-i2c/my-solution.typ",
        title: tr((
          en: [My solution],
        )),
      ),
    ),
  ),
  "09-led-compass/index": (
    content: include "09-led-compass/README.typ",
    title: tr((
      en: [LED compass],
    )),
    sub: (
      "09-led-compass/calibration": (
        content: include "09-led-compass/calibration.typ",
        title: tr((
          en: [Calibration],
        )),
      ),
      "09-led-compass/take-1": (
        content: include "09-led-compass/take-1.typ",
        title: tr((
          en: [Take 1],
        )),
      ),
      "09-led-compass/solution-1": (
        content: include "09-led-compass/solution-1.typ",
        title: tr((
          en: [Solution 1],
        )),
      ),
      "09-led-compass/take-2": (
        content: include "09-led-compass/take-2.typ",
        title: tr((
          en: [Take 2],
        )),
      ),
      "09-led-compass/solution-2": (
        content: include "09-led-compass/solution-2.typ",
        title: tr((
          en: [Solution 2],
        )),
      ),
      "09-led-compass/magnitude": (
        content: include "09-led-compass/magnitude.typ",
        title: tr((
          en: [Magnitude],
        )),
      ),
    ),
  ),
  "10-punch-o-meter/index": (
    content: include "10-punch-o-meter/README.typ",
    title: tr((
      en: [Punch-o-meter],
    )),
    sub: (
      "10-punch-o-meter/gravity-is-up": (
        content: include "10-punch-o-meter/gravity-is-up.typ",
        title: tr((
          en: [Gravity is up?],
        )),
      ),
      "10-punch-o-meter/the-challenge": (
        content: include "10-punch-o-meter/the-challenge.typ",
        title: tr((
          en: [The challenge],
        )),
      ),
      "10-punch-o-meter/my-solution": (
        content: include "10-punch-o-meter/my-solution.typ",
        title: tr((
          en: [My solution],
        )),
      ),
    ),
  ),
  "11-snake-game/index": (
    content: include "11-snake-game/README.typ",
    title: tr((
      en: [Snake game],
    )),
    sub: (
      "11-snake-game/game-logic": (
        content: include "11-snake-game/game-logic.typ",
        title: tr((
          en: [Game logic],
        )),
      ),
      "11-snake-game/controls": (
        content: include "11-snake-game/controls.typ",
        title: tr((
          en: [Controls],
        )),
      ),
      "11-snake-game/nonblocking-display": (
        content: include "11-snake-game/nonblocking-display.typ",
        title: tr((
          en: [Non-blocking display],
        )),
      ),
    ),
  ),
  "explore": (
    content: include "explore.typ",
    title: tr((
      en: [What's left for you to explore],
    )),
  ),
  "appendix/1-general-troubleshooting/index": (
    content: include "appendix/1-general-troubleshooting/README.typ",
    title: tr((
      en: [General troubleshooting],
    )),
  ),
  "appendix/2-how-to-use-gdb/index": (
    content: include "appendix/2-how-to-use-gdb/README.typ",
    title: tr((
      en: [How to use GDB],
    )),
  ),
)

#book(
  tgt,
  sources,
  lang,
  languages,
  book_title: "Discovery",
  git: "https://github.com/rust-embedded/discovery",
)
