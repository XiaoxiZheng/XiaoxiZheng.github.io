Screen.backgroundColor = "1F352C"

card = new Layer
	name: "card: 1"
	x: 20
	y: Align.center
	backgroundColor: ""
	width: 365
	height: 365
	borderRadius: 22
	clip: true

card.states = 
	front:
		rotationY: 0
	back:
		rotationY: 180

card.onClick ->
	card_front.states.next(["back","front"])
	card_back.states.next(["back","front"])
	this.states.next(["back","front"])
		
card_front = new Layer
	parent: card
	backgroundColor: "white"
	borderRadius: card.borderRadius
	
card_front.states = 
	front: 
		opacity: 1
	back:
		opacity: 0	
card_front.states.switchInstant("front")

card_back = new Layer
	parent: card
	backgroundColor: "black"
	borderRadius: card.borderRadius
# 	width: card.width
	rotationY: 180
card_back.states = 
	front: 
		opacity: 0
	back:
		opacity: 1
card_back.states.switchInstant("front")

###################################

# card = []	
# for i in [0..4]
# 	cards = card[i] = new Layer	
# 		name: "cards#{i}"
# 		x: Screen.width/8 + (265+ 10) * i
# 		y: Screen.height/4
# 		backgroundColor: ""
# 		width: 265*2
# 		height: 356*2
# 		borderRadius: 22
# 		clip: true
# 		
# 	cards.front = new Layer
# 		backgroundColor: "white"
# 		parent: card[i]
# 		borderRadius: card[i].borderRadius
# 	cards.cardBack = new Layer
# 		backgroundColor: "black"
# 		parent: card[i]
# 		rotationY: 180
# 		borderRadius: card[i].borderRadius
# 	
# 	cards.front.states.add(
# 		back: {opacity: 0, time: 0.25}
# 		front: {opacity: 1, time: 0.25})
# 	cards.front.states.switchInstant("front")
# 	cards.front.states.animationOptions = 
# 		curve: "bezier-curve(.1,.6,.2,1)"
# 	
# 	cards.cardBack.states.add(
# 		back: {opacity: 1, time: 0.25}
# 		front: {opacity: 0, time: 0.25})
# 	cards.cardBack.states.switchInstant("front")
# 	cards.cardBack.states.animationOptions = 
# 		curve: "bezier-curve(.1,.6,.2,1)"
# 	
# 	
# 	card[i].states.add(
# 		front: {rotationY: 0, time:0.25}
# 		back: {rotationY: 180, time: 0.25})
# 	card[i].states.animationOptions = 
# 		curve: "bezier-curve(.1,.6,.2,1)"
# 	
# 	card[i].onClick ->
# 		this.front.states.next(["back","front"])
# 		this.cardBack.states.next(["back","front"])
# 		this.states.next(["back","front"])
