#Document Color Definitions
pureWhite = "#FFFFFF"
greenBlue = "#103D4C"
logoBlue = "#0067A5"
darkBlue = "#012939"
blackBlue = "#0D1A21"

grey15 = "#2C404C"

alertRed = "#E53838"
alertOrange = "#DD6B1F"
alertYellow = "FEC600"
alertBlue = "4999E9"
#Global Attributes
percentNum = 0

##Clock
interval = null 
pace = 0.04
stopPoint = pace * 100 + pace

##Scaling
screen_width = Framer.Device.screen.width
screen_height = Framer.Device.screen.height

default_w = 400
default_h = 400 

ratio = screen_width/default_w

#Page Setup
bg = new BackgroundLayer
	backgroundColor: pureWhite
	width: default_w
	height: default_h
	
spinner = new Layer
	image: "images/spinner.png"
	x: default_w/2
	y: default_h/2
	scale: ratio
	opacity: 0.3

ge_logo = new Layer
	image: "images/ge_logo.png"
	x: default_w/2
	y: default_h/2
	opacity: 0
	scale: ratio

ge_logo.states = 
	animateIn:{
		opacity: 100
		animationOptions:
			curve: "easeIn"
	}
percentLoaded = new TextLayer
# 	parent: spinner
	x: spinner.x + spinner.x/2 - 10
	y: spinner.y + spinner.height/2 - 10
	text: percentNum + "%"
	color: darkBlue
	fontSize: 18

spinner.states = 
	fullOpaque:{
		opacity: 1
		animationOptions:
			curve:Bezier.easeIn
			time: stopPoint
	}
	zeroOpaque:{
		opacity: 0
		animationOptions:
			curve:Bezier.easeIn
			time: .2
	}
	rotate:{
		rotation: 360 * stopPoint
		animationOptions:
			curve:"easeIn"
			time: stopPoint
	}

#Utility Helper Functions

startInterval = ->
	interval = Utils.interval pace, ->
		percentNum += 1
		percentLoaded.text = percentNum + "%"
				
stopInterval = ->
	clearInterval(interval)
	percentNum = 0

#========================================#
#Main()
#========================================#

startInterval()

spinner.animate("fullOpaque")
spinner.animate("rotate")

Utils.delay stopPoint, ->
	stopInterval(interval)
	spinner.onAnimationEnd ->
		spinner.opacity = 0
		percentLoaded.opacity = 0
		ge_logo.animate("animateIn")
	