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

default_w = 550
default_h = 1080 

ratio = screen_width/default_w

background = new BackgroundLayer
	backgroundColor: darkBlue
	
loader_bg = new Layer
	opacity: 0
	backgroundColor: darkBlue
	width: screen_width
	height: screen_height
	y: 0
	
scrollCmpt = new PageComponent
	opacity: 100
	width: default_w
	height: default_h
	x: screen_width/2 - default_w/2
	visible: false
# 	scale: ratio
# 	originY: 0

#BHGE Logo
bhge_logo = new Layer
	parent: scrollCmpt.content
	image: "images/bhge_logo_white.png"
	x: scrollCmpt.width/4
	y: scrollCmpt.height/4
	width:  scrollCmpt.width/2
	height: scrollCmpt.width/2/400 * 189
	opacity: 0
		
bhge_logo.states = 
	default:{
		
	}
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
#Donkey
##DonkeyBase
donkeyBase = new Layer
	parent: bhge_logo
	image: "images/donkey/donkeyBase.png"
	x: bhge_logo.x/2+15
	y: 13
	width: bhge_logo.width/12
	height: bhge_logo.width/12/208*184

##DonkeyTop
donkeyTop = new Layer
	parent: bhge_logo
	image: "images/donkey/donkeyTop.png"
	x: bhge_logo.x/2 + 3
	y: -2
# 	x: bhge_logo.x + bhge_logo.x/2 
# 	y: bhge_logo.y
	width: bhge_logo.width/5
	height: bhge_logo.width/5/384*222
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
for i in [0..10]
  dot = new Layer
    parent: bhge_logo
    width: 5
    height: 5
    x: 70
    y: 10 + 10 * i
    backgroundColor: logoBlue
    borderRadius: 6
    parent: bhge_logo
    opacity: 0
  dot.states = 
   show:{
    opacity: 1.0
    animationOptions:{
     delay: 0.15 * i
     curve:Bezier.easeIn
     time: 1.5
    }
   }
   hide:{
    opacity: 0
    animationOptions:{
#      delay: 0.15 * i
     curve:Bezier.easeOut
     time: 0.5 + (0.15 * i)
    }
   }
  loadingDots.push(dot)
		
offSet = 30
yOffset = 120

percentLoaded = new TextLayer
	parent: bhge_logo
	text: percentNum + "%"
# 	text: "Natural Language Learning in Progres"
	color: white
	fontSize: 20
	x: bhge_logo.x - offSet
	y: yOffset
	opacity: 100

trainingInProgress = new TextLayer
	parent: bhge_logo
	x: bhge_logo.x/2 -20
	y: yOffset + 40
	width: 600
	text: "Loading Trained Lanaguage Model"
	opacity: 100
	color: white
	fontSize: 20

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

scrollCmpt.visible = false
scrollCmpt.opacity = 0 
## loader_bg.opacity = 0 

animateLoader = (progressText, pace_) ->
	pace = pace_
	stopPoint = pace * 99 + pace

	loader_bg.opacity = .9
	scrollCmpt.opacity = 100
	bhge_logo.animate("fullOpaque")
	
	trainingInProgress.text = progressText
	
	startInterval()
	
	for i in [0...loadingDots.length-1]
		loadingDots[i].states.next()
		loadingDots[i].onAnimationEnd ->
			this.stateCycle("show","hide")
	Utils.delay stopPoint, ->
		stopInterval(interval)
		loader_bg.animate
			opacity: 0
			animationOptions:
				time: 0.2
				curve: 'easeOut'
		bhge_logo.animate("zeroOpaque") 
		percentLoaded.animate
			animationOptions:
				time: 0.2
				curve: 'easeOut'

# Main #
scrollCmpt.visible = true 
animateLoader("Loading Application",0.09)