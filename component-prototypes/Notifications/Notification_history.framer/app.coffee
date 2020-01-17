# Import file "prototype_resource"
sketch = Framer.Importer.load("imported/prototype_resource@2x", scale: 1)

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
# notification_history_img = new Layer
# 	parent: notification_list_scroll_component.content
# 	image: "images/notification_history_img.png"
# 	x: 5
# 	width: 995
# 	height: 661
# 	y: 95 #285
# 
# notification_history_img.states.add
# 	default:{
# 		y: 95
# 		opacity: 1
# 		animationOptions:
# 			curve: 'ease-in'
# 			time: 0.2
# 	}
# 	shiftDown:{
# 		y: 285
# 		opacity: .5
# 		animationOptions:
# 			curve: 'ease-in'
# 			time: 0.2
# 	}
#ESP Optimization Page Attributes

sandbox_conent = new Layer
	opacity: 0
	x: 55
	y: 165
	width: 1165
	height: 735
	image: "images/sandbox.png"

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
		animationOptions:
# 			delay: 0.2
			curve:'ease-in'
			time: 0.4
	}

# Sandbox_content
## Grey boxes for intermediate state
grey_boxes = []
 
grey_rec = new Layer
	opacity: 0
	x: 55
	y: 165
	width: 780
	height: 30
	image: 'images/grey/recommendations.png'
grey_boxes.push(grey_rec)

grey_save_states = new Layer
	opacity: 0
	x: 55
	y: 870
	width: 1165
	height: 30
	image:'images/grey/save_states.png'
grey_boxes.push(grey_save_states)

grey_charts = new Layer
	x: 100
	y: 295
	width: 1142
	height: 185
	image: 'images/grey/charts_sillos.png'
	opacity: 0
grey_boxes.push(grey_charts)

grey_chart_titles = new Layer
	x: 85
	y: 272
	width: 918
	height: 8
	image: 'images/grey/chart_title_sillos.png'
	opacity: 0
grey_boxes.push(grey_chart_titles)

grey_sliders = new Layer
	x: 100
	y: 630
	width: 1112
	height: 110
	image: 'images/grey/slider_sillo.png'
	opacity: 0
grey_boxes.push(grey_sliders)

grey_slider_titles = new Layer
	x: 100
	y: 612
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
		 
	grey_boxes[i].states = 
		offSet:{
			x: grey_boxes[i].x + (20 * tempNum * 0.5 )
# 			x: grey_boxes[i].x + (20 * i * 0.5)
		}
		slideIn:{
			x: grey_boxes[i].x - (20 * tempNum * 0.5 )
# 			x: grey_boxes[i].x - (20 * i * 0.5)
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
			
			sketch.facets.opacity = 0
			sketch.sub_header.opacity = 0
			notification_list_scroll_component.opacity = 0
				
			#Page Transition to Micro-app
			notification_history_title_static.opacity = 0
			
			notification_history_title.opacity = 0
			notification_history_title.animate("contextualBack")
			currentPageTitle.animate("display")
			
			for i in [0...grey_boxes.length]
# 				grey_boxes[i].states.next()
# 				grey_boxes[i].onAnimationEnd ->
# 					this.stateCycle("slideIn,offSet")
				
				grey_boxes[i].animate("offSet")
				grey_boxes[i].animate("slideIn")
				
			Utils.delay 0.5, ->
				for i in [0...grey_boxes.length]
# 					grey_boxes[i].opacity = 0
					grey_boxes[i].animate("easeOut")
					
# 			Utils.delay 1, ->
				sandbox_conent.animate("easeIn")


###
Main() 

1) Explicitly create 1 notification object & rest of the notification history is represented by notification_history_img
	TODO: Abstract and replace notification_history_img with actual contents 

2) Open peek for first item in history on page landing

3) Subsequent User interactions are handled in the respective objects
	onClick() Optimize Button is handled in 
		optimize_button.onMouseDown ->

###
createListItem(5) 

Utils.delay 1, ->
	notification_list_history[0].animate("openPeek")
	for i in [0...notification_list_history.length]
		notification_list_history[i].animate("shift")
# 	notification_history_img.animate("shiftDown")
	peekIsOpen = !peekIsOpen
