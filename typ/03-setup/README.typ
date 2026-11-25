#import "../config.typ": *

= Setting up a development environment

Dealing with microcontrollers involves several tools as we'll be dealing
with an architecture different from your computer's and we'll have to
run and debug programs on a "remote" device.

== Documentation

Tooling is not everything though. Without documentation, it is pretty
much impossible to work with microcontrollers.

We'll be referring to all these documents throughout this book:

- #link("https://www.st.com/resource/en/datasheet/lsm303agr.pdf")[LSM303AGR]

== Tools

We'll use all the tools listed below. Where a minimum version is not
specified, any recent version should work but we have listed the version
we have tested.

- Rust 1.57.0 or a newer toolchain.

- `gdb-multiarch`. Tested version: 10.2. Other versions will most likely
  work as well though If your distribution/platform does not have
  `gdb-multiarch` available `arm-none-eabi-gdb` will do the trick as
  well. Furthermore, some normal `gdb` binaries are built with multiarch
  capabilities as well, you can find further information about this in
  the sub chapters.

- #link("https://github.com/rust-embedded/cargo-binutils")[`cargo-binutils`].
  Version 0.3.3 or newer.

- #link("https://probe.rs/docs/tools/cargo-embed/")[`cargo-embed`].
  Version 0.24.0 or newer.

- `minicom` on Linux and macOS. Tested version: 2.7.1. Other versions
  will most likely work as well though

- `PuTTY` on Windows.

Next, follow OS-agnostic installation instructions for a few of the
tools:

=== `rustc` & Cargo

Install rustup by following the instructions at
#link("https://rustup.rs").

If you already have rustup installed double check that you are on the
stable channel and your stable toolchain is up-to-date. `rustc -V`
should return a date newer than the one shown below:

```console
$ rustc -V
rustc 1.53.0 (53cb7b09b 2021-06-17)
```

=== `cargo-binutils`

```console
$ rustup component add llvm-tools

$ cargo install cargo-binutils --vers 0.3.3

$ cargo size --version
cargo-size 0.3.3
```

=== `cargo-embed`

In order to install cargo-embed, first install its
#link("https://probe.rs/docs/getting-started/installation/")[prerequisites]
(note: these instructions are part of the more general
#link("https://probe.rs/")[`probe-rs`] embedded debugging toolkit). Then
install it with cargo:

```console
$ cargo install --locked probe-rs-tools --vers '^0.24'
```

#strong[NOTE] This may fail due to frequent changes in `probe-rs`. If
so, go to #link("https://probe.rs") and follow the current installation
instructions there.

Finally, verify that you have successfully installed `cargo-embed` by
running:

```console
$ cargo embed --version
cargo-embed 0.24.0 (git commit: crates.io)
```

=== This repository

Since this book also contains some small Rust code bases used in various
chapters you will also have to download its source code. You can do this
in one of the following ways:

- Visit the
  #link("https://github.com/rust-embedded/discovery/")[repository],
  click the green "Code" button and then the "Download Zip" one
- Clone it using git (if you know git you presumably already have it
  installed) from the same repository as linked in the zip approach

=== OS specific instructions

Now follow the instructions specific to the OS you are using:

- #link("linux.md")[Linux]
- #link("windows.md")[Windows]
- #link("macos.md")[macOS]
