#Set-up
new BackgroundLayer backgroundColor: "white", name: "background"

Colors = []
Segments = []

#Color Definition
blue = "#4CB0F6"
green = "#82C832"
orange = "#FD8D63"
purple = "#784BBF"

Colors.push(blue)
Colors.push(green)
Colors.push(orange)
Colors.push(purple)

######################################################################
# Create a layer to contain the circle
circleRadius	= 400
		
createCircle = (donut,numOfSegments) ->
	if donut
		lineWidth = 60
	else
		lineWidth	= 800
		
	circleViewSize = (circleRadius*2) + lineWidth
	
	for i in [0...numOfSegments]
		circle_segment = new Layer
			name: "Segment" + i
			width:  circleRadius #+ i * lineWidth
			height: circleRadius #+ i * lineWidth
			backgroundColor: ""
			style: stroke: Colors[i]
			custom: {}
			rotation: -90
		
		Segments.push(circle_segment)
		
		# position them
		circle_segment.centerX()
		circle_segment.centerY -100
		# Add a class to the layer we can target it easily
		circle_segment.classList.add circle_segment.name
		# Setup PathLength and Animate it
		circle_segment.custom.pathLength = 2 * Math.PI * circleRadius;
		circle_segment.html = """
		<svg viewBox='-#{lineWidth/2} -#{lineWidth/2} #{circleViewSize} #{circleViewSize}'>
			<circle fill='none' stroke-linecap='none' 
				stroke-width      = '#{lineWidth}'
				stroke-dasharray  = '#{circle_segment.custom.pathLength} #{circle_segment.custom.pathLength}'
				stroke-dashoffset = '#{circle_segment.custom.pathLength}'
				cx = '#{circleRadius}'
				cy = '#{circleRadius}'
				r  = '#{circleRadius}'/>
		</svg>"""
		
		circle_segment.custom.path = document.querySelector(".#{circle_segment.name} svg > :first-child")
		
		this.slider = new SliderComponent min: 0, max: 1, value: .74, knobSize: 50
		this.slider.centerX()
		this.slider.y = Screen.height/2 + 200 + i*70
		this.slider.on "change: value", ->
			updatePathFromSlider(circle_segment, @)
			print "hi"	
		updatePath(circle_segment,Utils.randomNumber(0,0.99996666666))	

# slider1.on "change:value", -> 
# 	updatePathFromSlider c1, @
# 	c1Percent = slider1.value
# slider2.on "change:value", ->
# 	updatePathFromSlider c2, @
# 	c2Percent = slider2.value
# slider3.on "change:value", -> 
# 	updatePathFromSlider c3, @
# 	c3Percent = slider3.value
# Utils.domComplete ->
updatePath = (cir, value) ->
	cir.custom.path.style.strokeDashoffset = "#{value * cir.custom.pathLength}"
	
# Multiply the slider value 0.0 to 1.0 times each SVG's path length
updatePathFromSlider = (cir, slider) ->
	value = slider.value
	value = 0.9999966666666667 if value is 1
	cir.custom.path.style.strokeDashoffset = "#{value * cir.custom.pathLength}"

#create a base pie chart
createCircle(false,4)
updatePath(Segments[0],0)
Utils.delay 0.3, ->
	for i in [1...Segments.length]
		randomNum = 1 - Utils.randomNumber(i*0.1,0.9999966666666667)
		updatePath(Segments[i],randomNum)


#Create Donut
donutRadius = circleRadius + 60
createDonut = (numOfSegments) ->
	lineWidth = 60
	circleViewSize = (donutRadius*2) + lineWidth
	for i in [0...numOfSegments]
		donut_segment = new Layer
			name: "DonutSegment" + i
			width: donutRadius + i * lineWidth #+ Math.pow(5,i-1)
			height: donutRadius + i * lineWidth #+ Math.pow(5,i-1)
			backgroundColor: ""
			style: stroke: Colors[i]
			custom: {}
			rotation: -90
		
# 		Segments.push(circle_segment)
		
		# position them
		donut_segment.centerX()
		donut_segment.centerY -100
		# Add a class to the layer we can target it easily
		donut_segment.classList.add donut_segment.name
		# Setup PathLength and Animate it
		donut_segment.custom.pathLength = 2 * Math.PI * donutRadius;
		donut_segment.html = """
		<svg viewBox='-#{lineWidth/2} -#{lineWidth/2} #{circleViewSize} #{circleViewSize}'>
			<circle fill='none' stroke-linecap='none' 
				stroke-width      = '#{lineWidth}'
				stroke-dasharray  = '#{donut_segment.custom.pathLength} #{donut_segment.custom.pathLength}'
				stroke-dashoffset = '#{donut_segment.custom.pathLength}'
				cx = '#{donutRadius}'
				cy = '#{donutRadius}'
				r  = '#{donutRadius}'/>
		</svg>"""
		
		donut_segment.custom.path = document.querySelector(".#{donut_segment.name} svg > :first-child")
		
		randomNum = 1 - Utils.randomNumber(i*0.1,0.9999966666666667)
		
		updatePath(donut_segment,randomNum)
		
Segments[0].onMouseDown ->
	createDonut(1)