#import "../../config.typ": *

#h1((en: [The challenge],
), offset: whole)

#tr((
en: [
  To keep things simple, we'll measure the acceleration only in the X axis
  while the board remains horizontal. That way we won't have to deal with
  subtracting that _fictitious_ `1g` we observed before which would
  be hard because that `1g` could have X Y Z components depending on how
  the board is oriented.
]))

#tr((
en: [
  Here's what the punch-o-meter must do:
  - By default, the app is not "observing" the acceleration of the board.
  - When a significant X acceleration is detected (i.e.~the acceleration
    goes above some threshold), the app should start a new measurement.
  - During that measurement interval, the app should keep track of the
    maximum acceleration observed
  - After the measurement interval ends, the app must report the maximum
    acceleration observed. You can report the value using the `rprintln!`
    macro.
]))

#tr((
en: [
  Give it a try and let me know how hard you can punch `;-)`.
]))

#quote(block: true)[
#let ln_set_accel_scale = link("https://docs.rs/lsm303agr/0.2.2/lsm303agr/struct.Lsm303agr.html#method.set_accel_scale")[`set_accel_scale`]
#let ln_countdown = link("https://docs.rs/embedded-hal/0.2.6/embedded_hal/timer/trait.CountDown.html")[`Countdown`]
#let ln_nb_result = link("https://docs.rs/nb/1.0.0/nb/type.Result.html")[`nb::Result`]
#tr((
en: [
  *NOTE* There are two additional APIs that should be useful for
  this task we haven't discussed yet. First the
  #ln_set_accel_scale
  one which you need to measure high g values. Secondly the
  #ln_countdown
  trait from `embedded_hal`. If you decide to use this to keep your
  measurement intervals you will have to pattern match on the
  #ln_nb_result type
  instead of using the `block!` macro we have seen in previous chapters.
]))
]
