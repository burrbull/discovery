#import "../../config.typ": *

#h1((en: [I2C]
))
<i2c>

#tr((
en: [
  We just saw the serial communication protocol. It's a widely used
  protocol because it's very simple and this simplicity makes it easy to
  implement on top of other protocols like Bluetooth and USB.
]))

#tr((
en: [
  However, its simplicity is also a downside. More elaborated data
  exchanges, like reading a digital sensor, would require the sensor
  vendor to come up with another protocol on top of it.
]))

#tr((
en: [
  (Un)Luckily for us, there are _plenty_ of other communication
  protocols in the embedded space. Some of them are widely used in digital
  sensors.
]))

#tr((
en: [
  The micro:bit board we are using has two motion sensors in it: an
  accelerometer and a magnetometer. Both of these sensors are packaged
  into a single component and can be accessed via an I2C bus.
]))

#tr((
en: [
  I2C stands for Inter-Integrated Circuit and is a _synchronous_
  _serial_ communication protocol. It uses two lines to exchange
  data: a data line (SDA) and a clock line (SCL). Because a clock line is
  used to synchronize the communication, this is a _synchronous_
  protocol.
]))

#if tgt == "html" {
  import html
  html.img(
    src: "https://upload.wikimedia.org/wikipedia/commons/0/04/I2C_controller-target.svg",
    height: 360,
    alt: "I2C bus",
    class: "white_bg",
  )
}

#tr((
en: [
  This protocol uses a _controller target_ model where the
  controller is the device that _starts_ and drives the communication
  with a target device. Several devices, both controllers and targets, can
  be connected to the same bus at the same time. A controller device can
  communicate with a specific target device by first broadcasting its
  _address_ to the bus. This address can be 7 bits or 10 bits long.
  Once a controller has _started_ a communication with a target, no
  other device can make use of the bus until the controller _stops_
  the communication.
]))

#tr((
en: [
  The clock line determines how fast data can be exchanged and it usually
  operates at a frequency of 100 kHz (standard mode) or 400 kHz (fast
  mode).
]))
