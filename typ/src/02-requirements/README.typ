#import "../../config.typ": *

#h1((en: [Hardware/knowledge requirements]
))

#let url_edition_guide = "https://rust-lang-nursery.github.io/edition-guide/"
#tr((
en: [
  The primary knowledge requirement to read this book is to know
  _some_ Rust. It's hard for me to quantify _some_ but at least
  I can tell you that you don't need to fully grok generics, but you do
  need to know how to _use_ closures. You also need to be familiar
  with the idioms of the #link(url_edition_guide)[2018 edition],
  in particular with the fact that `extern crate` is not necessary in the
  2018 edition.
]))

#let ln_v2 = link("https://tech.microbit.org/hardware/")[micro:bit v2]
#let ln_v15 = link("https://tech.microbit.org/hardware/1-5-revision/")[micro:bit v1.5]
#tr((
en: [
  Also, to follow this material you'll need the following hardware:
  - A #ln_v2 board, alternatively a #ln_v15 board, the book will refer to the v1.5 as just v1.
]))

#let url_buy = "https://microbit.org/buy/"
#let url_suppliers = "https://www.mouser.com/microbit/_/N-aez3t?P=1y8um0l"
#tr((
en: [
  (You can purchase this board from several
  #link(url_buy)[electronics] #link(url_suppliers)[suppliers])
]))

#quote(block: true)[
#tr((
en: [
  *NOTE* This is an image of a micro:bit v2, the front of the v1
  looks slightly different
]))
]

#tr((
en: [
  - One micro-B USB cable, required to make the micro:bit board work. Make
    sure that the cable supports data transfer as some cables only support
    charging devices.
]))

#quote(block: true)[
#tr((
en: [
  *NOTE* You may already have a cable like this, as some micro:bit
  kits ship with such cables. Some USB cables used to charge mobile
  devices may also work, if they are micro-B and have the capability to
  transmit data.
]))
]

#quote(block: true)[
#tr((
en: [
  *FAQ*: Wait, why do I need this specific hardware?
]))
]

#tr((
en: [
  It makes my life and yours much easier.
]))

#tr((
en: [
  The material is much, much more approachable if we don't have to worry
  about hardware differences. Trust me on this one.
]))

#quote(block: true)[
#tr((
en: [
  *FAQ*: Can I follow this material with a different development
  board?
]))
]

#let ln_nrf_hal = link("https://github.com/nrf-rs/nrf-hal")[`nrf52-hal`]
#let url_hals = "https://github.com/rust-embedded/awesome-embedded-rust#hal-implementation-crates"
#tr((
en: [
  Maybe? It depends mainly on two things: your previous experience with
  microcontrollers and/or whether a high level crate already exists, like
  the #ln_nrf_hal, for your
  development board somewhere. You can look through the
  #link(url_hals)[Awesome Embedded Rust HAL list]
  for your microcontroller, if you intend to use a different one.
]))

#tr((
en: [
  With a different development board, this text would lose most if not all
  its beginner friendliness and "easy to follow"-ness, IMO.
]))

#let url_quickstart = "https://rust-embedded.github.io/cortex-m-quickstart/cortex_m_quickstart/"
#tr((
en: [
  If you have a different development board and you don't consider
  yourself a total beginner, you are better off starting with the
  #link(url_quickstart)[quickstart] project template.
]))
