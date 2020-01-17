#Colors
darkBlue = "#012939"
logoBlue = "#0067A5"

#Donkey Loader
percentNum = 0
transitionTime = 3 #seconds

##Scaling
screen_width = Screen.width#Framer.Device.screen.width
screen_height = Screen.height#Framer.Device.screen.height

default_w = 1280
default_h = 1080 

ratio = default_w/screen_width

background = new BackgroundLayer
	backgroundColor: darkBlue

loading_container = new Layer
	x: screen_width/4
	y: 0
	width: screen_width/2
	height: screen_height
	scale: ratio
	backgroundColor: darkBlue

#Donkey
##DonkeyBase
donkeyBase = new Layer
	parent: loading_container
	image: "images/donkey/donkeyBase.png"
	x: loading_container.x/2 + 50
	y: loading_container.height/3
	width: 208
	height: 184
	scale: 350/loading_container.width

##DonkeyTop
donkeyTop = new Layer
	parent: loading_container
	image: "images/donkey/donkeyTop.png"
	x: loading_container.x/2 -20
	y: loading_container.height/4 + 20
	width: 384
	height: 222
	scale: 384/loading_container.width
donkeyTop.states = 
	default:{
		rotation: 0
		animationOptions:
			curve:Bezier.easeOut
			time: 1
	}
	rotate20:{
		rotation: 20
		animationOptions:
			curve:Bezier.easeIn
			time: 1
	}
donkeyTop.states.next()
donkeyTop.onAnimationEnd -> 
	donkeyTop.stateCycle("rotate20", "default")
		
loadingDots = [] 
for i in [0...7]
	dot = new Layer
		parent: loading_container
		width: 10
		height: 10
		x: loading_container.x/2 + 60
		y: (loading_container.height/2 - 120) + 15 * i
		backgroundColor: logoBlue
		borderRadius: 6
		opacity: 0

	dot.states = 
		show:{
			opacity: 1.0
			animationOptions:{
				delay: 0.1 * i
				curve:Bezier.easeInOut
				time: 0.1
			}
		}
		hide:{
			opacity: 0
			animationOptions:{
# 				delay: (0.15 * i)
				curve:Bezier.easeInOut
# 				time: 0.5 + (0.15 * i)
				time: 1.8
			}
		}

	loadingDots.push(dot)
		
percentLoaded = new TextLayer
	parent: loading_container
	text: percentNum + "%"
# 	text: "Natural Language Learning in Progres"
	color: "white"
	fontSize: 20
	x: loading_container.x - 30
	y: loading_container.height/2 + 10 
	opacity: 100
		
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
	
# 	trainingInProgress.text = progressText
	
	startInterval()
	
	for i in [0...loadingDots.length]
		loadingDots[i].states.next()
		loadingDots[i].onAnimationEnd ->
			this.stateCycle("show","hide")
	Utils.delay stopPoint, ->
		stopInterval(interval)
		loading_container.animate
			opacity: 0
			animationOptions:
				time: 0.2
				curve: 'easeOut'

		percentLoaded.animate
			animationOptions:
				time: 0.2
				curve: 'easeOut'
	
# Main #
animateLoader("Loading Application",0.05)
				