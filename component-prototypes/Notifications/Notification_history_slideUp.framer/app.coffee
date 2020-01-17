# Import file "prototype_resource"
sketch = Framer.Importer.load("imported/prototype_resource@2x", scale: 1)
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
#Notification Attributes

notification_history_title_static = new TextLayer
	x: 255
	y: 100
	text: "NOTIFICATION HISTORY"
	color: "white"
	fontSize: 18
	opacity: 100

notification_history_title = new TextLayer
	x: 50
	y: 100
	text: "NOTIFICATION HISTORY"
	color: "white"
	fontSize: 18
	opacity: 0 

notification_history_title.states.add
	hovered:{
		color: "white"
	}
	pageTitle:{
		x: 255
		y: 100
		text: "NOTIFICATION HISTORY"
		color: "white"
		animationOptions: 
			curve: 'ease-in'
			time: 0.2
	}
	contextualBack:{
		x: 30
		opacity: 1
		text: "< NOTIFICATION HISTORY"
		color: "#09819C"
		animationOptions: 
			curve: 'ease-in'
			time: 0.4
	}

currentPageTitle = new TextLayer
	x: 255
	y: 100
	text: "ESP SANDBOX"
	color: "white"
	fontSize: 18
	opacity: 0
	
currentPageTitle.states.add
	default:{
		x: 275
		y: 100
		text: "ESP SANDBOX"
		color: "white"
		fontSize: 18
		opacity: 0
	}
	display:{
		opacity: 100
		animationOptions:
			delay: 0.5
			curve: "ease-in"
			time: 0.8
	}

##Notification_history_title Triggers
notification_history_title.onMouseOver ->
	notification_history_title.animate("hovered")

notification_history_title.onMouseOut ->
	notification_history_title.animate("contextualBack")
	
notification_history_title.onMouseDown ->
	notification_history_title.opacity = 0
	notification_history_title_static.opacity = 100
# 	notification_history_title.animate("pageTitle")
	sandbox_conent.opacity = 0
	sketch.facets.opacity = 100
	sketch.sub_header.opacity = 100
	notification_list_scroll_component.opacity = 100
	currentPageTitle.opacity = 0
	sandbox_buttons.opacity = 0


#Notification List Attribute
xStart = 260
yStart = 175
listWidth = 995
listHeight = 90
listPeekHeight = 280
listYGutter = 5
listBGColor = "#032C36"
canvasBGColor = "#121F26"

peekIsOpen = false

notification_list_history = [] 
notification_list_scroll_component = new ScrollComponent
	scrollHorizontal: false
	x: 255
	y: 175
	width: 1280
	height: 960
# 	backgroundColor: canvasBGColor

#Currently cheating with an img representation of notification history
notification_history_img = new Layer
	parent: notification_list_scroll_component.content
	image: "images/notification_history_img.png"
	x: 5
	width: 995
	height: 661
	y: 95 #285

notification_history_img.states.add
	default:{
		y: 95
		opacity: 1
		animationOptions:
			curve: 'ease-in'
			time: 0.2
	}
	shiftDown:{
		y: 285
		opacity: .5
		animationOptions:
			curve: 'ease-in'
			time: 0.2
	}
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
	opacity: 100

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
stopPoint = 2 + pace

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
scrollCmpt.opacity = 0 
# loader_bg.opacity = 0 

#ESP Optimization Page Attributes

# sandbox_conent = new Layer
# 	opacity: 0
# 	x: 55
# 	y: 165  + 50
# 	width: 1165
# 	height: 735
# 	image: "images/sandbox.png"
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

# Sandbox_content
## Grey boxes for intermediate state
grey_boxes = []
 
grey_rec = new Layer
	opacity: 0
	x: 55
	y: 165 + 50
	width: 780
	height: 30
	image: 'images/grey/recommendations.png'
grey_boxes.push(grey_rec)

grey_save_states = new Layer
	opacity: 0
	x: 55
	y: 870 + 50
	width: 1165
	height: 30
	image:'images/grey/save_states.png'
grey_boxes.push(grey_save_states)

grey_charts = new Layer
	x: 100 - 20
	y: 295 + 50
	width: 1142
	height: 185
	image: 'images/grey/charts_sillos.png'
	opacity: 0
grey_boxes.push(grey_charts)

grey_chart_titles = new Layer
	x: 85 - 35
	y: 272 + 50
	width: 918
	height: 8
	image: 'images/grey/chart_title_sillos.png'
	opacity: 0
grey_boxes.push(grey_chart_titles)

grey_sliders = new Layer
	x: 100 - 35
	y: 630 + 50
	width: 1112
	height: 110
	image: 'images/grey/slider_sillo.png'
	opacity: 0
grey_boxes.push(grey_sliders)

grey_slider_titles = new Layer
	x: 100 - 30
	y: 612 + 50
	width: 935
	height: 85
	image: 'images/grey/slider_title_sillos.png'
	opacity: 0
grey_boxes.push(grey_slider_titles)

#adding states to all the grey boxes
for i in [0...grey_boxes.length]
	# A hack of not animating the first & last layer (they happened to be buttons). 
	# TODO: Design a way that we can specified exactly which layers to animate & how and not just looping in a for loop
	tempNum = Math.max(0,(i/1-1)) 
	if tempNum > 0 
		tempNum = i 
		 
	grey_boxes[i].states.add
		offSet:{
# 			x: grey_boxes[i].x + (20 * tempNum * 0.5 )
			y: grey_boxes[i].y + 150 
		}
		slideIn:{
# 			x: grey_boxes[i].x - (20 * tempNum * 0.5 )
			y: grey_boxes[i].y - 50
			opacity: 1
			animationOptions:
				curve: 'ease-in'
				time: 0.4
		}
		easeOut:{
			opacity: 0
			animationOptions:
				curve: 'ease-out'
				time: 0.4
		}
#Methods

##Create notification list history
createListItem = (numOfItems)->
	for i in [0...numOfItems]
		listItem = new Layer
			parent: notification_list_scroll_component.content
			opacity: 100
			x: 5
			y: (i*(listYGutter+listHeight))
			width: listWidth
			height: listHeight
			clip: true
			backgroundColor: listBGColor
			name: "notification " + i
					
		listContent = new Layer
			parent: listItem
			width: listWidth
			height: listPeekHeight
			image: "images/notification_detail.png"
			clip: true
			
		optimize_button = new Layer
			parent: listItem
			x: 756
			y: 42
			width: 110
			height: 25
			borderWidth: 1
			borderColor: "#FFFFFF"
			backgroundColor: "transparent"
			
		optimize_text = new TextLayer
			parent: optimize_button
			fontSize: 15
			x: 25
			y: 2
			textAlign: "center"
			color: "white"
			text: "Optimize"
		
		secondary_button2 = new Layer
			parent: listItem
			x: 865
			y: 42
			width: 110
			height: 25
			borderWidth: 1
			borderColor: "#FFFFFF"
			backgroundColor: "transparent"
			
		secondary_text2 = new TextLayer
			parent: secondary_button2
			fontSize: 15
			x: 15
			y: 2
			textAlign: "center"
			color: "white"
			text: "Create Case"
		
		notification_list_history.push(listItem)
		
		optimize_button.states.add 
			default:{
				backgroundColor:"#transparent"
			}
			hovered:{
				backgroundColor:"#09819C"
			}
			clicked:{
				backgroundColor:"#012939"
			}
			
		listItem.states.add
			default:{
				x: 5
				y: (i*(listYGutter+listHeight))
				width: listWidth
				height: listHeight
				backgroundColor: listBGColor
				animationOptions:
					curve: 'ease-in'
					time: 0.2
			}
			openPeek:{
				x: 5
				y: (i*(listYGutter+listHeight))
				width: listWidth
				height: listPeekHeight
				animationOptions:
					curve: "spring(300, 30)"
					time: 0.2
			}
		listItem.onMouseDown ->
			if (!peekIsOpen)
				listItem.animate("openPeek")
				notification_history_img.animate("shiftDown")
				peekIsOpen = !peekIsOpen
			else
				listItem.animate("default")
				notification_history_img.animate("default")
				peekIsOpen = !peekIsOpen
		
		optimize_button.onMouseOut ->
			optimize_button.animate("default")
		optimize_button.onMouseOver ->
			optimize_button.animate("hovered")
		optimize_button.onMouseDown ->
			optimize_button.animate("clicked")
				
			#Page Transition to Micro-app
			loader_bg.opacity = .5
			scrollCmpt.opacity = 100
# 			bhge_logo.animate("fullOpaque")
			
			startInterval()
			for i in [loadingDots.length-1...0]
				loadingDots[i].states.next()
				loadingDots[i].onAnimationEnd ->
					this.stateCycle("show","hide")
					
			Utils.delay stopPoint, ->
				stopInterval(interval)
				
				sketch.facets.opacity = 0
				sketch.sub_header.opacity = 0
				notification_list_scroll_component.opacity = 0
				
				loader_bg.opacity = 0 
				bhge_logo.animate("zeroOpaque") 
				percentLoaded.animate
					opacity: 0
					time: 1
					
				notification_history_title_static.opacity = 0
				
				notification_history_title.opacity = 0
				notification_history_title.animate("contextualBack")
				currentPageTitle.animate("display")
				
	# 			for i in [0...grey_boxes.length]
	# # 				grey_boxes[i].animate("offSet")
	# 				grey_boxes[i].animate("slideIn")
	# 		
	# 			Utils.delay 0.4, ->
	# 				for i in [0...grey_boxes.length]
	# 					grey_boxes[i].animate("easeOut")
				
				sandbox_conent.animate("easeIn")
				sandbox_buttons.opacity = 100

###
Main() 

1) Explicitly create 1 notification object & rest of the notification history is represented by notification_history_img
	TODO: Abstract and replace notification_history_img with actual contents 

2) Open peek for first item in history on page landing

3) Subsequent User interactions are handled in the respective objects
	onClick() Optimize Button is handled in 
		optimize_button.onMouseDown ->

###
createListItem(1) 

Utils.delay 1, ->
	notification_list_history[0].animate("openPeek")
	notification_history_img.animate("shiftDown")
	peekIsOpen = !peekIsOpen