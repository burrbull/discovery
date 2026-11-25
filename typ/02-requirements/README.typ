#import "../config.typ": *

= Hardware/knowledge requirements
<hardwareknowledge-requirements>
The primary knowledge requirement to read this book is to know
#emph[some] Rust. It's hard for me to quantify #emph[some] but at least
I can tell you that you don't need to fully grok generics, but you do
need to know how to #emph[use] closures. You also need to be familiar
with the idioms of the
#link("https://rust-lang-nursery.github.io/edition-guide/")[2018 edition],
in particular with the fact that `extern crate` is not necessary in the
2018 edition.

Also, to follow this material you'll need the following hardware:

- A #link("https://tech.microbit.org/hardware/")[micro:bit v2] board,
  alternatively a
  #link("https://tech.microbit.org/hardware/1-5-revision/")[micro:bit v1.5]
  board, the book will refer to the v1.5 as just v1.

\(You can purchase this board from several
#link("https://microbit.org/buy/")[electronics]
#link("https://www.mouser.com/microbit/_/N-aez3t?P=1y8um0l")[suppliers])

#quote(block: true)[
#strong[NOTE] This is an image of a micro:bit v2, the front of the v1
looks slightly different
]

- One micro-B USB cable, required to make the micro:bit board work. Make
  sure that the cable supports data transfer as some cables only support
  charging devices.

#quote(block: true)[
#strong[NOTE] You may already have a cable like this, as some micro:bit
kits ship with such cables. Some USB cables used to charge mobile
devices may also work, if they are micro-B and have the capability to
transmit data.
]

#quote(block: true)[
#strong[FAQ]: Wait, why do I need this specific hardware?
]

It makes my life and yours much easier.

The material is much, much more approachable if we don't have to worry
about hardware differences. Trust me on this one.

#quote(block: true)[
#strong[FAQ]: Can I follow this material with a different development
board?
]

Maybe? It depends mainly on two things: your previous experience with
microcontrollers and/or whether a high level crate already exists, like
the #link("https://github.com/nrf-rs/nrf-hal")[`nrf52-hal`], for your
development board somewhere. You can look through the
#link("https://github.com/rust-embedded/awesome-embedded-rust#hal-implementation-crates")[Awesome Embedded Rust HAL list]
for your microcontroller, if you intend to use a different one.

With a different development board, this text would lose most if not all
its beginner friendliness and "easy to follow"-ness, IMO.

If you have a different development board and you don't consider
yourself a total beginner, you are better off starting with the
#link("https://rust-embedded.github.io/cortex-m-quickstart/cortex_m_quickstart/")[quickstart]
project template.
