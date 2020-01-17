{Pointer} = require "Pointer"
{InputLayer} = require "input"
FontAwesome = require "FontAwesome"

background = new BackgroundLayer backgroundColor: "white", name: "background"

#Color Definition
pink = "#4CB0F6"
green = "#82C832"
orange = "#FD8D63"

######################################################################
# Create a layer to contain the circle
circleRadius   = 300
circumference = 2 * Math.PI * circleRadius

lineWidth      = 600
circleViewSize = (circleRadius*2) + lineWidth

c1Value = 60
c2Value = 14
c3Value = 26 

c1 = new Layer
	name: "c1"
	width:  circleRadius * 2
	height: circleRadius * 2
	backgroundColor: ""
	style: stroke: pink
	custom: {}
	rotation: -90
c1TooltipTextContainer = new Layer
# 	x: 660 
# 	y: 330
	x: Screen.midX - circleRadius - 150
	y: Screen.midY - circleRadius + 100
	width: 115
	height: 65
	backgroundColor: "white"
# 	rotation: c1Value/100 * 180
	opacity: 0
c1TooltipTextContainer.ItemText = new TextLayer
	parent: c1TooltipTextContainer
	fontSize: 14
	fontFamily: "GE Insipira Sans"
	color: "black"
	text: "Item Name"
	x: 15
	y: 5
c1TooltipTextContainer.Percent = new TextLayer
	parent: c1TooltipTextContainer
	fontSize: 36
# 	fontFamily: "GE Insipira Sans"
	color: "black"
	text: c1Value + "%"
	x: 15
	y: 20
c2 = new Layer
	name: "c2"
	width:  circleRadius * 2
	height: circleRadius * 2
	backgroundColor: ""
	style: stroke: green
	custom: {}
	rotation: -90
c2TooltipTextContainer = new Layer
	x: Screen.midX - circleRadius + 150
	y: Screen.midY + 200
	width: 115
	height: 65
	backgroundColor: "white"
	opacity: 0
c2TooltipTextContainer.ItemText = new TextLayer
	parent: c2TooltipTextContainer
	fontSize: 14
	fontFamily: "GE Insipira Sans"
	color: "black"
	text: "Item Name"
	x: 15
	y: 5
c2TooltipTextContainer.Percent = new TextLayer
	parent: c2TooltipTextContainer
	fontSize: 36
# 	fontFamily: "GE Insipira Sans"
	color: "black"
	text: c2Value + " %"
	x: 15
	y: 20
		
c3 = new Layer
	name: "c3"
	width:  circleRadius * 2
	height: circleRadius * 2
	backgroundColor: ""
	style: stroke: orange
	custom: {}
	shadowBlur: 0
	rotation: -90
c3TooltipTextContainer = new Layer
	x: Screen.midX + circleRadius - 15
	y: Screen.midY
	width: 130
	height: 85
	backgroundColor: "white"
	opacity: 0
c3TooltipTextContainer.ItemText = new TextLayer
	parent: c3TooltipTextContainer
	fontSize: 14
	fontFamily: "GE Insipira Sans"
	color: "black"
	text: "Item Name"
	x: 15
	y: 5
c3TooltipTextContainer.Percent = new TextLayer
	parent: c3TooltipTextContainer
	fontSize: 36
# 	fontFamily: "GE Insipira Sans"
	color: "black"
	text:  c3Value + "%"
	x: 15
	y: 20
	
c3.editTextBox = new Layer
# 	parent: c3
	x: c3TooltipTextContainer.x + 100
	y: Screen.midY - 400
	width: 115
	height: 65
	borderWidth: 1
	borderColor: "#9299A2"
	backgroundColor: "white"
	opacity: 0
	
c3.editTextBox.ItemText = new TextLayer
	parent: c3.editTextBox
	fontSize: 14
	fontFamily: "GE Insipira Sans"
	color: "black"
	text: "Item Name"
	x: 15
	y: 5
c3.editTextBox.Percent = new TextLayer
	parent: c3.editTextBox
	fontSize: 36
# 	fontFamily: "GE Insipira Sans"
# 	color: "black"
	text:  c3Value + "%"
	x: 15
	y: 20
# 	opacity: 0.3
	
c3.editTextBox.control = new Layer
	parent: c3.editTextBox
	width: 20
	height: 65
	x: 95
	borderWidth: 1
	borderColor: "#9299A2" 
	backgroundColor: "transparent"
c3.controlArrowUp = new Layer
	parent: c3.editTextBox.control
	x: 3
	y: 20
	image: "images/TriangleV.svg"
	width: 11
	height: 7
	rotation: 180
c3.controlArrowDown = new Layer
	parent: c3.editTextBox.control
	x: 3
	y: 40
	image: "images/TriangleV.svg"
	width: 11
	height: 7

for c in [c1, c2, c3]
	# position them
	c.centerX()
	c.centerY -100
	# Add a class to the layer we can target it easily
	c.classList.add c.name
	# Setup PathLength and Animate it
	c.custom.pathLength = circumference;
	c.html = """
	<svg viewBox='-#{lineWidth/2} -#{lineWidth/2} #{circleViewSize} #{circleViewSize}'>
		<circle fill='none' stroke-linecap='none' 
			stroke-width      = '#{lineWidth}'
			stroke-dasharray  = '#{c.custom.pathLength} #{c.custom.pathLength}'
			stroke-dashoffset = '#{c.custom.pathLength}'
			cx = '#{circleRadius}'
			cy = '#{circleRadius}'
			r  = '#{circleRadius}'/>
	</svg>"""


######################################################################
######################################################################
# Create a slider to control the SVG path

#0, 0.6, 0.74

# Add Slider, set max to our path length
slider1 = new SliderComponent min: 0, max: 1, value: 1, knobSize: 50
slider2 = new SliderComponent min: 0, max: 1, value: 1, knobSize: 50
slider3 = new SliderComponent min: 0, max: 1, value: 1 , knobSize: 50

# Position our slider
slider1.y = (Screen.height/4 * 4) - slider1.knobSize
slider2.y = slider1.y + 88
slider3.y = slider2.y + 88

slider1.centerX()
slider2.centerX()
slider3.centerX()

slider1.on "change:value", -> updatePathFromSlider c1, @
slider2.on "change:value", -> updatePathFromSlider c2, @
slider3.on "change:value", -> updatePathFromSlider c3, @

######################################################################
# Functions to update the path 

# Multiply the slider value 0.0 to 1.0 times each SVG's path length
updatePathFromSlider = (cir, slider) ->
	value = slider.value
	value = 0.9999966666666667 if value is 1
	cir.custom.path.style.strokeDashoffset = "#{value * cir.custom.pathLength}"

updatePathFromSlider1 = (cir, value) ->
# 	print 
# 	value = slider.value
	value = 0.9999966666666667 if value is 1
	cir.custom.path.style.strokeDashoffset = "#{value * cir.custom.pathLength}"

updatePath = (cir, value) ->
	cir.custom.path.style.strokeDashoffset = "#{value * cir.custom.pathLength}"	
######################################################################
# Wait a bit so dom is ready before doing the intial animation
Utils.domComplete ->
	c1.custom.path = document.querySelector(".#{c1.name} svg > :first-child")
	c2.custom.path = document.querySelector(".#{c2.name} svg > :first-child")
	c3.custom.path = document.querySelector(".#{c3.name} svg > :first-child")

updatePathFromSlider c3, slider3
updatePathFromSlider c2, slider2
updatePathFromSlider c1, slider1

slider1.animate
	value: 0
	options: {curve: Bezier.easeOut, time: 0.3}
slider2.animate
	value: 0.6
	options: {curve: Bezier.easeOut, time: 0.3}
slider3.animate
	value: 0.74
	options: {curve: Bezier.easeOut, time: 0.3}
	
	
clicked = false
resetTextBox = ->
	c3.editTextBox.animate
			opacity: 0
			options:
				time: 0.5
				curve: Bezier.easeOut
		c3.animate
			scale: 1
			options: 
				time: 0.5
				curve: Bezier.easeOut
animateToolTips = ->
	c3TooltipTextContainer.animate
		opacity: 1
	c2TooltipTextContainer.animate
		opacity: 1
	c1TooltipTextContainer.animate
		opacity: 1
	
hideToolTips = ->
	c3TooltipTextContainer.animate
		opacity: 0
		options: 
			time: 0.1
			curve: Bezier.easeOut
	c2TooltipTextContainer.animate
		opacity: 0
		options:
			time: 0.1
			curve: Bezier.easeOut
	c1TooltipTextContainer.animate
		opacity: 0
		options: 
			time: 0.1
			curve: Bezier.easeOut

c3.onMouseOver ->
	document.body.style.cursor = "pointer"

c3.onMouseDown ->
	if clicked
		resetTextBox()
		
		c3TooltipTextContainer.Percent.text = c3Value + "%"
		
		c2Chunk = c2Value/(c2Value+c1Value)
		c2Value = Math.floor(c2Chunk * (100-c3Value))
		c2TooltipTextContainer.Percent.text = c2Value + "%"
		
		c1Value = 100 - c3Value - c2Value
		c1TooltipTextContainer.Percent.text = c1Value + "%"
		
		Utils.delay 0.3, ->
			animateToolTips()
		Utils.delay 3, ->
			hideToolTips()
	else
		hideToolTips()
			
		c3.editTextBox.animate
			opacity: 1
			options:
				time: 0.2
				curve: Bezier.easeOut
		c3.animate
			scale: 1.3
			options: 
				time: 0.2
				curve: Bezier.easeOut				
	clicked=!clicked

# c3.editTextBox.onMouseOver ->
# 	c3.editTextBox.control.animate
# 		opacity: 1
# 		options:
# 			time: 0.2
# 			curve: Bezier.easeOut
# c3.editTextBox.onMouseOut ->
# 	c3.editTextBox.control.animate
# 		opacity: 0
# 		options:
# 			time: 0.2
# 			curve: Bezier.easeOut

c3.controlArrowUp.onMouseDown ->
	c3Value++
	c3.editTextBox.Percent.text = c3Value + "%"
	updatedValue = 1 - (0.01*c3Value)
	updatePath(c3, updatedValue)
c3.controlArrowDown.onMouseDown ->
	c3Value--
	c3.editTextBox.Percent.text = c3Value + "%"
	updatedValue = 1 - (0.01*c3Value)
	updatePath(c3, updatedValue)
				
c3.editTextBox.Percent.onMouseDown ->
	c3Input = InputLayer.wrap(c3.editTextBox, c3.editTextBox.Percent)
	
	c3Input.onEnterKey ->
		c3Value = c3Input.value
		c3.editTextBox.Percent.text = c3Value + "%"
		c3TooltipTextContainer.Percent.text = c3Value + "%"
		
		c2Chunk = c2Value/(c2Value+c1Value)
		c2Value = Math.floor(c2Chunk * (100-c3Value))
		c2TooltipTextContainer.Percent.text = c2Value + "%"
		
		c1Value = 100 - c3Value - c2Value
		c1TooltipTextContainer.Percent.text = c1Value + "%"
		
		updatedValue = 1 - (0.01*c3Value)
		updatedValueC2 = updatedValue - 0.01*c2Value
		
		updatePath(c2, updatedValueC2)
		updatePath(c3, updatedValue)
		
		resetTextBox()
		
		
# 		#Setting Container to the right cartesian coordinate
# 		print c1Angle = c1Value/2/100 * 2*Math.PI
# 		print c2Angle = c1Angle*2 + (c2Value/2/100* 2 * Math.PI)
# 		print c3Angle = c1Angle*2 + c2Angle + (1-c3Value)/2/100*2*Math.PI 
# 		
# 		textRadius = circleRadius  
# 		c1X = textRadius * Math.cos(c1Angle) + c1.midX 
# 		c1Y = -textRadius * Math.sin(c1Angle) + c1.midY
# 		
# 		c2X = textRadius * Math.cos(c2Angle) + c1.midX 
# 		c2Y = -textRadius * Math.sin(c2Angle) + c1.midY
# 		
# 		c3X = textRadius * Math.cos(c3Angle) + c1.midX 
# 		c3Y = -textRadius * Math.sin(c3Angle) + c1.midY
# # 		
# 		print c1TooltipTextContainer.x = c1X 
# 		print c1TooltipTextContainer.y = c1Y
# 		
# 		print c2TooltipTextContainer.x = c1X
# 		print c2TooltipTextContainer.y = c2Y
# 		
# 		print c3TooltipTextContainer.x = c3X
# 		print c3TooltipTextContainer.y = c3Y
# 		

		Utils.delay 0.3, ->
			animateToolTips()
		Utils.delay 3 ,->
			hideToolTips()
		# c3.editTextBox.control.animate
# 			opacity: 0

# deltaY = 0
# deltaX = 0
# cirOriginX = c3.midX
# cirOriginY = c3.midY
# 
# cirStartingX = 660
# cirStartingY = 330
# 
# c3.onMouseDown ->
# 	print "MouseX: " + event.x
# 	print "MouseY: " + event.y
# 	
# c3.onMouseUp ->
# 	deltaX = cirOriginX - event.x
# 	deltaY = cirOriginY - event.y
# 	
# 	distance = Math.sqrt(deltaX*deltaX + deltaY*deltaY)
# 	
# # 	distanceToCicle = circleRadius - distance
# # 	print "distanceToCicle: " + distanceToCicle
# # 	
# # 	pointOnCircleX = event.x + distanceToCicle
# # 	pointOnCircleY = event.y + distanceToCicle
# # 	
# # 	endPointDeltaX = cirStartingX - pointOnCircleX
# # 	endPointDeltaY = cirStartingY - pointOnCircleY
# # 	
# # 	distanceToCircleOrigin = Math.sqrt(endPointDeltaX*endPointDeltaX + endPointDeltaY*endPointDeltaY)
# # 	value = Utils.modulate(distanceToCircleOrigin, [0,circumference], [0, 1])
# # 	print "distanceToCircleOrigin: " + distanceToCircleOrigin
# 	
# 	value = Utils.modulate(distance, [0,circumference], [0, 1])
# 	
# # 	degreeFromStart = 2 * Math.asin(distanceToCircleOrigin/(2*circleRadius))
# # 	print "degreeFromStart: " + degreeFromStart
# # 	value = Utils.modulate(degreeFromStart, [0,360], [0, 1])
# # 	print "value: " + value
# 	
# 	if deltaY > 0 #endPointDeltaY
# 		updatePathFromSlider1(c3, slider3.value + value)
# 	if deltaY < 0 #endPointDeltaY
# 		updatePathFromSlider1(c3, slider3.value + value*-1)
		

	
	