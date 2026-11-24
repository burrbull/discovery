#import "config.typ": *
#import "mdbook/lib.typ": book

#let sources = (
  "README": (
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
    ),
  ),
  "appendix/1-general-troubleshooting/index": (
    content: include "appendix/1-general-troubleshooting/README.typ",
    title: tr((
      en: [General troubleshooting],
    )),
  )
)

#book(
  tgt,
  sources,
  lang,
  languages,
  book_title: "Discovery",
  git: "https://github.com/rust-embedded/discovery",
)
