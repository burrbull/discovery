#import "../../config.typ": *

#h1((en: [General protocol]
))

The I2C protocol is more elaborate than the serial communication
protocol because it has to support communication between several
devices. Let's see how it works using examples:

= Controller -\> Target

If the Controller wants to send data to the Target:

+ Controller: Broadcast START
+ C: Broadcast target address (7 bits) + the R/W (8th) bit set to WRITE
+ Target: Responds ACK (ACKnowledgement)
+ C: Send one byte
+ T: Responds ACK
+ Repeat steps 4 and 5 zero or more times
+ C: Broadcast STOP OR (broadcast RESTART and go back to (2))

#quote(block: true)[
#strong[NOTE] The target address could have been 10 bits instead of 7
bits long. Nothing else would have changed.
]

= Controller \<- Target

If the controller wants to read data from the target:

+ C: Broadcast START
+ C: Broadcast target address (7 bits) + the R/W (8th) bit set to READ
+ T: Responds with ACK
+ T: Send byte
+ C: Responds with ACK
+ Repeat steps 4 and 5 zero or more times
+ C: Broadcast STOP OR (broadcast RESTART and go back to (2))

#quote(block: true)[
#strong[NOTE] The target address could have been 10 bits instead of 7
bits long. Nothing else would have changed.
]
