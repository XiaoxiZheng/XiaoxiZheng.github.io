background = new BackgroundLayer backgroundColor: "white", name: "background"

#Color Definition
pink = "#4CB0F6"
green = "#82C832"
orange = "#FD8D63"
font_grey_16 = "#666D76"

totalValue = 456

c1Percent = 0.74
c2Percent = 0.5
c3Percent = 0.3

######################################################################
# Create a layer to contain the circle
circleRadius   = 300
circumference = 2 * Math.PI * circleRadius

lineWidth = 60
circleViewSize = (circleRadius*2) + lineWidth

toolTipContainer = new Layer
	x: Screen.midX - circleRadius/6 + 10
	backgroundColor: "transparent"
toolTip1 = new TextLayer
	parent: toolTipContainer
	fontSize: 14
	y: Screen.midY - circleRadius + 55
# 	fontFamily: "GE Insipira Sans"
	color: "black"
	text: (1-c1Percent) * 100 + "%"
toolTip2 = new TextLayer
	parent: toolTipContainer
	fontSize: 14
	y: Screen.midY - circleRadius + 25
# 	fontFamily: "GE Insipira Sans"
	color: "black"
	text: (1-c2Percent) * 100 + "%"
toolTip3 = new TextLayer
	parent: toolTipContainer
	fontSize: 14
	y: Screen.midY - circleRadius - 10
# 	fontFamily: "GE Insipira Sans"
	color: "black"
	text: (1-c3Percent) * 100 + "%"

# dynamicToolTipContainer = new Layer
# 	x: Screen.midX - circleRadius/3
# 	y: Screen.midY - circleRadius 
# 	width: 115
# 	height: 65
# 	backgroundColor: "white"
# 	opacity: 0
# dynamicToolTipContainer.ItemText = new TextLayer
# 	parent: dynamicToolTipContainer
# 	fontSize: 14
# 	fontFamily: "GE Insipira Sans"
# 	color: "black"
# 	text: "Item Name"
# 	x: 15
# 	y: 5
# dynamicToolTipContainer.Percent = new TextLayer
# 	parent: dynamicToolTipContainer
# 	fontSize: 36
# # 	fontFamily: "GE Insipira Sans"
# 	color: green
# 	text: (1-c3Percent) * 100 + "%"
# 	x: 15
# 	y: 20
	
#Create a Title Layer in the middle
centerTitleContainer = new Layer
	width: circleRadius
	height: circleRadius
	x: Align.center
	y: Align.center
	backgroundColor: "transparent"
	
centerTitle = new TextLayer
	parent: centerTitleContainer
	name: "Title text layer"
	text: "Production"
# 	width: circleRadius
# 	height: circleRadius
	x: Align.center
# 	y: Align.center
	fontFamily: "GE Insipira Sans"
	fontSize: 36
	color: font_grey_16

dynamicValue = new TextLayer
	parent: centerTitleContainer
	fontFamily: "GE Insipira Sans"
	fontSize: 45
	color: orange
	x: centerTitle.x  + 10
	y: centerTitle.y + 50
	text: "234/"
	opacity: 0
dynamicValue.states = 
	default:
		opacity: 0
		options: 
			time: 0.3
			curve: Bezier.easeOut
	hovered:	
		opacity: 1
		options: 
			time: 0.3
			curve: Bezier.easeOut
centerTitleVaule = new TextLayer
	parent: centerTitleContainer
	name: "Title text value"
	text: totalValue
	x: Align.center
	y: centerTitle.y + 50
	fontFamily: "GE Insipira Sans"
	fontSize: 45
	color: "black"
centerTitleVaule.states = 
	default:
		fontSize: 45
		x: Align.center
		y: centerTitle.y + 50
		options: 
			time: 0.3
			curve: Bezier.easeOut
	hovered:
		fontSize: 24
		x: dynamicValue.x + 2*dynamicValue.fontSize - 15
		y: dynamicValue.y + dynamicValue.fontSize/2	
		options: 
			time: 0.3
			curve: Bezier.easeOut
c3 = new Layer
	name: "c3"
	width:  circleRadius + 2*lineWidth + 25
	height: circleRadius + 2*lineWidth + 25
	backgroundColor: ""
	style: stroke: orange
	custom: {}
	shadowBlur: 0
	rotation: -90
c2 = new Layer
	name: "c2"
	width:  circleRadius + lineWidth + 5
	height: circleRadius + lineWidth + 5
	backgroundColor: ""
	style: stroke: green
	custom: {}
	rotation: -90
	
c1 = new Layer
	name: "c1"
	width:  circleRadius 
	height: circleRadius
	backgroundColor: ""
	style: stroke: pink
	custom: {}
	rotation: -90

c3.onMouseOver ->
		
	centerTitleVaule.animate("hovered")	
	dynamicValue.text = Math.floor((1-c3Percent) * totalValue) + "/"
	dynamicValue.color = c3.style.stroke
	dynamicValue.animate("hovered")
	
# 	dynamicToolTipContainer.animate
# 		opacity: 1
# 	dynamicToolTipContainer.Percent.text = (1-c3Percent) * 100 + "%"
# 	dynamicToolTipContainer.Percent.color = c3.style.stroke
	
	c1.opacity = 0.5
	c2.opacity = 0.5
	c3.opacity = 1
	
	toolTip1.opacity = 0.3
	toolTip2.opacity = 0.3
	toolTip3.opacity = 1
	
# 	toolTip1.color = "black"
# 	toolTip2.color = "black"
# 	toolTip3.color = c3.style.stroke
	
c2.onMouseOver ->
	centerTitleVaule.animate("hovered")
	dynamicValue.text = Math.floor((1-c2Percent) * totalValue) + "/"
	dynamicValue.color = c2.style.stroke
	dynamicValue.animate("hovered")
	
# 	dynamicToolTipContainer.Percent.text = (1-c2Percent) * 100 + "%"
# 	dynamicToolTipContainer.animate
# 		opacity: 1
# 		dynamicToolTipContainer.Percent.color = c2.style.stroke
	c1.opacity = 0.5
	c2.opacity = 1
	c3.opacity = 0.5
	
	toolTip1.opacity = 0.3
	toolTip2.opacity = 1
	toolTip3.opacity = 0.3
	
# 	toolTip1.color = "black"
# 	toolTip2.color = c2.style.stroke
# 	toolTip3.color = "black"
	
c1.onMouseOver ->
	dynamicValue.text = Math.floor((1-c1Percent) * totalValue) + "/"
	dynamicValue.color = c1.style.stroke
	dynamicValue.animate("hovered")
	centerTitleVaule.animate("hovered")
	
# 	dynamicToolTipContainer.Percent.text = (1-c1Percent) * 100 + "%"
# 	dynamicToolTipContainer.animate
# 		opacity: 1
# 		dynamicToolTipContainer.Percent.color = c1.style.stroke
	
	c1.opacity = 1
	c2.opacity = 0.5
	c3.opacity = 0.5
	
	toolTip1.opacity = 1
	toolTip2.opacity = 0.3
	toolTip3.opacity = 0.3
	
# 	toolTip1.color = c1.style.stroke
# 	toolTip2.color = "black"
# 	toolTip3.color = "black"
	
c3.onMouseOut ->
	dynamicValue.animate("default")
	centerTitleVaule.animate("default")
# 	dynamicToolTipContainer.animate
# 		opacity: 0
	
	c1.opacity = 1
	c2.opacity = 1
	c3.opacity = 1
# c2.onMouseOut ->
# 	dynamicValue.animate("default")
# 	centerTitleVaule.animate("default")
# c1.onMouseOut ->
# 	dynamicValue.animate("default")
# 	centerTitleVaule.animate("default")
	toolTip1.opacity = 1
	toolTip2.opacity = 1
	toolTip3.opacity = 1
	
# 	toolTip1.color = "black"
# 	toolTip2.color = "black"
# 	toolTip3.color = "black"
	
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

updatePath = (cir, value) ->
	cir.custom.path.style.strokeDashoffset = "#{value * cir.custom.pathLength}"	
	
######################################################################
# Wait a bit so dom is ready before doing the intial animation
Utils.domComplete ->
	c1.custom.path = document.querySelector(".#{c1.name} svg > :first-child")
	c2.custom.path = document.querySelector(".#{c2.name} svg > :first-child")
	c3.custom.path = document.querySelector(".#{c3.name} svg > :first-child")

# Create a slider to manually control the SVG path
# Add Slider, set max to our path length
slider1 = new SliderComponent min: 0, max: 1, value: 1, knobSize: 50
slider2 = new SliderComponent min: 0, max: 1, value: 1, knobSize: 50
slider3 = new SliderComponent min: 0, max: 1, value: 1 , knobSize: 50

# Position our slider

slider1.y = (Screen.height/5 * 4) - slider1.knobSize
slider2.y = slider1.y + 88
slider3.y = slider2.y + 88

slider1.centerX()
slider2.centerX()
slider3.centerX()

slider1.on "change:value", -> 
	updatePathFromSlider c1, @
	c1Percent = slider1.value
slider2.on "change:value", ->
	updatePathFromSlider c2, @
	c2Percent = slider2.value
slider3.on "change:value", -> 
	updatePathFromSlider c3, @
	c3Percent = slider3.value

######################################################################
# Functions to update the path 

# Multiply the slider value 0.0 to 1.0 times each SVG's path length
updatePathFromSlider = (cir, slider) ->
	value = slider.value
	value = 0.9999966666666667 if value is 1
	cir.custom.path.style.strokeDashoffset = "#{value * cir.custom.pathLength}"

updatePathFromSlider1 = (cir, value) ->
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
		value: c1Percent
		options: {curve: Bezier.easeOut, time: 0.3}
	slider2.animate
		value: c2Percent
		options: {curve: Bezier.easeOut, time: 0.3}
	slider3.animate
		value: c3Percent
		options: {curve: Bezier.easeOut, time: 0.3}
	
	
	
	
	