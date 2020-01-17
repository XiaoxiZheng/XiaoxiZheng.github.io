# Import file "notification"
sketch = Framer.Importer.load("imported/notification@2x", scale: 1)

#Interaction Notes
animationAnnotation1 = "Press SPACEBAR to simulate a new notification (7)"
animationAnnotation2 = "Press Q to simulate dismiss-all notification"
animationAnnotation3 = "Click on any of the stacked notifications to expand all"

print animationAnnotation1
print animationAnnotation2
print animationAnnotation3
#notification Attributes 
xStart = 1350
yStart = 135
cardWidth = 525
cardHeight = 148
gutterSize = 10
cardsPerRow = 5
maxOnScreenNotifications = 3

notificationLength = 7
notifications = []

notificationTriggerCount = 0 

notificationIcon = sketch.Notification

#Layers
badge = new Layer
	x: 1750
	y: 50
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

for i in [0...notificationLength]
	if i < maxOnScreenNotifications
		notification = new Layer
			opacity: 0
			image: "images/New_Notification.png"
			x: xStart + 50
			y: yStart + (cardHeight * i ) + (i * gutterSize)
			width: cardWidth
			height: cardHeight
			backgroundColor: "#D8D8D8" #D8D8D8
# 			color: "#000000"
# 			html: "Notification "+i
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
			image: "images/New_Notification.png"
	notifications.push(notification)


#States
notificationIcon.states.add
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
	newRow = (i%%5 == 0)
	row = Math.floor(i/cardsPerRow)
	
	#y: yStart + (cardHeight * row ) + (row * 10)
	notifications[i].states.add
		default:{
			opacity: 0
			x: xStart + 50 
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
		expandStack:{
			y: yStart + (cardHeight * i ) + (i * gutterSize)
			animationOptions:
				curve: 'ease-in'
				time: 0.2 
		}
		dismissAll:{
			opacity: 0 
			x: 1500
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

#Events

#Within stacked notifications
notifications[notificationLength-1].onMouseOver ->
	scale: 1.3
notifications[notificationLength-1].onMouseDown ->
	for i in [maxOnScreenNotifications...notifications.length]
		notifications[i].animate("expandStack")

document.addEventListener 'keydown', (e) ->
	## Reserving spacebar press to trigger new notification 
	if (e.keyCode is 32) && notificationTriggerCount < notifications.length  #Spacebar pressed && inside total notification arrary
		badge.opacity = 100
		notifications[notificationTriggerCount].animate("animateIn")
		notificationTriggerCount++
		badgeCount.text   = notificationTriggerCount 
		notificationEnlarge.start()
		notificationEnlarge.on Events.AnimationEnd, ->
			notificationDefault.start()

# 		print "NotificationTriggerCount: " + notificationTriggerCount 
		
	## Reserving 'Q' to dismiss all  notifications
	if (e.keyCode is 81)
		for i in [notificationTriggerCount-1...-1]
			notifications[i].animate("dismissAll")
			#Enlarge the alert icon based on the amount of onScreen notifications 
			notificationEnlarge.start()
			notificationEnlarge.on Events.AnimationEnd, ->
				notificationDefault.start()

# 	print (e.keyCode);

## R
document.addEventListener "contextmenu", (e) -> #RightClick