#Color Definitions

# BLUE SHADES
blue01 = "#0D1418" # background dark
blue02 = "#012939" # header
blue03 = "#065769"
blue04 = "#09819C"
blue05 = "#8BD6FF"

blue06 = "#006F87" # Global overlay color
blue07 = "#45ACCC"

darkBlue = blue02
logoBlue = "#0067A5"

# BASE COLORS
blue = '#00CCFF'
green = '#33FF00'
yellow = '#FFC107'
red = "#ED2B2A"
orange = "#FF7900"
gray = "#555555"

blueGrey = "#E2E8ED"
highlightColor = blue04 

white = "#FFFFFF"
black = "#000000"

defaultFontColor = black#blue03
bgColor = white

#Donkey Loader
percentNum = 0
transitionTime = 3 #seconds

##Scaling
screen_width = Screen.width#Framer.Device.screen.width
screen_height = Screen.height#Framer.Device.screen.height

default_w = 960
default_h = 1280

ratio = screen_width/default_w

background = new BackgroundLayer
	backgroundColor: darkBlue
	
loader = new Layer
	opacity: 1
	backgroundColor: darkBlue
	width: screen_width
	height: screen_height
	x: 70
	y: -70

#Donkey

#Doneky Container
donkey = new Layer
	parent: loader
	x: Screen.width/4
	y: Screen.height/4
	width: default_w/2
	height: default_h/2
	scale: ratio * 0.3
	backgroundColor: darkBlue
	
donkey.states = 
	zeroOpaque:{
		opacity: 0
		animationOptions:{
			curve:"ease-out"
			time: 0.2	
		} 
	}
	fullOpaque:{
		opacity: 100
		animationOptions:{
			curve:"ease-in"
			time: 0.3	
		}
	}
	
##DonkeyBase
donkeyBase = new Layer
	parent: donkey
	image: "images/donkey/donkeyBase.svg"
	width: 415
	height: 230
	x: 20
	y: donkey.y	

donkeyLine = new Layer
	parent: donkey
	width: 3
	height: donkeyBase.height + 10
	backgroundColor: white
	x: donkey.x/2 - 70
	y: donkey.y - 10

donkeyWeight = new Layer
	parent: donkeyLine
	width: 10
	height: 60
	borderRadius: 5
	y: 80
	x: -3
	backgroundColor: white

donkeyWeight.states = 
	up:{
		y: 80
		animationOptions:
			curve:Bezier.easeOut
			time: 1
	}
	down: {
		y: 100
		animationOptions:
			curve:Bezier.easeIn
			time: 1
	}
	
##DonkeyTop
donkeyTop = new Layer
	parent: donkey
	image: "images/donkey/donkeyTop.svg"
	width: 310
	height: 145
	x: donkey.x/2 - 80
	y: donkey.y/2 + 30
	rotate: 0
	
donkeyTop.states = 
	default:{
		rotation: 0
		animationOptions:
			curve:Bezier.easeOut
			time: 1
	}
	rotate:{
		rotation: -10
		animationOptions:
			curve:Bezier.easeIn
			time: 1
	}

# donkeyTop.onAnimationEnd -> 
donkeyWeight.stateCycle("down", "up")
donkeyTop.stateCycle("rotate", "default")
donkeyTop.onAnimationEnd -> 
	donkeyWeight.stateCycle("down", "up")
	donkeyTop.stateCycle("rotate", "default")

	
offSet = 30
yOffset = 120

percentLoaded = new TextLayer
	text: percentNum + "%"
	color: white
	fontSize: 20
	x: donkeyBase.x + donkey.width + 110
	y: donkey.height - 70
	opacity: 1

#Utility Helper Functions
##Clock
interval = null 
pace = 0.02
stopPoint = pace * 99 + pace

startInterval = ->
	interval = Utils.interval pace, ->
		percentNum += 1
		percentLoaded.text = percentNum + "%"
		
stopInterval = ->
	clearInterval(interval)
	percentNum = 0

animateLoader = (progressText, pace_) ->
	pace = pace_
	stopPoint = pace * 99 + pace

	loader.opacity = .9
	
# 	trainingInProgress.text = progressText
	
	startInterval()
	
# 	for i in [0...loadingDots.length-1]
# 		loadingDots[i].states.next()
# 		loadingDots[i].onAnimationEnd ->
# 			this.stateCycle("show","hide")
	Utils.delay stopPoint, ->
		stopInterval(interval)
		loader.animate
			opacity: 0
		percentLoaded.animate
			opacity: 0
			animationOptions:{
				curve:"ease-out"
				time: 0.2	
			} 
		donkey.animate("zeroOpaque") 

# Main #
animateLoader("Loading Application",0.09)
				