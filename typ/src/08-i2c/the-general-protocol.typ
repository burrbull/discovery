#import "../../config.typ": *

#h1((en: [General protocol],
), offset: whole)

#tr((
en: [
  The I2C protocol is more elaborate than the serial communication
  protocol because it has to support communication between several
  devices. Let's see how it works using examples:
]))

= #tr((
  en: [Controller -\> Target],
))

#tr((
en: [
  If the Controller wants to send data to the Target:
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
  + Controller: Broadcast START
  + C: Broadcast target address (7 bits) + the R/W (8th) bit set to WRITE
  + Target: Responds ACK (ACKnowledgement)
  + C: Send one byte
  + T: Responds ACK
  + Repeat steps 4 and 5 zero or more times
  + C: Broadcast STOP OR (broadcast RESTART and go back to (2))
]))

#quote(block: true)[
#tr((
en: [
  *NOTE* The target address could have been 10 bits instead of 7
  bits long. Nothing else would have changed.
]))
]

= #tr((
  en: [Controller \<- Target],
))

#tr((
en: [
  If the controller wants to read data from the target:
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
  + C: Broadcast START
  + C: Broadcast target address (7 bits) + the R/W (8th) bit set to READ
  + T: Responds with ACK
  + T: Send byte
  + C: Responds with ACK
  + Repeat steps 4 and 5 zero or more times
  + C: Broadcast STOP OR (broadcast RESTART and go back to (2))
]))

#quote(block: true)[
#tr((
en: [
  *NOTE* The target address could have been 10 bits instead of 7
  bits long. Nothing else would have changed.
]))
]
