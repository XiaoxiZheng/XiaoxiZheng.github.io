# SETTINGS
{Highcharts} = require "npm"

document.body.style.cursor = "auto"
Framer.Defaults.Layer.force2d = true
Framer.Extras.Hints.enable()
	
dashboardWidth = 1280

# COUNTER OPTIONS
options =
	useEasing : true, 
	useGrouping : true, 
	separator : '', 
	decimal : '.', 
	prefix : '', 
	suffix : ''

# ANIMATION CURVES
animateIn = "spring(750,60,50)"
animateOut = "spring(750,65,30)"

# BLUE SHADES
blue01 = "#0D1418" # background dark
blue02 = "#012939" # header
blue03 = "#065769"
blue04 = "#09819C"
blue05 = "#8BD6FF"

blue06 = "#006F87" # Global overlay color
logoBlue = "#0067A5"

# BASE COLORS
blue = '#00CCFF'
green = '#33FF00'
lemon = "#C5FF00"
yellow = '#FFC107'
red = "#ED2B2A"
orange = "#FF7900"
gray = "#555555"

blueGrey = "#E2E8ED"
highlightColor = blue04 

white = "#FFFFFF"
black = "#000000"

Screen.backgroundColor = bgColor

# Dark/Light mode tracking
darkMode = false 
bgColor = white
defaultFontColor = black

statusColor = ["#FF4545", "#FFCF45", "#45FF68"]
liftType = ["Gas Lift", "ESP", "PCP", "Rod Lift", "Plunger", "HPU"]

statusColor = ["#FF4545", "#FFCF45", "#45FF68"]

wellName = ["Bishop A #10", "Bishop A #11", "Bishop A #12", "Bishop A #13", "Bishop A #14", "Clark A #4", "Clark A #5", "Clark A #6", "Clark A #7", "Crozier A #1", "Crozier A #2", "Crozier A #3", "Pohler A #2", "Rayes BA #1", "Rayes BA #2", "Writte S #1", "Writte S #2", "Writte S #3", "Writte S #4", "Writte S #5", "Writte S #6", "Writte S #7"]

# TABLE DATA
tableData = JSON.parse Utils.domLoadDataSync "tableData.json"
dataTable = tableData.length
rowsData = [0...dataTable]

notificationsData = JSON.parse Utils.domLoadDataSync "notificationsData.json"
#              ANALYSIS             #
analysisContainer = new Layer
	width: 1250, height: 850
	x: 15, y: headerBar.height + 60
	clip: true
	backgroundColor: null
	visible: false
	opacity: 0

#              A / B Counters             #
aFrequency = new Layer
	parent: analysisContainer
	width: 375, height: 30, x: 50, y: 0
	borderColor: blue05
	borderWidth: 1
	backgroundColor: null
	opacity: 0
	html: '<div class="analysisLabel">Increase Frequency: </div>'
	
bFrequency = new Layer
	parent: analysisContainer
	width: 375, height: 30, x: aFrequency.width + 80
	borderColor: blue05
	borderWidth: 1
	backgroundColor: null
	opacity: 0
	html: '<div class="analysisLabel">Decrease WHP: </div>'
	
aIcon = new Layer
	parent: aFrequency
	width: 35, height: 30
	image: "images/frequencyA.png"

bIcon = new Layer
	parent: bFrequency
	width: 35, height: 30
	image: "images/frequencyB.png"
	
# HzCounter = new Layer
# 	parent: aFrequency
# 	width: 85, height: 25, x: 150, y: 1
# 	color: "white"
# 	backgroundColor: null
# 	clip: true
# HzCounter.html = '<div id="HzCounter" style="font-size:12px"></div>'
# canvasElement = HzCounter.querySelector("#HzCounter")
# HzNumber = new CountUp("HzCounter", 0, Utils.randomNumber(15, 100), 0, 4, options)
# HzNumber.start()

# whpCounter = new Layer
# 	parent: bFrequency
# 	width: 85, height: 25, x: 130, y: 1
# 	color: "white"
# 	backgroundColor: null
# 	clip: true
# whpCounter.html = '<div id="whpCounter" style="font-size:12px"></div>'
# canvasElement = whpCounter.querySelector("#whpCounter")
# whpNumber = new CountUp("whpCounter", 0, Utils.randomNumber(15, 100), 0, 4, options)
# whpNumber.start()

splineChartsContainer = new Layer #Dummy layer 
	parent: analysisContainer
	backgroundColor: "transparent"
	
#              SPLINE CHART CONTAINERS             #
vspCurveContainer = new Layer
	parent: analysisContainer
	width: 375, height: 240, y: aFrequency.height + 50, x: 50
	backgroundColor: blue01
	opacity: 0
vspCurveContainer.html = '<div id="vspCurveContainer" style="height:240px;"></div>'

gradientCurveContainer = new Layer
	parent: analysisContainer
	width: 375, height: 240, y: aFrequency.height + 50, x: vspCurveContainer.width + 80
	backgroundColor: blue01
	opacity: 0
gradientCurveContainer.html = '<div id="gradientCurveContainer" style="height:240px;"></div>'

iprCurveContainer = new Layer
	parent: analysisContainer
	width: 375, height: 240, y: aFrequency.height + 50, x: vspCurveContainer.width + gradientCurveContainer.width + 110
	backgroundColor: blue01
	opacity: 0
iprCurveContainer.html = '<div id="iprCurveContainer" style="height:240px;"></div>'

#              SPLINE CHARTS             #
# DynamicLoader.series(highCharts).then(->
drawSplineCurves = () ->
	vspCurveChart = Highcharts.chart('vspCurveContainer',
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'spline', renderTo: '', marginLeft: 20, marginRight: 20, marginTop: 35, marginBottom: 20, backgroundColor: null}
		title: {text:'VARIABLE SPEED PERFORMANCE CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', color: "white", fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: true, text: 'FLOW RATE (rb/d)', style: {color: "white"}}
		yAxis:
			title: {text: 'HEAD (ft)', style: {color: "white"}}
			labels: {enabled: false}
			gridLineColor: gray
			tickInterval: 10
			lineColor: "white"
			lineWidth: 1
		series: [{type: 'spline', name: 'Gas', data: [Utils.randomChoice([0..100]), Utils.randomChoice([0..100]), Utils.randomChoice([0..100])], color: blue}]
		legend:
			enabled: false
		tooltip:
			enabled: true
			shared: true
			useHTML: true
			backgroundColor: "white"
			borderColor: '#555555'
			borderWidth: 1
			shadow: false
			headerFormat: '<span class="metric">Flow Rate</span></br>'
			pointFormat: '<span class="row"><span class="alignLeft"><span style="color:{point.color}">\u25CF</span> {series.name} </span><span class="alignRight"><b> {point.y} (rb/d)</b></span></span>'
		plotOptions:
			line: {lineWidth: 1.5}
			series:
				marker: {enabled: false, symbol: 'circle'}
				states: {hover: {fillColor: null, lineWidth: 2, lineColor: null}}
				pointStart: Date.UTC(2017, 0, 1)
				pointInterval: 24 * 3600 * 1000
	)
	vspCurveContainer.onMouseOver ->
	vspCurveContainer.onMouseOut ->
		
	gradientCurveChart = Highcharts.chart('gradientCurveContainer',
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'spline', renderTo: '', marginLeft: 20, marginRight: 20, marginTop: 35, marginBottom: 20, backgroundColor: null}
		title: {text:'GRADIENT CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', color: "white", fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: true, text: 'PRESSURE (psig)', style: {color: "white"}}
		yAxis:
			title: {text: 'TRUE VERTICAL DEPTH (ft)', style: {color: "white"}}
			labels: {enabled: false}
			tickInterval: 10
			gridLineColor: gray
			lineColor: "white"
			lineWidth: 1
		series: [{type: 'spline', name: 'Gas', data: [Utils.randomChoice([0..100]), Utils.randomChoice([0..100]), Utils.randomChoice([0..100])], color: blue}]
		legend:
			enabled: false
		tooltip:
			enabled: true
			shared: true
			useHTML: true
			backgroundColor: "white"
			borderColor: '#555555'
			borderWidth: 1
			shadow: false
			headerFormat: '<span class="metric">Pressure</span></br>'
			pointFormat: '<span class="row"><span class="alignLeft"><span style="color:{point.color}">\u25CF</span> {series.name} </span><span class="alignRight"><b> {point.y} (rb/d)</b></span></span>'
		plotOptions:
			line: {lineWidth: 1.5}
			series:
				marker: {enabled: false, symbol: 'circle'}
				states: {hover: {fillColor: null, lineWidth: 2, lineColor: null}}
				pointStart: Date.UTC(2017, 0, 1)
				pointInterval: 24 * 3600 * 1000
	)
	gradientCurveContainer.onMouseOver ->
	gradientCurveContainer.onMouseOut ->
		
	iprCurveChart = Highcharts.chart('iprCurveContainer',
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'spline', renderTo: '', marginLeft: 20, marginRight: 20, marginTop: 35, marginBottom: 20, backgroundColor: null}
		title: {text:'IPR CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', color: "white", fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: true, text: 'FLOW RATE (stb/d)', style: {color: "white"}}
		yAxis:
			title: {text: 'FLOW PRESSURE (psia)', style: {color: "white"}}
			labels: {enabled: false}
			tickInterval: 10
			gridLineColor: gray
			lineColor: "white"
			lineWidth: 1
		series: [{type: 'spline', name: 'Gas', data: [Utils.randomChoice([0..100]), Utils.randomChoice([0..100]), Utils.randomChoice([0..100])], color: blue}]
		legend:
			enabled: false
		tooltip:
			enabled: true
			shared: true
			useHTML: true
			backgroundColor: "white"
			borderColor: '#555555'
			borderWidth: 1
			shadow: false
			headerFormat: '<span class="metric">Flow Pressure</span></br>'
			pointFormat: '<span class="row"><span class="alignLeft"><span style="color:{point.color}">\u25CF</span> {series.name} </span><span class="alignRight"><b> {point.y} (rb/d)</b></span></span>'
		plotOptions:
			line: {lineWidth: 1.5}
			series:
				marker: {enabled: false, symbol: 'circle'}
				states: {hover: {fillColor: null, lineWidth: 2, lineColor: null}}
				pointStart: Date.UTC(2017, 0, 1)
				pointInterval: 24 * 3600 * 1000
	)
	iprCurveContainer.onMouseOver ->
	iprCurveContainer.onMouseOut ->
# )

#              SURFACE FLOWRATE SLIDER             #
surfaceFlowrateSlider = new SliderComponent
	parent: analysisContainer
	x: 110, y: aFrequency.height + vspCurveContainer.height + 180, width: 210, height: 5
	min: 0, max: 2000
# 	value: 1500
	knobSize: 20
	opacity: 0
surfaceFlowrateSlider.fill.backgroundColor = blue
surfaceFlowrateSlider.backgroundColor = "#313C42"
surfaceFlowrateSlider.borderRadius = 0
surfaceFlowrateSlider.animateToValue(1500, {curve: Bezier.easeInOut, time: 0.5})

surfaceFlowrateLabel = new TextLayer
	parent: surfaceFlowrateSlider
	x: -60, y: -40, width: 200, height: 30
	text: "SURFACE FLOWRATE"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

surfaceFlowrateValue1 = new TextLayer
	parent: surfaceFlowrateSlider
	x: surfaceFlowrateSlider.width + 15, y: -5, width: 100
	text: 1800
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
surfaceFlowrateValue2 = new TextLayer
	parent: surfaceFlowrateSlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 1653
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
surfaceFlowrateUnit = new TextLayer
	parent: surfaceFlowrateSlider
	x: surfaceFlowrateSlider.width + 45, y: -5, width: 100
	text: "stb/d"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
#              BOTTOMHOLE PRESSURE SLIDER             #
bottomholePressureSlider = new SliderComponent
	parent: analysisContainer
	x: 110, y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 270
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 800
	knobSize: 20
	opacity: 0
bottomholePressureSlider.fill.backgroundColor = blue
bottomholePressureSlider.backgroundColor = "#313C42"
bottomholePressureSlider.borderRadius = 0
bottomholePressureSlider.animateToValue(800, {curve: Bezier.easeInOut, time: 0.5})

bottomholePressureLabel = new TextLayer
	parent: bottomholePressureSlider
	x: -60, y: -40, width: 200, height: 30
	text: "BOTTOMHOLE PRESSURE"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

bottomholePressureValue1 = new TextLayer
	parent: bottomholePressureSlider
	x: surfaceFlowrateSlider.width + 15, y: -5, width: 100
	text: 2000
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
bottomholePressureValue2 = new TextLayer
	parent: bottomholePressureSlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 1260
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
bottomholePressureUnit = new TextLayer
	parent: bottomholePressureSlider
	x: surfaceFlowrateSlider.width + 45, y: -5, width: 100
	text: "psig"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"

#             MOTOR TEMPERATURE SLIDER             #	
motorTempSlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + 310, y: aFrequency.height + vspCurveContainer.height + 180
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 1800
	knobSize: 20
	opacity: 0
motorTempSlider.fill.backgroundColor = red
motorTempSlider.backgroundColor = "#313C42"
motorTempSlider.knob.color = "white"
motorTempSlider.knob.width = 2
motorTempSlider.knob.height = 20
motorTempSlider.animateToValue(1800, {curve: Bezier.easeInOut, time: 0.5})

motorTempLabel = new TextLayer
	parent: motorTempSlider
	x: -60, y: -40, width: 200, height: 30
	text: "MOTOR TEMPERATURE"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

motorTempValue1 = new TextLayer
	parent: motorTempSlider
	x: motorTempSlider.width + 15, y: -5, width: 100
	text: 260
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
motorTempValue2 = new TextLayer
	parent: motorTempSlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 220
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
motorTempUnit = new TextLayer
	parent: motorTempSlider
	x: motorTempSlider.width + 45, y: -5, width: 100
	text: "F"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
#             FREQUENCY SLIDER             #	
frequencySlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + 310
	y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 270
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 500
	knobSize: 20
	opacity: 0
frequencySlider.fill.backgroundColor = lemon
frequencySlider.backgroundColor = "#313C42"
frequencySlider.knob.color = "white"
frequencySlider.knob.width = 2
frequencySlider.knob.height = 20
frequencySlider.animateToValue(500, {curve: Bezier.easeInOut, time: 0.5})

frequencyLabel = new TextLayer
	parent: frequencySlider
	x: -60, y: -40, width: 200, height: 30
	text: "FREQUENCY"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

frequencyValue1 = new TextLayer
	parent: frequencySlider
	x: motorTempSlider.width + 15, y: -5, width: 100
	text: 100
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
frequencyValue2 = new TextLayer
	parent: frequencySlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 50
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
frequencyUnit = new TextLayer
	parent: frequencySlider
	x: motorTempSlider.width + 45, y: -5, width: 100
	text: "Hz"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"

#              WELLHEAD PRESSURE SLIDER             #
wellheadPressureSlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + bottomholePressureSlider.width + 510
	y: aFrequency.height + vspCurveContainer.height + 180
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 1400
	knobSize: 20
	opacity: 0
wellheadPressureSlider.fill.backgroundColor = orange
wellheadPressureSlider.backgroundColor = "#313C42"
wellheadPressureSlider.borderRadius = 0
wellheadPressureSlider.knob.color = "white"
wellheadPressureSlider.knob.width = 2
wellheadPressureSlider.knob.height = 20
wellheadPressureSlider.animateToValue(1400, {curve: Bezier.easeInOut, time: 0.5})

wellheadPressureLabel = new TextLayer
	parent: wellheadPressureSlider
	x: -60, y: -40, width: 200, height: 30
	text: "WELLHEAD PRESSURE"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

wellheadPressureValue1 = new TextLayer
	parent: wellheadPressureSlider
	x: wellheadPressureSlider.width + 15, y: -5, width: 100
	text: 425
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
wellheadPressureValue2 = new TextLayer
	parent: wellheadPressureSlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 327
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
wellheadPressureUnit = new TextLayer
	parent: wellheadPressureSlider
	x: wellheadPressureSlider.width + 45, y: -5, width: 100
	text: "psig"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
#              INTAKE PRESSURE SLIDER             #
intakePressureSlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + bottomholePressureSlider.width + 510
	y: aFrequency.height + vspCurveContainer.height + 270
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 500
	knobSize: 20
	opacity: 0
intakePressureSlider.fill.backgroundColor = green
intakePressureSlider.backgroundColor = "#313C42"
intakePressureSlider.borderRadius = 0
intakePressureSlider.knob.color = "white"
intakePressureSlider.knob.width = 2
intakePressureSlider.knob.height = 20
intakePressureSlider.animateToValue(500, {curve: Bezier.easeInOut, time: 0.5})

intakePressureLabel = new TextLayer
	parent: intakePressureSlider
	x: -60, y: -40, width: 200, height: 30
	text: "INTAKE PRESSURE"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

intakePressureValue1 = new TextLayer
	parent: intakePressureSlider
	x: wellheadPressureSlider.width + 15, y: -5, width: 100
	text: 6000
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
intakePressureValue2 = new TextLayer
	parent: intakePressureSlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 1032
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
intakePressureUnit = new TextLayer
	parent: intakePressureSlider
	x: wellheadPressureSlider.width + 45, y: -5, width: 100
	text: "psig"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
# Listen for slider value updates
surfaceFlowrateSlider.knob.onDrag ->
	surfaceFlowrateValue1.text = Math.round(surfaceFlowrateSlider.value)
	surfaceFlowrateValue2.text = Math.round(surfaceFlowrateSlider.value/1.2)
	motorTempValue1.text = Math.round(motorTempSlider.value)
	motorTempValue2.text = Math.round(motorTempSlider.value/1.2)
	wellheadPressureValue1.text = Math.round(wellheadPressureSlider.value)
	wellheadPressureValue2.text = Math.round(wellheadPressureSlider.value/1.2)
	bottomholePressureValue1.text = Math.round(bottomholePressureSlider.value)
	bottomholePressureValue2.text = Math.round(bottomholePressureSlider.value/1.2)
	frequencyValue1.text = Math.round(frequencySlider.value)
	frequencyValue2.text = Math.round(frequencySlider.value/1.2)
	intakePressureValue1.text = Math.round(intakePressureSlider.value)
	intakePressureValue2.text = Math.round(intakePressureSlider.value/1.2)
	motorTempSlider.animate
		value: surfaceFlowrateSlider.value / 1
		options: {curve: "lineal", time: 0.1}
	wellheadPressureSlider.animate
		value: surfaceFlowrateSlider.value / 1.5
		options: {curve: "lineal", time: 0.1}
	bottomholePressureSlider.animate
		value: surfaceFlowrateSlider.value / 1.5
		options: {curve: "lineal", time: 0.1}
	frequencySlider.animate
		value: surfaceFlowrateSlider.value * 1.1
		options: {curve: "lineal", time: 0.1}
	intakePressureSlider.animate
		value: surfaceFlowrateSlider.value * 1.2
		options: {curve: "lineal", time: 0.1}
		
surfaceFlowrateSlider.knob.onDragEnd ->
	drawSplineCurves()
	
bottomholePressureSlider.knob.onDrag ->
	bottomholePressureValue1.text = Math.round(bottomholePressureSlider.value)
	bottomholePressureValue2.text = Math.round(bottomholePressureSlider.value/1.2)
	surfaceFlowrateValue1.text = Math.round(surfaceFlowrateSlider.value)
	surfaceFlowrateValue2.text = Math.round(surfaceFlowrateSlider.value/1.2)
	motorTempValue1.text = Math.round(motorTempSlider.value)
	motorTempValue2.text = Math.round(motorTempSlider.value/1.2)
	wellheadPressureValue1.text = Math.round(wellheadPressureSlider.value)
	wellheadPressureValue2.text = Math.round(wellheadPressureSlider.value/1.2)
	frequencyValue1.text = Math.round(frequencySlider.value)
	frequencyValue2.text = Math.round(frequencySlider.value/1.2)
	intakePressureValue1.text = Math.round(intakePressureSlider.value)
	intakePressureValue2.text = Math.round(intakePressureSlider.value/1.2)
	motorTempSlider.animate
		value: bottomholePressureSlider.value / 1
		options: {curve: "lineal", time: 0.1}
	wellheadPressureSlider.animate
		value: bottomholePressureSlider.value / 1.5
		options: {curve: "lineal", time: 0.1}
	surfaceFlowrateSlider.animate
		value: bottomholePressureSlider.value / 1.5
		options: {curve: "lineal", time: 0.1}
	frequencySlider.animate
		value: bottomholePressureSlider.value * 1.1
		options: {curve: "lineal", time: 0.1}
	intakePressureSlider.animate
		value: bottomholePressureSlider.value * 1.2
		options: {curve: "lineal", time: 0.1}
		
	bottomholePressureSlider.knob.onDragEnd ->
		drawSplineCurves()

analysisSave = new Layer
	parent: analysisContainer
	width: 1165, height: 30, x: 50
	y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + bottomholePressureSlider.height + 400
	image: "images/analysis-save.png"
	opacity: 0