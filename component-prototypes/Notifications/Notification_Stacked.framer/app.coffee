# Import file "prototype_resource"
# sketch = Framer.Importer.load("imported/prototype_resource@2x", scale: 1)
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
#Global Layers & Attributes

Placeholder = require 'LoadingPlaceholder'

xStart = 890
yStart = 85
cardWidth = 375
cardHeight_shrink = 110
cardHeight = 160
gutterSize = 10

maxOnScreenNotifications = 3
triggerCount = 0 
banners = [] 

##Scaling
screen_width = Framer.Device.screen.width
screen_height = Framer.Device.screen.height

default_w = 1280
default_h = 960 

ratio = screen_width/default_w
##Layers
background = new BackgroundLayer
	x: 0
	y: 0
	width: default_w
	height: default_h
	scale: ratio

#Notifications	

#Notification Inbox
inbox_width = 370
inbox_height = 530
inbox_content = []

notification_inbox = new Layer
	width: inbox_width
	height: inbox_height
	x: 900
	y: 75
	backgroundColor: "#FFFFFF"
	borderColor: "#3B5B6C"
	borderWidth: 1
	shadowX: 0
	shadowY: 0
	shashadowBlur: 4
	opacity: 0
# 	image: "images/Notifications/inbox_shape.svg"

notification_inbox.states = 
	on:
		opacity: 1
		options: 
			curve: Bezier.easeInOut
			time: 0.2
	off:
		opacity: 0
		options: 
			curve: Bezier.easeInOut
			time: 0.2
				
inbox_header = new Layer
	parent: notification_inbox
	image: "images/Notifications/inbox_header.png"
	width: 370
	height: 82

inbox_contentScroll = new ScrollComponent
	parent: notification_inbox
	width: inbox_width
	height: inbox_height - inbox_header.height
	y: 80
	backgroundColor: "transparent"
	scrollHorizontal: false
	mouseWheelEnabled: true

# ROW TOGGLE
toggleExpand = (layer, distance) ->
	distance = if layer.expanded is false then distance else - distance
	
	newHeight = layer.height + distance
	
	if newHeight > 160
		newHeight = 160
	else 
		newHeight = 110
		
	layer.animate
		height: newHeight
		options:
			curve: Bezier.easeIn
			time: 0.2
			
	layer.actions.animate
		opacity: 1
		options:
			curve: Bezier.easeIn
			time: 0.2
	
# # # this is for siblings to collapse on their own		
# 	for sib in layer.siblings
# 		if sib.expanded is true
# 			delay = .25
# 			toggleExpand(sib, sib.height)
	
	for sib in layer.siblings
		newY = sib.y + distance
		if sib.y > layer.y
			sib.animate
				y: newY
				options:
					curve: Bezier.easeIn
					time: 0.2
				
	layer.expanded = !layer.expanded
	
# Custom Placeholder
customPlaceholder = (layer) ->
  placeholder = new Layer
    name: "Row Container"
    width: layer.width
    height: layer.height
    borderRadius: layer.borderRadius
    backgroundColor: "transparent"
    x: 0
    y: 0
    opacity: 1

  for i in [0...banners.length]
    rows = new Layer
      parent: placeholder
      width: layer.width
      height: layer.height
      borderRadius: layer.borderRadius
      backgroundColor: "#eeeeee"
      clip: true
      x: 0
      y: layer.y

    gradient = new Layer
      name: "Gradient" + i
      parent: rows
      height: rows.height
      width: rows.width *2
      x: -rows.width
      opacity: 0.7
      style:
        background: "linear-gradient(to right, #eeeeee 10%, #dddddd 25%, #dddddd 30%, #eeeeee 45%)"

    animationLoading = new Animation gradient,
      x: rows.width
      time: 2

    animationLoading.start()
    animationLoading.on Events.AnimationEnd,  ->
      Utils.delay 0.4, => @restart()

  return placeholder
  
delayLoader = (layer, index) ->
  Utils.delay 0.5 * (index+5), ->
    layer.loaded()
    layer.img.animate
      opacity: 1
      y: 110 * index
      time: 0.1
       	
createNotificationInboxContent = (num) ->
	for i in [0...num]
		randomNum = Math.floor(Utils.randomNumber(1, 6))
		
		inbox_banner = new Layer
			parent: inbox_contentScroll.content
			width: cardWidth
			height: cardHeight_shrink
			y: 110 * i
			backgroundColor: "transparent"
			name: "inbox_banner_" + i
# 			image: "images/Notifications/inbox_banner/" + randomNum + "_banner.png"

		inbox_banner.expanded = false
		
		inbox_banner.img = new Layer
# 			parent: inbox_banner
			name: "ignore"
			parent: inbox_contentScroll.content
			width: cardWidth
			height: cardHeight_shrink
			y: 110 * i + 5
			image: "images/Notifications/inbox_banner/" + randomNum + "_banner.png"
			backgroundColor: "white"
			opacity: 0
		
		inbox_banner.actions = new Layer
			parent: inbox_banner.img
			width: cardWidth
			height: 60
			y: 110
			image: "images/Notifications/inbox_banner/withActions/" + randomNum + "_banner.png"
			backgroundColor: "white"
			opacity: 0	
# 		inbox_name = new Layer
# 			parent: inbox_banner
# 			x: 14.8, y: 10
# 			width: 85, height: 20
# 			opacity: 0
# # 			backgroundColor: "transparent"
# 			
# 		inbox_time = new Layer
# 			parent: inbox_banner
# 			x: 212, y: 10
# 			width: 130, height: 20
# 			opacity: 0
# # 			backgroundColor: "transparent"
			
		inbox_icon = new Layer
			parent: inbox_banner
			x: 14.8
			y: 40
			width: 43, height: 43
			opacity: 0
# 			image:"images/Notifications/inbox_banner/icons/" + randomNum + "_icons.svg"
# 			backgroundColor: "transparent"
		
# 		inbox_title = new Layer
# 			parent: inbox_banner
# 			x: 70, y: 35
# 			width: 270
# 			height: 20
# 			opacity: 0
# # 			backgroundColor: "transparent"
			
		inbox_content_text = new Layer
			parent: inbox_banner
			x: 70
			y: 40
			width: 270
			height: 43
			opacity: 0
# 			backgroundColor: "white"
		
# 		inbox_banner.bringToFront()
		
		inbox_content.push(inbox_banner)
		
# 		inbox_banner.placeholder
# 			customElement: customPlaceholder
		
		inbox_banner.placeholder
			depth: 1
			
		delayLoader(inbox_banner, i)
		
		
		inbox_content_text.onMouseOver ->
			#Expand banner
			if(this.parent.expanded is false)
				toggleExpand(this.parent, 50)	
		inbox_content_text.onMouseOut ->
			#Shrink banner
			if(this.parent.expanded is true)
				toggleExpand(this.parent, 50)
			
		inbox_banner.onClick ->
			#navigateToNotificationHistory

#Notification Banners 

#Methods/Functions
createBanner = (currentTriggerCount) ->
	banner = new Layer
			opacity: 0
			image: "images/Notifications/" + Math.floor(Utils.randomNumber(1, 6)) + "_banner.png"
			x: xStart + 150
			y: yStart
			width: cardWidth
			height: cardHeight
			name: "banner" + currentTriggerCount
	banners.push(banner)
		
	banners[currentTriggerCount].states.add 
		directionalFadeOut:{
			opacity: 0
			x: xStart + 100 
			y: yStart + (cardHeight + gutterSize ) * currentTriggerCount - (cardHeight * currentTriggerCount)
			scale: currentTriggerCount * 0.12
			options:
				curve: 'ease-out'
				time: 0.2
		}
		animateIn:{
			opacity: 1
			x: xStart
			options:
				curve: Bezier.easeInOut
				time: 0.3
		}
	
updateBannerAttribute = (index, xPos,yPos,opacity, scale) ->
	banners[index].x = xPos
	banners[index].y = yPos
	banners[index].opacity = opacity
	banners[index].scale = scale

##KeyPress Events
document.addEventListener 'keydown', (e) ->
# 	print (e.keyCode);
	## Reserving 'SPACEBAR' to trigger a notification banner
	if(e.keyCode is 32 )			
		createBanner(triggerCount)
		banners[triggerCount].animate("animateIn")	
		
# 		print "triggerCount: " + triggerCount + " vs. " + "banners.length: " + banners.length
		if triggerCount > 0
			##Regular case haven't hit maxOnScreenNotifications
			if triggerCount < maxOnScreenNotifications
				for i in [0...triggerCount]
					newYpos = yStart + ((cardHeight + gutterSize)  * (triggerCount - i))
					newOpacity = 100
					newScale = 1
					
					banners[i].animate
						y: newYpos
						options:
							curve: Bezier.easeInOut
							time: 0.3
					updateBannerAttribute(i,xStart, newYpos, newOpacity, newScale)
			else # maxOnScreenNotifications was hit, start stacking
				stackTill = triggerCount - maxOnScreenNotifications + 1
				for i in [0...stackTill+1]
					#stack it
					newYpos = yStart + (2 * (cardHeight + gutterSize + 10) - (10 * i)) 
					newOpacity = 1
					newScale = 1
					
					banners[i].animate
						y: newYpos
						options:
							curve: Bezier.easeInOut
							time: 0.3
					
					updateBannerAttribute(i,xStart, newYpos, newOpacity, newScale)
					
				for j in [stackTill+1...triggerCount]
					#push the second latest one down by 1 (shift)
					newYpos = yStart + (cardHeight + gutterSize)
					newOpacity = 1
					newScale = 1
					
					banners[j].animate
						y: newYpos
						options:
							curve: Bezier.easeInOut
							time: 0.3
							
					updateBannerAttribute(j,xStart, newYpos, newOpacity, newScale)
					
		triggerCount++		
	## Reserving 'Q' to dismiss all  notifications
	if (e.keyCode is 81)
		for i in [banners.length-1...-1]
			banners[i].animate("directionalFadeOut")
				
		banners = []
		triggerCount = 0
headerBar.onClick ->
	createNotificationInboxContent(5)
	notification_inbox.stateCycle("on", "off")
