#import "../config.typ": *

= Meet your hardware

Let's get familiar with the hardware we'll be working with.

== micro:bit

Here are some of the many components on the board:

- A
  #link("https://en.wikipedia.org/wiki/Microcontroller")[microcontroller].
- A number of LEDs, most notably the LED matrix on the back
- Two user buttons as well as a reset button (the one next to the USB
  port).
- One USB port.
- A sensor that is both a
  #link("https://en.wikipedia.org/wiki/Magnetometer")[magnetometer] and
  an #link("https://en.wikipedia.org/wiki/Accelerometer")[accelerometer]

Of these components, the most important is the microcontroller
(sometimes shortened to "MCU" for "microcontroller unit"), which is the
bigger of the two black squares sitting on the side of the board with
the USB port. The MCU is what runs your code. You might sometimes read
about "programming a board", when in reality what we are doing is
programming the MCU that is installed on the board.

If you happen to be interested in a more in detail description of the
board you can checkout the
#link("https://tech.microbit.org/hardware/")[micro:bit website].

Since the MCU is so important, let's take a closer look at the one
sitting on our board. Note that only one of the following two sections
applies to your board, depending on whether you are working with a
micro:bit v2 or v1.
