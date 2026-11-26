#import "../config.typ": *

#h1((en: [What's left for you to explore]
))

We have barely scratched the surface! There's lots of stuff left for you
to explore.

#quote(block: true)[
#strong[NOTE:] If you're reading this, and you'd like to help add
examples or exercises to the Discovery book for any of the items below,
or any other relevant embedded topics, we'd love to have your help!

Please
#link("https://github.com/rust-embedded/discovery/issues/new")[open an issue]
if you would like to help, but need assistance or mentoring for how to
contribute this to the book, or open a Pull Request adding the
information!
]

= Topics about embedded software

These topics discuss strategies for writing embedded software. Although
many problems can be solved in different ways, these sections talk about
some strategies, and when they make sense (or don't make sense) to use.

== Multitasking

Most of our programs executed a single task. How could we achieve
multitasking in a system with no OS, and thus no threads? There are two
main approaches to multitasking: preemptive multitasking and cooperative
multitasking.

In preemptive multitasking a task that's currently being executed can,
at any point in time, be #emph[preempted] (interrupted) by another task.
On preemption, the first task will be suspended and the processor will
instead execute the second task. At some point the first task will be
resumed. Microcontrollers provide hardware support for preemption in the
form of #emph[interrupts]. We were introduced to interrupts when we
built our snake game in chapter 11.

In cooperative multitasking a task that's being executed will run until
it reaches a #emph[suspension point]. When the processor reaches that
suspension point it will stop executing the current task and instead go
and execute a different task. At some point the first task will be
resumed. The main difference between these two approaches to
multitasking is that in cooperative multitasking #emph[yields] execution
control at #emph[known] suspension points instead of being forcefully
preempted at any point of its execution.

== Sleeping

All our programs have been continuously polling peripherals to see if
there's anything that needs to be done. However, sometimes there's
nothing to be done! At those times, the microcontroller should "sleep".

When the processor sleeps, it stops executing instructions and this
saves power. It's almost always a good idea to save power so your
microcontroller should be sleeping as much as possible. But, how does it
know when it has to wake up to perform some action? "Interrupts" (see
below for what exactly those are) are one of the events that wake up the
microcontroller but there are others and the `wfi` and `wfe` are the
instructions that make the processor "sleep".

= Topics related to microcontroller capabilities

Microcontrollers (like our nRF52/nRF51) have many capabilities. However,
many share similar capabilities that can be used to solve all sorts of
different problems.

These topics discuss some of those capabilities, and how they can be
used effectively in embedded development.

== Direct Memory Access (DMA).

This peripheral is a kind of #emph[asynchronous] `memcpy`. If you are
working with a micro:bit v2 you have actually already used this, the HAL
does this for you with the UARTE and TWIM peripherals. A DMA peripheral
can be used to perform bulk transfers of data. Either from RAM to RAM,
from a peripheral, like a UARTE, to RAM or from RAM to a peripheral. You
can schedule a DMA transfer, like read 256 bytes from UARTE into this
buffer, leave it running in the background and then poll some register
to see if it has completed so you can do other stuff while the transfer
is ongoing. For more information as to how this is implemented you can
checkout the `serial_setup` module from the UART chapter. If that isn't
enough yet you could even try and dive into the code of the
#link("https://github.com/nrf-rs/nrf-hal")[`nrf52-hal`].

== Interrupts

In order to interact with the real world, it is often necessary for the
microcontroller to respond #emph[immediately] when some kind of event
occurs.

Microcontrollers have the ability to be interrupted, meaning when a
certain event occurs, it will stop whatever it is doing at the moment,
to instead respond to that event. This can be very useful when we want
to stop a motor when a button is pressed, or measure a sensor when a
timer finishes counting down.

Although these interrupts can be very useful, they can also be a bit
difficult to work with properly. We want to make sure that we respond to
events quickly, but also allow other work to continue as well.

In Rust, we model interrupts similar to the concept of threading on
desktop Rust programs. This means we also must think about the Rust
concepts of `Send` and `Sync` when sharing data between our main
application, and code that executes as part of handling an interrupt
event.

== Pulse Width Modulation (PWM)

In a nutshell, PWM is turning on something and then turning it off
periodically while keeping some proportion ("duty cycle") between the
"on time" and the "off time". When used on a LED with a sufficiently
high frequency, this can be used to dim the LED. A low duty cycle, say
10% on time and 90% off time, will make the LED very dim wheres a high
duty cycle, say 90% on time and 10% off time, will make the LED much
brighter (almost as if it were fully powered).

In general, PWM can be used to control how much #emph[power] is given to
some electric device. With proper (power) electronics between a
microcontroller and an electrical motor, PWM can be used to control how
much power is given to the motor thus it can be used to control its
torque and speed. Then you can add an angular position sensor and you
got yourself a closed loop controller that can control the position of
the motor at different loads.

PWM is already abstracted within the
#link("https://docs.rs/embedded-hal/0.2.6/embedded_hal/trait.Pwm.html")[`embedded-hal` `Pwm` trait]
and you will again find implementations of this in the
#link("https://github.com/nrf-rs/nrf-hal")[`nrf52-hal`].

== Digital inputs

We have used the microcontroller pins as digital outputs, to drive LEDs.
When building our snake game, we also caught a glimpse of how these pins
can be configured as digital inputs. As digital inputs, these pins can
read the binary state of switches (on/off) or buttons (pressed/not
pressed).

Again digital inputs are abstracted within the
#link("https://docs.rs/embedded-hal/0.2.6/embedded_hal/digital/v2/trait.InputPin.html")[`embedded-hal` `InputPin` trait]
and of course the
#link("https://github.com/nrf-rs/nrf-hal")[`nrf52-hal`] does have an
implementation for them.

\(#emph[spoilers] reading the binary state of switches / buttons is not
as straightforward as it sounds \;-) )

== Analog-to-Digital Converters (ADC)

There are a lot of digital sensors out there. You can use a protocol
like I2C and SPI to read them. But analog sensors also exist! These
sensors just output a voltage level that's proportional to the magnitude
they are sensing.

The ADC peripheral can be used to convert that "analog" voltage level,
say `1.25` Volts, into a "digital" number, say in the `[0, 65535]`
range, that the processor can use in its calculations.

Again the
#link("https://docs.rs/embedded-hal/0.2.6/embedded_hal/adc/index.html")[`embedded-hal` `adc` module]
as well as the #link("https://github.com/nrf-rs/nrf-hal")[`nrf52-hal`]
got you covered.

== Digital-to-Analog Converters (DAC)

As you might expect a DAC is exactly the opposite of ADC. You can write
some digital value into a register to produce a voltage in the
`[0, 3.3V]` range (assuming a `3.3V` power supply) on some "analog" pin.
When this analog pin is connected to some appropriate electronics and
the register is written to at some constant, fast rate (frequency) with
the right values you can produce sounds or even music!

== Real Time Clock (RTC)

This peripheral can be used to track time in "human format". Seconds,
minutes, hours, days, months and years. This peripheral handles the
translation from "ticks" to these human friendly units of time. It even
handles leap years and Daylight Save Time for you!

== Other communication protocols

- SPI, abstracted within the
  #link("https://docs.rs/embedded-hal/0.2.6/embedded_hal/spi/index.html")[`embedded-hal` `spi` module]
  and implemented by the
  #link("https://github.com/nrf-rs/nrf-hal")[`nrf52-hal`]
- I2S, currently not abstracted within the `embedded-hal` but
  implemented by the
  #link("https://github.com/nrf-rs/nrf-hal")[`nrf52-hal`]
- Ethernet, there does exist a small TCP/IP stack named
  #link("https://github.com/smoltcp-rs/smoltcp")[`smoltcp`] which is
  implemented for some chips but the ones on the micro:bit don't feature
  an Ethernet peripheral
- USB, there is some experimental work on this, for example with the
  #link("https://github.com/mvirkkunen/usb-device")[`usb-device`] crate
- Bluetooth, there does exist an incomplete BLE stack named
  #link("https://github.com/jonas-schievink/rubble")[`rubble`] which
  does support nrf chips.
- SMBUS, neither abstracted in `embedded-hal` nor implemented by the
  #link("https://github.com/nrf-rs/nrf-hal")[`nrf52-hal`] at the moment.
- CAN, neither abstracted in `embedded-hal` nor implemented by the
  #link("https://github.com/nrf-rs/nrf-hal")[`nrf52-hal`] at the moment
- IrDA, neither abstracted in `embedded-hal` nor implemented by the
  #link("https://github.com/nrf-rs/nrf-hal")[`nrf52-hal`] at the moment

Different applications use different communication protocols. User
facing applications usually have a USB connector because USB is a
ubiquitous protocol in PCs and smartphones. Whereas inside cars you'll
find plenty of CAN "buses". Some digital sensors use SPI, others use I2C
and others, SMBUS.

If you happen to be interested in developing abstractions in the
`embedded-hal` or implementations of peripherals in general, don't be
shy to open an issue in the HAL repositories. Alternatively you could
also join the
#link("https://matrix.to/#/#rust-embedded:matrix.org")[Rust Embedded matrix channel]
and get into contact with most of the people who built the stuff from
above.

= General Embedded-Relevant Topics

These topics cover items that are not specific to our device, or the
hardware on it. Instead, they discuss useful techniques that could be
used on embedded systems.

== Gyroscopes

As part of our Punch-o-meter exercise, we used the Accelerometer to
measure changes in acceleration in three dimensions. But there are other
motion sensors such as gyroscopes, which allows us to measure changes in
"spin" in three dimensions.

This can be very useful when trying to build certain systems, such as a
robot that wants to avoid tipping over. Additionally, the data from a
sensor like a gyroscope can also be combined with data from
accelerometer using a technique called Sensor Fusion (see below for more
information).

== Servo and Stepper Motors

While some motors are used primarily just to spin in one direction or
the other, for example driving a remote control car forwards or
backwards, it is sometimes useful to measure more precisely how a motor
rotates.

Our microcontroller can be used to drive Servo or Stepper motors, which
allow for more precise control of how many turns are being made by the
motor, or can even position the motor in one specific place, for example
if we wanted to move the arms of a clock to a particular direction.

== Sensor fusion

The micro:bit contains two motion sensors: an accelerometer and a
magnetometer. On their own these measure: (proper) acceleration and (the
Earth's) magnetic field. But these magnitudes can be "fused" into
something more useful: a "robust" measurement of the orientation of the
board. Where robust means with less measurement error than a single
sensor would be capable of.

This idea of deriving more reliable data from different sources is known
as sensor fusion.

#divider()

So where to next? There are several options:

- You could check out the examples in the
  #link("https://github.com/nrf-rs/microbit/")[`microbit`] board support
  crate. All those examples work for the micro:bit board you have.

- You could join the
  #link("https://matrix.to/#/#rust-embedded:matrix.org")[Rust Embedded matrix channel],
  lots of people who contribute or work on embedded software hang out
  there. Including for example the people who wrote the `microbit` BSP,
  the `nrf52-hal`, `embedded-hal` etc.

- If you are looking for a general overview of what is available in Rust
  Embedded right now check out the
  #link("https://github.com/rust-embedded/awesome-embedded-rust/")[Awesome Rust Embedded]
  list

- You could check out
  #link("https://rtic.rs")[Real-Time Interrupt-driven Concurrency]. A
  very efficient preemptive multitasking framework that supports task
  prioritization and dead lock free execution.

- You could check out more abstractions of the
  #link("https://github.com/rust-embedded/embedded-hal")[`embedded-hal`]
  project and maybe even try and write your own platform agnostic driver
  based on it.

- You could try running Rust on a different development board. The
  easiest way to get started is to use the
  #link("https://docs.rs/cortex-m-quickstart/0.3.1/cortex_m_quickstart/")[`cortex-m-quickstart`]
  Cargo project template.

- You could try out
  #link("https://mobile.twitter.com/japaricious/status/962770003325005824")[this motion sensors demo].
  Details about the implementation and source code are available in
  #link("http://blog.japaric.io/wd-1-2-l3gd20-lsm303dlhc-madgwick/")[this blog post].

- You could check out
  #link("http://blog.japaric.io/brave-new-io/")[this blog post] which
  describes how Rust type system can prevent bugs in I/O configuration.

- You could check out #link("http://blog.japaric.io")[japaric's blog]
  for miscellaneous topics about embedded development with Rust.

- You could join the
  #link("https://github.com/rust-lang-nursery/embedded-wg/issues/39")[Weekly driver initiative]
  and help us write generic drivers on top of the `embedded-hal` traits
  and that work for all sorts of platforms (ARM Cortex-M, AVR, MSP430,
  RISCV, etc.)
