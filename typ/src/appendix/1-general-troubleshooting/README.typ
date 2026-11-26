#import "../../../config.typ": *

#h1((en: [General troubleshooting]
))
<general-troubleshooting>

= #tr((
  en: [`cargo-embed` problems],
))

#tr((
en: [
  Most `cargo-embed` problems are either related to not having installed
  the `udev` rules properly (on Linux) or having selected the wrong chip
  configuration in `Embed.toml` so make sure you got both of those right.
]))

#let url_issues = "https://github.com/rust-embedded/discovery/issues"
#let url_matrix = "https://matrix.to/#/#rust-embedded:matrix.org"
#let url_matrix_probe = "https://matrix.to/#/#probe-rs:matrix.org"
#tr((
en: [
  If the above does not work out for you, you can open an issue in the
  #link(url_issues)[`discovery` issue tracker].
  Alternatively you can also visit the
  #link(url_matrix)[Rust Embedded matrix channel]
  or the #link(url_matrix_probe)[probe-rs matrix channel]
  and ask for help there.
]))

= #tr((
  en: [Cargo problems],
))

== #tr((
  en: ["can't find crate for `core`"],
))

=== #tr((
  en: [Symptoms],
))

```
   Compiling volatile-register v0.1.2
   Compiling rlibc v1.0.0
   Compiling r0 v0.1.0
error[E0463]: can't find crate for `core`

error: aborting due to previous error

error[E0463]: can't find crate for `core`

error: aborting due to previous error

error[E0463]: can't find crate for `core`

error: aborting due to previous error

Build failed, waiting for other jobs to finish...
Build failed, waiting for other jobs to finish...
error: Could not compile `r0`.

To learn more, run the command again with --verbose.
```

=== #tr((
  en: [Cause],
))

#tr((
en: [
  You forgot to install the proper target for your microcontroller
  (`thumbv7em-none-eabihf` for v2 and `thumbv6m-none-eabi` for v1).
]))

=== #tr((
  en: [Fix],
))

#tr((
en: [
  Install the proper target.
]))


```console
# micro:bit v2
$ rustup target add thumbv7em-none-eabihf

# micro:bit v1
$ rustup target add thumbv6m-none-eabi
```
