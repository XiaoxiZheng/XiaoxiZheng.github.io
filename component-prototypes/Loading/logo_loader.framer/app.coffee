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
transitionTime = 3 #seconds

##Scaling
screen_width = Screen.width#Framer.Device.screen.width
screen_height = Screen.height#Framer.Device.screen.height

default_w = 547
default_h = 1200 

ratio = screen_width/default_w

#Page Setup
bg = new BackgroundLayer
	backgroundColor: blackBlue
	width: default_w
	height: default_h

scrollCmpt = new ScrollComponent
	scrollHorizontal: false
	opacity: 100
	width: default_w
	height: default_h
	scale: ratio
# 	originY: 0
    
#BHGE Logo
bhge_logo = new Layer
	parent: scrollCmpt.content
	image: "images/bhge_logo_white.png"
	x: scrollCmpt.width/4
	y: scrollCmpt.height/4
	width:  scrollCmpt.width/2
	height: scrollCmpt.width/2/400 * 189
	opacity: 100

bhge_logo.states = 
	default:{
		
	}
	zeroOpaque:{
		opacity: 0
		animationOptions:{
			curve:"ease-out"
			time: 1	
		} 
	}
	fullOpaque:{
		opacity: 100
		animationOptions:{
			curve:"ease-in"
			time: transitionTime	
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
     time: 1
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
	color: pureWhite
	fontSize: 20
	x: bhge_logo.x - offSet
	y: yOffset

#Utility Helper Functions
##Clock
interval = null 
pace = 0.004
stopPoint = pace * 100

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
for i in [loadingDots.length-1...0]
	loadingDots[i].states.next()
	loadingDots[i].onAnimationEnd ->
		this.stateCycle("show","hide")
		
Utils.delay stopPoint, ->
	stopInterval(interval)
	bhge_logo.animate("zeroOpaque") 
	percentLoaded.animate
		opacity: 0
		time: 1