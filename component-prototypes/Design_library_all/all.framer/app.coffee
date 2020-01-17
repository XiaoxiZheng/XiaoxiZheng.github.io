
##Page Layers
dashboard_layer = "<iframe width='#{Screen.width}' height='#{Screen.height}' src='https://github.build.ge.com/pages/212598191/component-prototypes/Dashboard/Dashboard.html' frameborder='0' allowfullscreen></iframe>" 

#Notification History Container
notification_history_layer = "<iframe width='#{Screen.width}' height='#{Screen.height}' src='https://github.build.ge.com/pages/212598191/component-prototypes/Notifications/Notification_history.framer/index.html' frameborder='0' allowfullscreen></iframe>"
#The underlying viewport. Updated for page navigation 
viewport_iframe = new Layer
	width: 1280
	height: 960
	ignoreEvents: false
	html: dashboard_layer

# Import Global Header file "prototype_resource"
sketch = Framer.Importer.load("imported/prototype_resource@2x", scale: 1)
#Search
search = sketch.search
search_icon = sketch.search_icon
#Search Mechanism
# Full set of searchable search_data
search_data = [
	"Show me", 
	"Show me top producing wells",
	"Show me high priority alerts", 
	"Show me immediate action items", 
	"Show me [all] wells < [300]", 
	"Show me [all] [ESP wells]", 
	"Show me details on [Thomas field]",
	"Help",
	"What is the condition on [Edison 1A]", 
	"Show me on the changes I've made]", 
	"How is my [all] [pad] performing against [goals]",
	"Show me SmartSignal Analysis", 
	"Update me on the recent changes across [entire] [organization]", 
	"Show me notifications", 
	"Show me [Digital Twin]" 
]

# Array to store matched results
results = []

search.ignoreEvents = false

search.states =
	default:{
		width: 290
		height: 25
		x: 240
		y: 26 
		time: 0.2
	}
	elongateSearch:{
		width: 690
		animationOptions:
				curve: 'ease-in'
	}

search.onClick ->
	search.animate("elongateSearch")
# 	overlay.opacity = 50
	
# TYPEAHEAD WRAPPER
type_wrapper = new Layer
	width: 690
	height: 280
	x: 270
	y: 48
	opacity: 0
	borderRadius: 0
	backgroundColor: "white"
# 	shadowX: 0, shadowY: 2, shadowBlur: 4
# 	shadowColor: "rgba(0,0,0,0.1)"
type_wrapper.style =
	"border" : "1px solid #e9e9e9"
	"padding" : "20px"

# type_wrapper.parent = search

# This creates a text input and adds some styling in plain js
inputElement = document.createElement("textarea")
inputElement.parent = search

inputElement.style["width"]  = "740px"
inputElement.style["height"] = "25px"
inputElement.style["boderRadius"] = "100"
inputElement.style["font"] = "15px/1.35em GE Inspira" #48px
inputElement.style["font-weight"] = "300"
inputElement.style["color"] = "#E1E1E1"
inputElement.style["-webkit-user-select"] = "text"
inputElement.style["padding-left"] = "20px"
inputElement.style["padding-top"] = "0px"
inputElement.style["background-color"] = "transparent"
inputElement.style["opacity"] = "#{search.opacity}"


# Set the value, focus and listen for changes
inputElement.placeholder = "| Search"
inputElement.value = ""
inputElement.focus()
inputElement.onkeyup = (e) ->	
#expand search box	
	search.animate("elongateSearch")
	inputElement.style["width"]  = "690px"
# Clear Everything
	matchedStrings = []
	matched = false
	
	# Garbage collect old layers
	_.invoke(type_wrapper.subLayers, "destroy")
	
	# Set values and Regex query
	val = inputElement.value.toLowerCase()
	reg = new RegExp(val, 'i');
	
	
	# Iterate through search_data and store names in matchedStrings array
	for i in [0..search_data.length - 1] 
		if search_data[i].match reg 
			matched = true
			matchedStrings.push(search_data[i])
	
	# If names match display the typeahead otherwise hide it
	if val != ""
		for layer in results
			layer.destroy()
		if matched is true		
			type_wrapper.animate
				properties:
					opacity: 1
				curve: "spring(800,80,0)"
			
			for j in [0..matchedStrings.length - 1]
				result = new TextLayer
					text: matchedStrings[j]
					superLayer: type_wrapper
					width: 540, height: 30,
					x: 10
					y: j * 31 + 10
					backgroundColor: "transparent"
					fontSize: 16
					color: "#09819C"
				
				results.push result
				
				result.onMouseDown ->
					window.open("https://github.build.ge.com/pages/212614318/mantle/search_prototype.html","_self")
						
				document.addEventListener 'keydown', (e) ->
				## Reserving 'enterKey' press to navigate a new search
					if (e.keyCode is 13)
						window.open("https://github.build.ge.com/pages/212614318/mantle/search_prototype.html","_self")

			type_wrapper.height = 20 + matchedStrings.length * 31
# 			type_wrapper.x = 90 + (val.length * 10) 			
			
		if matched is false
		
			type_wrapper.animate
				properties:
					opacity: 0
				curve: "spring(800,80,0)"
		
			Utils.delay 0.4, ->
				type_wrapper.height = 70
				
	else
		for layer in results
			layer.destroy()
		type_wrapper.animate
			properties:
				opacity: 0
			curve: "spring(800,80,0)"						
		Utils.delay 0.4, ->
			type_wrapper.height = 70



# Add textInputLayer to the Screen
search._element.appendChild(inputElement)
inputElement.parent = search

	
#Interaction Notes
animationAnnotation0 = "Press A to simulate a new Alerts"
animationAnnotation1 = "Press SPACEBAR to simulate a new notification (7)"
animationAnnotation2 = "Press Q to simulate dismiss-all notification"
animationAnnotation3 = "Click on any of the stacked notifications to expand all"

# print animationAnnotation0
# print animationAnnotation1
# print animationAnnotation2
# print animationAnnotation3
#Global Attributes 

#Canvas Drawing
xStart = 830
yStart = 80
cardWidth = 425
cardHeight = 125 
gutterSize = 10
cardsPerRow = 5
maxOnScreenNotifications = 3

#Notifications 
notificationLength = 7
notificationTriggerCount = 0 
notifications = []

alertsTriggerCount = 0
alerts = [] 

alertsInboxOpen = false 
inboxOpen = false


#clock stuff
interval = null 
secondsAgo = 0


#Methods/Functions

createAlertBanner = (currentTriggerCount) ->
	if currentTriggerCount < maxOnScreenNotifications
		alert = new Layer
			opacity: 0
			image: "images/New_Alert.png"
			x: xStart + 50
			y: yStart
			width: cardWidth
			height: cardHeight
			backgroundColor: "#D8D8D8"
			name: "alert" + currentTriggerCount
	else
		alert = new Layer
			opacity: 0
			image: "images/New_Alert.png"
			x: xStart + 50
			y: yStart + (cardHeight * maxOnScreenNotifications) + (maxOnScreenNotifications * gutterSize) + (currentTriggerCount - maxOnScreenNotifications)*5
			width: cardWidth
			height: cardHeight
			backgroundColor: "#D8D8D8"
			name: "alert" + currentTriggerCount
	alerts.push(alert)
		
	alerts[currentTriggerCount].states = 
		directionalFadeOut:{
			opacity: 0
			x: xStart + 50 
			scale  : currentTriggerCount * 0.12
			animationOptions:
				curve: 'ease-out'
				time: 0.2
		}
		animateIn:{
			opacity: 100
			x: xStart
			animationOptions:
				curve: 'ease-in'
				time: 0.2
		}
		shift:{
			y: yStart + (cardHeight * currentTriggerCount ) + (currentTriggerCount * gutterSize)
			animationOptions:
				curve: 'ease-in'
				time: 0.2
		}
	# for i in [0...alerts.length]
	alerts[currentTriggerCount].onMouseDown -> 
		viewport_iframe.html = notification_history_layer 
		alerts[currentTriggerCount].animate("directionalFadeOut")

#Clock
startInterval = ->
	interval = Utils.interval 1, ->
		secondsAgo += 1
		timeCounterText.text = secondsAgo + " seconds"
# 		print secondsAgo + " seconds"
		
stopInterval = ->
	clearInterval(interval)
	secondsAgo = 0
	timeCounterText.text = secondsAgo + " seconds"
# 	print secondsAgo + " seconds"
#Layers

##Generic Layers
overlay = new Layer
	width: 1280
	height: 890
	x: 0
	y: 70
	opacity: 0

background = new BackgroundLayer
	x: 0
	y: 0
	width: 1280
	height: 960
	opacity: 0

##Custom Layers for Notifications
inbox_light = new Layer
	opacity: 0
	image: "images/inbox_light.png"
	x: 765
	y: 75
	width: 430
	height: 525
inbox_dark = new Layer
	opacity: 0
	image: "images/inbox_dark.png"
	x: 780
	y: 70
	width: 425
	height: 545

alerts_inbox_dark = new Layer
	opacity: 0
	image: "images/alerts_inbox_dark.png"
	x: 800
	y: 70
	width: 425
	height: 494
badge = new Layer
	x: 1780
	y: 25
	width: 25
	height: 25
	borderRadius: 100
	backgroundColor: "white"
	opacity: 0
	
badgeCount = new TextLayer
	parent: badge
	width: 25
	height: 25
	y: 5
	fontFamily: "GE Inspira Sans"
	fontSize: 12
	textAlign: "center" 
	fontWeight: "bold"
	color: "black"
	text: notificationTriggerCount

alertBadge = new Layer
	x: 1610
	y: 25
	width: 25
	height: 25
	borderRadius: 100
	backgroundColor: "white"
	opacity: 0

alertBadgeCount = new TextLayer
	parent: alertBadge
	width: 25
	height: 25
	y: 5
	fontFamily: "GE Inspira Sans"
	fontSize: 12
	textAlign: "center"
	fontWeight: "bold"
	color: "black"
	text: alertsTriggerCount

for i in [0...notificationLength]
	if i < maxOnScreenNotifications
		notification = new Layer
			opacity: 0
			image: "images/New_Notification_2.png"
			x: xStart + 50
			y: yStart + (cardHeight * i ) + (i * gutterSize)
			width: cardWidth
			height: cardHeight
			backgroundColor: "#D8D8D8"
			name: "notification" + i
# 	else
# 		card = new Layer
# 			x: xStart + ((i - maxOnScreenNotifications) * 5)
# 			y: yStart + (cardHeight*maxOnScreenNotifications) + (maxOnScreenNotifications*gutterSize) + (i - maxOnScreenNotifications)*5
# 			width: cardWidth
# 			height: cardHeight
# 			width: cardWidth - 10*(i-maxOnScreenNotifications)
# # 			height: cardHeight - 10*(i-maxOnScreenNotifications)
# 			height: cardHeight * .9^(i-maxOnScreenNotifications)
# 			backgroundColor: "#D8D8D8"
# 			image: "images/New_Notification.png"
	else
		notification = new Layer
			opacity: 0
			x: xStart + 50
			y: yStart + (cardHeight*maxOnScreenNotifications) + (maxOnScreenNotifications*gutterSize) + (i - maxOnScreenNotifications)*5
			width: cardWidth
			height: cardHeight
# 			width: cardWidth - 10*(i-maxOnScreenNotifications)
# # 			height: cardHeight - 10*(i-maxOnScreenNotifications)
# 			height: cardHeight * .9^(i-maxOnScreenNotifications)
			backgroundColor: "#D8D8D8"
			image: "images/New_Notification_2.png"
	notifications.push(notification)

## Sketch Layers
notificationIcon = sketch.Notification
alertsIcon = sketch.Alerts

##Clock Layers
timeCounter = new Layer
	x: 1000
	y: 500
	backgroundColor: null
	opacity: 0
# 	html: secondsAgo + " seconds"
 
timeCounterText = new TextLayer
	color: "white"
	text: secondsAgo + " seconds"
	parent: timeCounter
#States
notificationIcon.states = 
	default:{
		scale: 1
		animationOptions:
				curve: 'ease-out'
	}
	enlarge:{
		scale: 1.3
		animationOptions:
				curve: 'ease-in'
	}
alertsIcon.states = 	
	default:{
		scale: 1
		animationOptions:
				curve: 'ease-out'
	}
	enlarge:{
		scale: 1.3
		animationOptions:
				curve: 'ease-in'
	}

for i in [0...notifications.length]		
	row = Math.floor(i/cardsPerRow)
	#y: yStart + (cardHeight * row ) + (row * 10)
	notifications[i].states =
		directionalFadeOut:{
			opacity: 0
			x: xStart + 50 
			scale  : i * 0.12
			animationOptions:
				curve: 'ease-out'
				time: 0.2
		}
		animateIn:{
			opacity: 100
			x: xStart
			animationOptions:
				curve: 'ease-in'
				time: 0.2
		}
		dismissSingleShift:{
			y: yStart + (cardHeight * (i-1)) + ((i-1) * gutterSize)
			animationOptions:
				curve: 'ease-in'
				time: 0.2 
		}
		expandStack:{
			y: yStart + (cardHeight * i ) + (i * gutterSize)
			animationOptions:
				curve: 'ease-in'
				time: 0.2 
		}
		dismissAll:{
			opacity: 0 
			x: 900
			y: yStart + (cardHeight * i ) + (i * gutterSize) - (cardHeight*i)
			scale  : i * 0.12
			animationOptions:
				curve: 'ease-out'
				time: 0.18   
		}
#Animation
notificationEnlarge = new Animation notificationIcon,
	notificationIcon.states.enlarge
	time: 0.4

notificationDefault = new Animation notificationIcon,
	notificationIcon.states.default
	time: 0.4
	

alertEnlarge = new Animation alertsIcon,
	alertsIcon.states.enlarge
	time: 0.4
alertDefault = new Animation alertsIcon,
	alertsIcon.states.default
	time: 0.4
#Events/User Input

##Inbox behaviors
notificationIcon.onMouseDown ->
	if(!inboxOpen)
		inbox_dark.opacity = 100
		overlay.opacity = 100 
		notificationEnlarge.start()
		if(alertsInboxOpen)
			alertsInboxOpen != alertsInboxOpen
			alerts_inbox_dark.opacity = 0
		inboxOpen = true
	else
		inbox_dark.opacity = 0
		overlay.opacity = 0
		notificationDefault.start()
		inboxOpen = false
		
alertsIcon.onMouseDown ->
	if(!alertsInboxOpen)
		alerts_inbox_dark.opacity = 100
		overlay.opacity = 100
		alertEnlarge.start()
		alertsInboxOpen = true
		if(inboxOpen)
			inboxOpen != inboxOpen
			overlay.opacity = 0
			inbox_dark.opacity = 0 
	else
		alerts_inbox_dark.opacity = 0
		overlay.opacity = 0
		alertDefault.start() 
		alertsInboxOpen = false
background.onMouseDown ->
	alerts_inbox_dark.opacity = 0
	inbox_dark.opacity = 0

# inbox_dark.onMouseDown ->
# 	viewport_iframe.html = notification_history_layer
# 
# alerts_inbox_dark.onMouseDown ->
# 	viewport_iframe.html = notification_history_layer

##Outside of stacked notifictions
notifications[0].onMouseDown ->
	notifications[0].animate("directionalFadeOut")
	for i in [1...notificationLength]
		notifications[i].animate("dismissSingleShift")			

##Within stacked notifications
notifications[notificationLength-1].onMouseOver ->
	scale: 1.3
notifications[notificationLength-1].onMouseDown ->
	for i in [maxOnScreenNotifications...notifications.length]
		notifications[i].animate("expandStack")

##KeyPress Events
document.addEventListener 'keydown', (e) ->
	## Reserving 'n' press to trigger new notification 
	if (e.keyCode is 78) && notificationTriggerCount < notifications.length  #Spacebar pressed && inside total notification arrary
		badge.opacity = 100
		tempNum = 0
		if notificationTriggerCount < alertsTriggerCount
			tempNum = alertsTriggerCount
		else if notificationTriggerCount == 0 && alertsTriggerCount == 0
			tempNum = 0
		else if notificationTriggerCount == alertsTriggerCount
			tempNum = notificationTriggerCount+1
		else 
			tempNum = notificationTriggerCount
		
		notifications[tempNum].animate("animateIn")
		startInterval() 
		
		notificationTriggerCount = tempNum+1
		
# 		print tempNum
		
		badgeCount.text   = notificationTriggerCount 
		notificationEnlarge.start()
		notificationEnlarge.on Events.AnimationEnd, ->
			notificationDefault.start()
	## Reserving 'Q' to dismiss all  notifications
	if (e.keyCode is 81)
		for i in [notificationTriggerCount-1...-1]
			notifications[i].animate("dismissAll")
			#Enlarge the alert icon based on the amount of onScreen notifications 
			notificationEnlarge.start()
			notificationEnlarge.on Events.AnimationEnd, ->
				notificationDefault.start()
			notificationTriggerCount = 0 # Resetting notificationTriggerCount 
		stopInterval() 
	## Reserving '1' to dimiss 1 notification
	if(e.keyCode is 49 ) 
		notifications[0].animate("directionalFadeOut")
		for i in [1...notificationLength]
			notifications[i].animate("dismissSingleShift")
		notificationTriggerCount = 0
		stopInterval()
	## Reserving 'a' to trigger an alart
	if(e.keyCode is 65 )
# 		tempNum = 0
# 		if alertsTriggerCount < notificationTriggerCount
# 			tempNum = notificationTriggerCount
# 		else 
# 			tempNum = alertsTriggerCount
			
		createAlertBanner(alertsTriggerCount)
		alerts[alertsTriggerCount].animate("animateIn")
		
		print alertsTriggerCount 
		
		for i in [0...alertsTriggerCount]
			alerts[i].animate("shift")
			print i
			
		startInterval()
		 		
		alertBadge.opacity = 100
		alertsTriggerCount++
		alertBadgeCount.text   = alertsTriggerCount 
		alertEnlarge.start()
		alertEnlarge.on Events.AnimationEnd, ->
			alertDefault.start()
# 		print "pressed a"
	## Reserving 'c' to trigger a case notification 
# 	if(e.keyCode is 67 )
# 		print "pressed c"
		
# 	print (e.keyCode);

document.addEventListener "contextmenu", (e) -> #RightClick
