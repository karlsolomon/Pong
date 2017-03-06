Project Description

We are modeling bowling. We will show a first-person perspective which will throw a ball (and always a strike) on each mousePressed action. The frame will be closer to the camera than the pins and when the pins are hit by the ball they will all fly radially away from the ball and spin. When they pass behind the frame they will no longer be visible. The ball will disappear out of the back of the frame. Once the pins and ball are no longer visible a new set of pins with a metal bar across them will be dropped from the top of the frame. The metal bar will rise and we will be back at the start state.

	Objects
		Ball
		Lane
		Pin
		Frame
		Gutter
		Scenery
	States
		Start
			Ball behind front field
			Pins set near back field
		QueueBall
			Ball comes into view slowly a few "feet" above the lane.
		BallDisappear
			Ball exits as it came.
		ThrowBall
			Ball appears at bottom of lane and moving rapidly towards the pins.
		BallHit
			When ball and first pin intersect Z position trigger a sound event
		FlyingPins
			Pins fly readially away from ball with some random spin and direction (X/Y plane mainly, can have -Z motion also).
		PinsDrop
			New group of pins (with a bar in front) are brought into view from behind the top of the frame.
		BarRise
			The bar in front rises back behind the top of the frame and the pins are set.