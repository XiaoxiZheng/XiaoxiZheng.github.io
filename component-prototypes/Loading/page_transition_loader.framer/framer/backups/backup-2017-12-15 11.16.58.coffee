# Import file "prototype_resource"
sketch = Framer.Importer.load("imported/prototype_resource@2x", scale: 1)

sketch_content_area = sketch.dashboard

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
#Donkey Loader
percentNum = 0
transitionTime = 3 #seconds

##Scaling
screen_width = Framer.Device.screen.width
screen_height = Framer.Device.screen.height

default_w = 547
default_h = 1200 

ratio = screen_width/default_w

loader_bg = new Layer
	opacity: 0
	backgroundColor: darkBlue
	width: screen_width
	height: screen_height
	y: 70
	
scrollCmpt = new PageComponent
	opacity: 100
	width: default_w
	height: default_h
	x: screen_width/4 + 50
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

#Web Loader
# bhge_logo.states.next()
# bhge_logo.onAnimationEnd ->
# 	bhge_logo.stateCycle("fullOpaque","zeroOpaque")

#Mobile Loader


#Donkey
##DonkeyBase
donkeyBase = new Layer
	parent: bhge_logo
	image: "images/donkey/donkeyBase.png"
	x: bhge_logo.x/2+15
	y: 13
# 	x: bhge_logo.x + bhge_logo.x/2+10
# 	y: bhge_logo.y + 10
	width: bhge_logo.width/12
	height: bhge_logo.width/12/208*184
# 	width: screen_width/15
# 	height: screen_width/15/208*184
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
	opacity: 100
# 	x: bhge_logo.x + bhge_logo.x - offSet
# 	y: bhge_logo.y + yOffset

#Utility Helper Functions
##Clock
interval = null 
pace = 0.02
stopPoint = pace * 100 + pace

startInterval = ->
	interval = Utils.interval pace, ->
		percentNum += 1
		percentLoaded.text = percentNum + "%"
		
stopInterval = ->
	clearInterval(interval)
	percentNum = 0

scrollCmpt.opacity = 0 
## loader_bg.opacity = 0 
#Notification 
notification_icon = sketch.notification 
notification_inbox = sketch.alerts_inbox
notification_inbox.opacity = 0 

# print notification_inbox.height
notification_inbox.height = 100

peekIsOpen = false 

notification_inbox.states =
	hide:{
		opacity: 0
		animationOptions:
			time: 0.2
			curve:'ease-out'
	}
	open:{
		opacity: 1
		height: 531
		animationOptions:
			time: 0.2
			curve:'ease-in'
	}
peek_listItem_inbox = new Layer
	image: "images/peek_notification_inbox.png"
	parent: notification_inbox
	x: 3
	y: 70
	width: 425
	height: 130

listItem = []

# listItem_inbox = new Layer
# 	image: "images/listItem_notification_inbox.png"
# 	parent: notification_inbox
# 	x: 3
# 	y: 70
# 	width: 425
# 	height: 90

listItem_history = new Layer
	image:"images/listItem_history.png"
	parent: notification_inbox
	x: 3
	y: 160
	width: 425
	height: 360
	
listItem_history.states = 
	default:{
		y: 160
		animationOptions:
			curve: 'ease-in'
			time: 0.2
	}
	shift:{
		y: 197
		animationOptions:{
			time: 0.2
			curve:'ease-in '
		}
	}

notification_inbox_footer = new Layer
	parent: notification_inbox
	image:"images/Notification_history_footer.png"
	y: 520
	width: 430
	height: 35

sandbox_conent = new Layer
	opacity: 0
	x: 55
	y: 270  + 50
	width: 1165
	height: 471
	image: "images/sandbox1.png"
	
sandbox_buttons = new Layer
	opacity: 0
	x: 55
	y: 165
	width: 1165
	height: 735
	image: "images/buttons.png"
	
sandbox_conent.states.add
	default:{
		opacity: 0
		x: 55
		y: 165
		width: 1165
		height: 735
	}
	easeIn: {
		opacity: 1
		y: 270 #165
		animationOptions:
# 			delay: 0.4
			curve:'ease-in'
			time: 0.4
	}
##Loading Method
animateLoader = () ->
	loader_bg.opacity = .9
	scrollCmpt.opacity = 100
	bhge_logo.animate("fullOpaque")
	
	startInterval()
	
	for i in [loadingDots.length-1...0]
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
###
Main() 
###

animateLoader()

notification_icon.onMouseDown ->
	if peekIsOpen
		notification_inbox.animate("hide")
		peekIsOpen =! peekIsOpen
	else
		notification_inbox.animate("open")
		peekIsOpen =! peekIsOpen				

peek_listItem_inbox.onMouseOver ->
	listItem_history.animate("shift")
peek_listItem_inbox.onMouseOut ->
	listItem_history.animate("default")
	
peek_listItem_inbox.onMouseDown ->
	sketch_content_area.opacity = 0
	if peekIsOpen
		notification_inbox.animate("hide")
	#transition
	sandbox_conent.animate("easeIn")
	sandbox_buttons.opacity = 100 
	
# 	animateLoader()
# 	
# 	Utils.delay stopPoint, ->
# 		sketch_content_area.opacity = 0
# 		if peekIsOpen
# 			notification_inbox.animate("hide")	
# 			
# 		stopInterval(interval)
# 		loader_bg.animate
# 			opacity: 0
# 			animationOptions:
# 				time: 0.2
# 				curve: 'easeOut'
# 		bhge_logo.animate("zeroOpaque") 
# 		percentLoaded.animate
# 			animationOptions:
# 				time: 0.2
# 				curve: 'easeOut'
# 				
# 		#transition
# 		sandbox_conent.animate("easeIn")
# 		sandbox_buttons.opacity = 100 


