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
# CSS STYLES
Utils.insertCSS ("
	section {border-top:1px solid #fff; margin:15px 15px 0 15px; width:210px; padding:0; font-size:14px;}
	section.selectTag {border-top:none; margin-top: 1rem;}
	h2 {font-size:14px; margin:5px 12px 0 12px; padding-top:10px;}
	h2 > span, li > span {float:right;}
	.pill {color: #FFF; font-size: 12px; line-height: 2.2; padding: 0 10px 0 12px; background-color: #065769; border-radius: 20px; height: 25px; display:inline-block;}
	.close {background: url('images/close-icon.svg') right center no-repeat; background-size:cover; display:inline-block; width:10px; float:right; margin:8px 0 0 10px; height:10px;}
	.check-wrapper {position:relative; background-color:#032C36; color:#6BC0D3; border-bottom:1px solid #0F1D25; padding: 5px 0;}
	.check-wrapper input {position:absolute; z-index: 2; top:12px; left:12px;}
	label {padding-left:35px;}
	.more-btn {display:block; float:right; color:#6BC0D3; margin:0 12px 0 0;}
	.blueQuote {color:#6BC0D3;}
	.rowBody {color: #2477b2; font-size:13px; line-height:15px; font-weight:400; font-family:GE Inspira Sans;}
	a {text-decoration: none; color:#2477b2;}
	.rowContent {color:#343A40; font-size: 13px; line-height:15px; font-weight:400; font-family:GE Inspira Sans; text-align:right; float:right;}
	.rowHeader {color:#343A40; font-size:14px; line-height:16px; font-weight:500; font-family:GE Inspira Sans;}
	.rowEntry {font-size: 15px; font-family:GE Inspira Sans; line-height: 2.8; padding: 5px 0px 0px 0px;}
	.analysisLabel {font-size: 12px; font-family:GE Inspira Sans; line-height: 2.5; padding: 0px 0px 0px 45px;}
	.rowCircle{font-size: 18px; padding: 4px 0 0 0;}
	.columnHeader {font-size:12px; line-height: 2.8; text-transform: uppercase; padding: 0px 0px 0px 10px;}
	.headerBorder {border: 1px solid #09819C;}
	.alignRight {text-align:right; float:right;}
	.alignLeft {text-align:left;}
	.metric {color:#868E96; line-height:20px;}
	.row {width:160px; display:block; margin-bottom:3px;}
	.rowWide{width: 220px; display:block; margin-bottom:3px;}
	.label {z-index: 1;}
	.greenLegend {color:white; font: 12px GE Inspira Sans; line-height:1.5rem; padding: 0 0.5rem; background-color:#2F373C; border-left:4px solid #33FF00;}
	.waterLegend {color:white; font: 12px GE Inspira Sans; line-height:1.5rem; padding: 0 0.5rem; background-color:#2F373C; border-left:4px solid #00CCFF;}
	.gasLegend {color:white; font: 12px GE Inspira Sans; line-height:1.5rem; padding: 0 0.5rem; background-color:#2F373C; border-left:4px solid #FF7900;}
	.marker{cursor:pointer; width:17px; height:21px;}
	.mapboxgl-popup {max-width:200px; font:15px 'GE Inspira Sans'; color:black;}
	ul {list-style:none;}
	li {font-size: 15px; font-family:GE Inspira Sans; color:#8BD6FF; padding:5px 12px; border:none;}
	
	ul.selectMenu {margin-top:4px; height: 30px; width: 120px; color:#fff; font:15px GE Inspira Sans; background-color: #065769;}
	ul.selectMenu li {padding:5px 15px; z-index: 2; list-style:none;}
	ul.selectMenu li:not(.init) {float: left; width:90px; display:none; background-color:#666; }
	ul.selectMenu li:not(.init):hover, ul li.selected:not(.init) { background: #09f; }
	ul.selectMenu li.init {cursor:pointer;}
	.dots {padding: 5px 10px; list-style:none;}
	.dots li { position:relative;}
	.dots li > span {color:#fff;  margin-left:5px; font-size:14px; position:absolute; top:2px; left:25px;}
")
#Global Variables
pageNames = [
	'Dashboard',
	'MWEO',
	'Notifications'
	'Search'
]

#Header
logo.onClick ->
	pageIndex = findPageIndex("Dashboard")
	pages[pageIndex].animate("active")
	pages[pageIndex].bringToFront()
	appDrawerContainer.bringToFront()
	
	Utils.delay 1, ->
		scaleDown(pageIndex)
			
	animateAllPagesToDefault()
	
	appDrawerContainer.animate("stateB")
	animateSearchComponents(false) 

search.onClick ->
	pageIndex = findPageIndex("Search")
	pages[pageIndex].animate("active")
	pages[pageIndex].bringToFront()
	
# 	SearchHistory.bringToFront()
	appDrawerContainer.bringToFront()
	
	animateSearchComponents(true) 
	Utils.delay 1, ->
		scaleDown(pageIndex)
			
	animateAllPagesToDefault()
	
notification.onClick ->
	pageIndex = findPageIndex("Notifications")
	pages[pageIndex].animate("active")
	pages[pageIndex].bringToFront()
	appDrawerContainer.bringToFront()
	# 	pageComp.snapToPage(pages[0])
	
	Utils.delay 1, ->
		scaleDown(pageIndex)

	animateAllPagesToDefault()
	
	appDrawerContainer.animate("stateB")
	animateSearchComponents(false) 


#Helper Functions
scaleDown = (exceptionIndex) ->
	for i in [0...pages.length]
		if i != exceptionIndex
			pages[i].animate
				scale: 0.95

animateAllPagesToDefault = () ->
	for i in [0...pages.length]
		pages[i].animate("default")
		
findPageIndex = (pageName) ->
	for i in [0...pageNames.length]
		if pageNames[i] == pageName
			return i
			

# APP DRAWER
appsIcon = new Layer
	parent: headerBar
	width: 22, height: 23
	y: Align.center, x: 25
	backgroundColor: null
	image: "images/apps-icon.svg"
	
appDrawerContainer = new Layer
	width: 240, height: 890
	y: headerBar.height, x: -240
	backgroundColor: blue04
	shadowX: 2
	shadowBlur: 2
	shadowColor: 'rgba(0, 0, 0, 0.5)'
	
dashboardsLabel = new TextLayer
	parent: appDrawerContainer
	x: 15, y: 15
	text: "Dashboards"
	fontFamily: "GE Inspira Sans"
	fontSize: 15
	color: "white"
	
appsLabel = new TextLayer
	parent: appDrawerContainer
	x: 120, y: 15
	text: "Apps"
	fontFamily: "GE Inspira Sans"
	fontSize: 15
	color: "white"
	
assetsLabel = new TextLayer
	parent: appDrawerContainer
	x: 180, y: 15
	text: "Assets"
	fontFamily: "GE Inspira Sans"
	fontSize: 15
	color: "white"
	opacity: 0.3
	
selector = new Layer
	parent: appDrawerContainer
	height: 3, width: dashboardsLabel.width
	x: 15, y: 35
	backgroundColor: blue05
	
appDrawerDashboards = new Layer
	parent: appDrawerContainer
	width: 193, height: 72, x: Align.center, y: 60
	image: "images/appDrawer-dashboards.svg"
	
appDrawerApps = new Layer
	parent: appDrawerContainer
	width: 192, height: 148, x: Align.center, y: 60
	image: "images/appDrawer-apps.svg"
	opacity: 0
	visible: false

appDrawerContainer.states =
	stateA:
		x: 0
# 		visible: true
		animationOptions:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.2
	stateB:
		x: -240
# 		visible: false
		animationOptions:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.15
			
appDrawerContainer.animate ("stateB")

# OPEN AND CLOSE APP DRAWER
appsIcon.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
appsIcon.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
appsIcon.on Events.Click, ->
	appDrawerContainer.stateCycle "stateA", "stateB"

# DASHBOARDS TAB
dashboardsLabel.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
dashboardsLabel.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
dashboardsLabel.on Events.Click, ->
	selector.animate
		x: this.x
		width: this.width
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	Utils.delay 0.1, ->
		appDrawerDashboards.animate
			opacity: 1
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
		appDrawerDashboards.visible = true
	appDrawerApps.animate
			opacity: 0
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
			appDrawerApps.visible = false
			
# APPS TAB
appsLabel.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
appsLabel.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
appsLabel.on Events.Click, ->
	selector.animate
		x: this.x
		width: this.width
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	appDrawerDashboards.animate
		opacity: 0
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	appDrawerDashboards.visible = false
	Utils.delay 0.1, ->
		appDrawerApps.animate
			opacity: 1
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
		appDrawerApps.visible = true
		
appDrawerDashboards.on Events.Click, ->
	pageIndex = findPageIndex("Dashboard")
	pages[pageIndex].animate("active")
	pages[pageIndex].bringToFront()
	appDrawerContainer.bringToFront()
	
	Utils.delay 1, ->
		scaleDown(pageIndex)
			
	animateAllPagesToDefault()
	
	animateSearchComponents(false) 
	appDrawerContainer.animate("stateB")
				
appDrawerApps.on Events.Click, ->
	pageIndex = findPageIndex("MWEO")
	pages[pageIndex].animate("active")
	pages[pageIndex].bringToFront()
	appDrawerContainer.bringToFront()
	
	Utils.delay 1, ->	
		scaleDown(pageIndex)
			
	animateAllPagesToDefault()
	
	appDrawerContainer.animate ("stateB")
	animateSearchComponents(false) 
	
# ASSETS TAB
assetsLabel.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
assetsLabel.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
assetsLabel.on Events.Click, ->
	selector.animate
		x: this.x
		width: this.width
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	appDrawerDashboards.animate
			opacity: 0
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
	appDrawerApps.animate
			opacity: 0
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
#Page Component
## This whole app is a giant pageComponent

pages = []

pageComp = new Layer
	parent: IntelliStream_App
	y: headerBar.height
	originY: 0
	width: 1280
	height: 1187
	backgroundColor: bgColor
	scrollHorizontal: false
	mouseWheelEnabled: true

createPageComp = (num) ->
	for i in [0...num]
		# creating pages
		page = new ScrollComponent
			parent: pageComp
			size: pageComp.size
			backgroundColor: bgColor
			x: 0
			y: headerBar.height
			parent: pageComp.content
			name: pageNames[i] + " ScrollComponent"
			scale: 0.95
			opacity: 0
# 			visible: false
			scrollHorizontal: false
			mouseWheelEnabled: true
			
		page.scrollHorizontal = false
		
		pageContent = new Layer
			parent: page.content
			name: pageNames[i] + " Content"
			width: pageComp.width
			height: pageComp.height
			image: "images/page_placeholders/" + pageNames[i] + ".png"
			
		page.states = 
			default:
# 				scale: 0.95
				opacity: 0
# 				visible: false
				options:
					curve: Bezier.easeInOut
					time: 0.5
			active:
				opacity: 1
# 				visible: true
				scale: 1
				options: 
					curve: Bezier.easeInOut
					time: 0.5
			
		pages.push(page)
		
#changing active on page scroll
# pageComp.onChange "currentPage", ->
# 	page.states.switch("default") for page in pages
# 	current = pageComp.horizontalPageIndex(pageComp.currentPage)
# 	selectedCrumb = pageComp.currentPage.name
# 	pages[current].states.switch("active")
# 	for i in [0...Breadcrumb.length]
# 		if Breadcrumb[i].name == selectedCrumb
# 			#move the indicator here
# 			breadCrumbIndicator.animate
# 				x: calcCrumbXPosition(i)
# 				width: calcCrumbContainerWidth(i) - 15 #adjust for padding
# 				options: 
# 					curve: Bezier.easeInOut
# 					time: 0.2
# 		else
# 			Breadcrumb[i].animate("default")
# 			pages[i].animate("default")
			

createPageComp(pageNames.length)
pages[0].animate("active")
pages[0].bringToFront()
appDrawerContainer.bringToFront()
# pageComp.snapToPage(pages[0])
# pageComp.content.children[0].states.switchInstant "active"
# DASHBOARD

## DYNAMIC TABLE Widget for Dashboard
tableWidth = 1250
tableHeight = 470
tableFullHeight = 850
columnWidth = tableWidth / 11
spineWidth = 240
headerHeight = 40
rowCount = 21

gasData = [] # orange
waterData = [] # blue
oilData = [] # green

generateRandomKPIs = () ->		
	for i in [0..101-1]
		gasData.push Math.round(Utils.randomNumber(22000, 35000))
		waterData.push Math.round(Utils.randomNumber(30000, 50000))
		oilData.push Math.round(Utils.randomNumber(65000, 90000))
		
generateRandomKPIs()

#Dynamic highChart drawing
createDataTableHighChart = (defaultFontColor_,tsDivId_) ->
	timeseriesDataChart = Highcharts.chart(tsDivId_,
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'line', marginLeft: 70, marginRight: 110, marginTop: 65, marginBottom: 20, backgroundColor: null}
		title: {text:'PRODUCTION OVER TIME', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '18px', color: defaultFontColor_, fontWeight: 400}, y: 25, x: 15}
		subtitle: {enabled: false}
		xAxis:
			tickColor: null
			type: 'datetime'
			tickInterval: 30 * 24 * 3600 * 1000
			categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			labels:
				enabled: true, style: {color: defaultFontColor_}, format: '{value: %m}'
		yAxis:
			title: null
			crosshair: false
			tickInterval: 30000
			labels: {style: {color: defaultFontColor_}}
			gridLineColor: gray
			lineColor: defaultFontColor_
			lineWidth: 1.5
		series: [{
			type: 'line', name: 'Gas', data: gasData, color: orange
			pointInterval: 3.3 * 24 * 3600 * 1000
			},{
			type: 'line', name: 'Oil', data: oilData, color: green
			pointInterval: 3.3 * 24 * 3600 * 1000
			},{
			type: 'line', name: 'Water', data: waterData, color: blue
			pointInterval: 3.3 * 24 * 3600 * 1000
			}]
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
			headerFormat: '<span class="metric">Production Over Time</span></br>'
			pointFormat: '<span class="row"><span class="alignLeft"><span style="color:{point.color}">\u25CF</span> {series.name} </span><span class="alignRight"><b> {point.y} (cu.ft/d)</b></span></span>'
		plotOptions:
			line: {lineWidth: 1.5}
			boxplot: {groupPadding: 0, pointPadding: 0, fillColor:'rgba(255,255,255,.75)'}
			series:
				marker: {enabled: false, symbol: 'circle'}
				states: {hover: {fillColor: null, lineWidth: 2, lineColor: null}}
				pointStart: Date.UTC(2017, 0, 3)
				pointRange: 30 * 24 * 3600 * 1000
	)

createDonutHighChart = (dcDivId) ->
	donutChart = Highcharts.chart(dcDivId,
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'pie', renderTo: '', marginLeft: 0, marginRight: 20, marginTop: 25, marginBottom: 0, backgroundColor: null}
		title: {text:'GOALS', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '18px', color: defaultFontColor, fontWeight: 400}, y: 25, x: 15}
		subtitle: null
		series: [{
			colorByPoint: true
			innerSize: '75%'
			data: [
				{name: 'Oil', y: Utils.randomChoice([1..100]), color: green}
				{name: 'Gas', y: Utils.randomChoice([1..100]), color: yellow}
				{name: 'Water', y: Utils.randomChoice([1..100]), color: blue}
			]
		}]
		tooltip:
			enabled: true
			backgroundColor: "rgba(255,255,255,1)"
			borderColor: "#FFFFFF"
			borderWidth: 1
			shadow: false
			headerFormat: ""
			useHTML: true
			pointFormat: '<span style="color:{point.color}">\u25CF</span> {point.name} <br/><b>{point.y}</b>'
		plotOptions:
# 				series:
# 					# THIS TURNS OFF THE WEDGE HIGHLIGHT
# 					states:{hover:{enabled: false}}
			pie:
# 					states: {hover: {enabled: false}}
				borderWidth: 0
				point:
					# THIS GETS RID OF THE TOGGLE
					events: 
						legendItemClick: () -> return false
# 							mouseOver:{hover:{enabled: false}}
				dataLabels:
					enabled: false
					distance: -16
					style: {fontFamily: 'GE Inspira Sans', fontWeight: 500, color: defaultFontColor, textOutline: null}
					format: '{y}%'
				allowPointSelect: true
				showInLegend: true
		legend: 
			enabled: false

	)
# TABLE BREADCRUMB
backNavContainer = new Layer
	parent: pages[0]
	width: 500, height: 60
	y: 0
	backgroundColor: null
	visible: false

backArrow = new Layer
	parent: backNavContainer
	width: 12, height: 18, x: 25
	y: Align.center
	image: "images/back-arrow.svg"
	
backBtnTitle = new TextLayer
	parent: backNavContainer
	width: 225, height: 23, x: backArrow.width + 40
	y: Align.center
	text: "DASHBOARD"
	font: "400 18px/1.5 GE Inspira Sans"
	color: blue04
	
backBtnSubtitle = new TextLayer
	parent: backNavContainer
	width: 450, height: 23
	y: Align.center, x: backArrow.width + backBtnTitle.width - 70
	text: "PRODUCTION BY REGION"
	font: "400 18px/1.5 GE Inspira Sans"
	color: defaultFontColor
	
# TABLE HEADER
tableContainer = new Layer
	parent: pages[0]
# 	parent: pages[0].content
	width: dashboardWidth/3 * 1.95, height: tableHeight - 40
# 	width: tableWidth, height: tableFullHeight
	x: 15
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height
# 	y: headerBar.height + backNavContainer.height
	clip: true
	backgroundColor: null
	visible: true
	opacity: 1

tableContainer.states = 
	smallTable:
		height: tableHeight - 40
		width: dashboardWidth/3 * 1.95
		height: tableHeight - 40
		x: 15
		y: headerBar.height + kpisContainer.height + timeseriesContainer.height
		options:
			time: 0.4
			curve: 'ease-in-out'
	bigTable:
		y: headerBar.height
		width: tableWidth
		height: tableFullHeight
		options:
			time: 0.4
			curve: 'ease-in-out'
			
expandTableIcon = new Layer
	parent: pages[0]
# 	parent: pages[0].content
	width: 15, height: 15
	x: tableControl.x + tableControl.width + 14
	y: 390
	backgroundColor: null
	image: "images/expand-icon.svg"
# 	parent: tableContainer
	visible: true
	
tableHeaderContainer = new Layer
	parent: tableContainer
	backgroundColor: null
	width: tableWidth, height: 30
	shadowY : 1
	shadowColor: blue03
	
statusHeader = new Layer
	width: columnWidth/1.4, height: headerHeight, x: 10
	color: defaultFontColor
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Status</div>'
	
wellNameHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth - 10
	color: defaultFontColor
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Well Name</div>'	
	
liftTypeHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 2 + 20
	color: defaultFontColor
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Lift Type</div>'
	
oilHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 3 + 25
	color: defaultFontColor
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Oil</div>'
	
waterHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 4 + 10
	color: defaultFontColor
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Water</div>'
	
gasHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 5
	color: defaultFontColor
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Gas</div>'
	
energyHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 6 - 20
	color: defaultFontColor
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Energy</div>'
	
uptimeHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 7 - 30
	color: defaultFontColor
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">UpTime</div>'
	
gatheringHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 8 - 40
	color: defaultFontColor
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Gathering</div>'
	
changeHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 9 - 40
	color: defaultFontColor
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Change</div>'
	
actionsHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 10 - 40
	color: defaultFontColor
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Actions</div>'
	
# TABLE ROWS
tableScrollContainer = new ScrollComponent
	width: tableWidth, height: tableFullHeight
	y: tableHeaderContainer.height
	parent: tableContainer
	contentInset: top: 0, bottom: 100
tableScrollContainer.scrollHorizontal = false
tableScrollContainer.mouseWheelEnabled = true

rows = []

# TABLE BUILD
for i in [0..rowCount]	
	tableData = new Layer
		width: tableWidth, height: 42, y: 20 + (43 * i)
		backgroundColor: bgColor
		parent: tableScrollContainer.content
		shadowColor: "rgba(250,250,250,0.2)"
		shadowY: 1
		name: "dataRow"
		animationOptions: {curve: 'ease-in-out', time: 0.1}
		clip: true
		opacity: 1
		animationOptions:
			curve: Bezier.easeInOut
			time: 0.15
			
	tableData.expanded = false
	
	tableData.rowSelect = new Layer
		parent: tableData
		width: tableWidth, height: tableData.height
		backgroundColor: null
		visible: true
	
	tableData.chart = new Layer
		parent: tableData
		width: tableWidth, height: 280 + tableData.height
		y: 0
# 		y: tableData.height
		borderColor: highlightColor
		borderWidth: 1
		backgroundColor: null
		visible: false
		
	tableData.statusEntry = new TextLayer
		width: 12, x: 38, y: Align.center
		parent: tableData
		backgroundColor: null
		color: Utils.randomChoice(statusColor)
		text: "●"
		fontSize: 10
		
	tableData.wellNameEntry = new Layer
		width: columnWidth, height: 50, x: wellNameHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		color: defaultFontColor
		html: '<div class="rowEntry">' + wellName[i] + '</div>'
		
	tableData.liftTypeEntry = new Layer
		width: columnWidth, height: 50, x: liftTypeHeader.x + 10, y: Align.center
		parent: tableData
		color: defaultFontColor
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice(liftType) + '</div>'
		
	tableData.oilEntry = new Layer
		width: columnWidth, height: 50, x: oilHeader.x + 10, y: Align.center
		parent: tableData
		color: defaultFontColor
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([100..1000]) + '</div>'
		
	tableData.waterEntry = new Layer
		width: columnWidth, height: 50, x: waterHeader.x + 10, y: Align.center
		parent: tableData
		color: defaultFontColor
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..1000]) + '</div>'
		
	tableData.gasEntry = new Layer
		width: columnWidth, height: 50, x: gasHeader.x + 10, y: Align.center
		parent: tableData
		color: defaultFontColor
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..1000]) + '</div>'
		
	tableData.energyEntry = new Layer
		width: columnWidth, height: 50, x: energyHeader.x + 10, y: Align.center
		parent: tableData
		color: defaultFontColor
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..100]) + '</div>'
		
	tableData.uptimeEntry = new Layer
		width: columnWidth, height: 50, x: uptimeHeader.x + 10, y: Align.center
		parent: tableData
		color: defaultFontColor
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..100]) + '</div>'
	
	tableData.gatheringEntry = new Layer
		width: columnWidth, height: 50, x: gatheringHeader.x + 10, y: Align.center
		parent: tableData
		color: defaultFontColor
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..100]) + '</div>'
		
	tableData.changeEntry = new Layer
		width: columnWidth, height: 50, x: changeHeader.x + 10, y: Align.center
		parent: tableData
		color: defaultFontColor
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..100]) + '%</div>'
		
	tableData.actionEntry = new Layer
		width: columnWidth, height: 50, x: actionsHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		color: blue04
		html: '<div class="rowEntry">Run Analysis</div>'
		
	tableData.overflow_icon = new Layer
		parent: tableData
		width: 4, height: 20, y: Align.center, x: actionsHeader.x + 120
		image: "images/overflow-icon.svg"
	
	tableData.actionsBg = new Layer
		parent: tableData
		width: 155, height: tableData.chart.height
		x: tableData.chart.width - 155, y: tableData.height
		backgroundColor: blue05
		opacity: 0.15	
	tableData.actions = new Layer
		parent: tableData
		width: 155, height: tableData.chart.height
		x: tableData.chart.width - 155, y: tableData.height
		backgroundColor: null
		color: blue04
		html: '<ul>
			<li>Optimize</li>
			<li>Plan</li>
			<li>View Details</li>
			</ul>'
	
	tableData.analysisBtn = new Layer
		parent: tableData
		width: 100, height: 30, x: actionsHeader.x, y: 7
		backgroundColor: null
		
	# DYNAMICALLY GENERATED DIV IDs	FOR CHARTS IN ROWS
	tableData.tsDivId = "tsDivId_" + i
	tableData.dcDivId = "dcDivId_" + i
		
	rows.push(tableData)

			
	#             ROW CLICK ACTIONS                #
	tableData.states =
		selected:
			backgroundColor: blue02
	
	tableData.on Events.MouseOver, (event, layer) ->
		document.body.style.cursor = "pointer"
		this.backgroundColor = highlightColor
		
		if darkMode is false #for light mode only change font color on hover
			for j in [3...this.children.length]
				this.children[j].color = white
				
	tableData.on Events.MouseOut, (event, layer) ->
		document.body.style.cursor = "auto"
		this.backgroundColor = bgColor
		if darkMode is false #for light mode only undo the changes of font color on hover
			for j in [3...this.children.length]
				this.children[j].color = defaultFontColor
			this.actionEntry.color = blue04
			
	tableData.onMouseDown ->
		document.body.style.cursor = "pointer"
		for j in [3...this.children.length]
			this.children[j].color = defaultFontColor
		this.actionEntry.color = blue04
		
	tableData.onMouseUp ->
		document.body.style.cursor = "auto"
		this.backgroundColor = bgColor
		if darkMode is false #for light mode only undo the changes of font color on hover
			for j in [3...this.children.length]
				this.children[j].color = defaultFontColor
			this.actionEntry.color = blue04
			
	tableData.on Events.Click, (event, layer) ->
		#Generating Charts dynamically onClick()
		tsContainer = new Layer
			width: dashboardWidth/3 * 1.7, height: 260
			y: Align.center, x: 10
			backgroundColor: null
			parent: this.chart
		tsContainer.html = '<div id="' + this.tsDivId + '" style="height:240px;"></div>'
		
		dcContainer = new Layer
			width: dashboardWidth/3 * 1, height: 260
			y: Align.center, x: tsContainer.width
			backgroundColor: null
			parent: this.chart
		dcContainer.html = '<div id="' + this.dcDivId + '" style="height:240px;"></div>'
		
		# TIMESERIES CHART
		createDataTableHighChart(defaultFontColor,this.tsDivId)
		
		# DONUT CHART
		
		donutTotal = new TextLayer
			parent: dcContainer
			backgroundColor: 'transparent'
			width: 90, height: 90
			y: 110, x: 175
# 			text: 200 + 'k'
			color: defaultFontColor
			fontSize: 36
			fontWeight: 400
			
		donutTotalNum = Utils.randomChoice([1..150])	
		# shift the total number based on a 1 or 2 or 3 digit
		if donutTotalNum < 10
			donutTotal.x = 180
		else if donutTotalNum > 10 and donutTotalNum < 99
			donutTotal.x = 172
		else
			donutTotal.x = 162
		
		donutTotal.text = donutTotalNum
		
		createDonutHighChart(this.dcDivId)			
		dcContainer.onMouseOver ->
		dcContainer.onMouseOut ->
			
		dropDown = new TextLayer
			parent: tsContainer
			width: 120, height: 30, x: 230, y: 13
			backgroundColor: blue04
			text: "Year"
			font: "400 15px/1 -apple-system, GE Isnpira Sans"
			color: "white"
			padding: 8
			
		dropArrow = new Layer
			parent: dropDown
			width: 12, height: 8, x: 95, y: Align.center
			backgroundColor: null
			image: "images/down-arrow.svg"
			
		dropDown.onMouseOver () ->
			document.body.style.cursor = "pointer"
			this.backgroundColor = "#065769"
			
		dropDown.onMouseOut () ->
			document.body.style.cursor = "auto"
			this.backgroundColor = blue03
		
		widgetControls = new Layer
			parent: tsContainer
			width: 69, height: 19, x: tsContainer.width - 90, y: 20
			image: "images/widget-controls.svg"
		
		oilLegend = new Layer
			parent: tsContainer
			backgroundColor: null
			x: tsContainer.width - 90, y: 65
			width: 70, height: 25
			html: '<div class="greenLegend">Oil</div>'
			
		waterLegend = new Layer
			parent: tsContainer
			backgroundColor: null
			x: tsContainer.width - 90, y: oilLegend.y + oilLegend.height + 5
			width: 70, height: 25
			html: '<div class="waterLegend">Water</div>'
			
		gasLegend = new Layer
			parent: tsContainer
			backgroundColor: null
			x: tsContainer.width - 90, y: waterLegend.y + waterLegend.height + 5
			width: 70, height: 25
			html: '<div class="gasLegend">Gas</div>'
	
		tsContainer.onMouseOver ->
		tsContainer.onMouseOut ->
		
		
		toggleExpand(@, 280)
		
		if darkMode
			this.backgroundColor = blue02
			this.chart.backgroundColor = blue02
		if !darkMode
			this.chart.backgroundColor = white
		# this adds or removes a class in order to toggle a background color
		if @.classList.contains("clicked")
			this.chart.visible = false
			this.actionsBg.y = this.height
			_.invoke(tableData.tableHeaderContainer, "destroy")
# 			tableHeaderContainer.backgroundColor = null
# 			for i in tableHeaderContainer.children.length
# 				tableHeaderContainer.children[i].color = defaultFontColor
				
			layer.classList.remove("clicked")
			layer.rowSelect.visible = false
		else
			this.chart.visible = true
			this.actionsBg.y = 0
# 			tableHeaderContainer.backgroundColor = blue03
# 			for i in tableHeaderContainer.children.length
# 				tableHeaderContainer.children[i].color = white
			layer.classList.add("clicked")
			layer.rowSelect.visible = true
	
# 	# from table view to analysis screen		
# 	tableData.analysisBtn.on Events.Click, (event, layer) ->
# 		backBtnTitle.text = Utils.randomChoice(wellName).toUpperCase()
# 		backBtnSubtitle.text = "OPTIMIZATION"
# 		clearTable()
# 		buildAnalysis()
				
# ROW TOGGLE
toggleExpand = (tableData, distance) ->
	distance = if tableData.expanded is false then distance else - distance
	tableData.animate
		height: tableData.height + distance

# this is for siblings to collapse on their own		
# 	delay = 0
# 	
# 	for sib in tableData.siblings
# 		if sib.expanded is true
# 			delay = .25
# 			toggleExpand(sib, sib.height)
# 	
	for sib in tableData.siblings
		if sib.y > tableData.y
			sib.animate
				y: sib.y + distance
# 				opacity: 0.5
				
	tableData.expanded = !tableData.expanded

# Methods
tableBuild = () ->
	Utils.delay 0.05, ->
		for j in [0..3]
			rows[j].animate
				opacity: 1
				y: 0 + (43 * j)
				options:
					delay: 0.02 * j
				animationOptions:
					curve: Bezier(0.3, 0, 0.3, 1)
					time: 0.02
			
	Utils.delay 0.1, ->
		for k in [4..17]
			rows[k].animate
				opacity: 1
				y: 0 + (43 * k)
				options:
					delay: 0.05
				animationOptions:
					curve: Bezier(0.3, 0, 0.3, 1)
					time: 0.02
					
smallTable = () ->
	expandTableIcon.visible = true
# 	tableContainer.visible = true

	tableContainer.animate("smallTable")
	
	tableContainer.width = dashboardWidth/3 * 1.95
	tableContainer.height = tableHeight - 40
	tableContainer.y = headerBar.height + kpisContainer.height + timeseriesContainer.height + 60
	tableContainer.animate
		opacity: 1
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.05
	productionHeader.visible = true
	regionHeader.visible = true
	mapControls.visible = true
	mapIcon.visible = true
	tableIcon.visible = true
			
expandTable = ->
	pages[0].children[0].animate
		opacity: 0
		options:
			time: 0.2
			curve: 'ease-in-out'
	expandTableIcon.visible = false
	backNavContainer.visible = true
	expandTableIcon.x = tableWidth - 20
	
	tableContainer.animate("bigTable")
	
# 	tableContainer.visible = true
# 	tableContainer.y = headerBar.height + backNavContainer.height - 5
# 	tableContainer.width = tableWidth
# 	tableContainer.height = tableFullHeight
	tableContainer.animate
		opacity: 1
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.05
	
clearTable = ->
	expandTableIcon.visible = false
	expandTableIcon.x = 815
	tableContainer.animate
		opacity: 0
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	tableContainer.visible = false
	_.invoke(tableContainer.subLayers, "destroy")

expandTableIcon.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
expandTableIcon.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
expandTableIcon.on Events.TouchEnd, ->
	Utils.delay 0.35, ->
		expandTable()


backNavContainer.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
backNavContainer.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
		
backNavContainer.on Events.TouchEnd, ->
	pages[0].children[0].animate
		opacity: 1
		options:
			time: 0.2
			curve: 'ease-in-out'
	expandTableIcon.visible = true
	backNavContainer.visible = false
	expandTableIcon.x = tableControl.x + tableControl.width + 14
	
	tableContainer.animate("smallTable")
#NOTIFICATIONS 
## Pages[2]
#Search
## Pages[3]

contentFrame.parent = pages[3].content
subHeader.parent = pages[3].content

#FACET
facets = new Layer
	parent: pages[3].content
	x: 0
	y: 0
	opacity: 0
	scale: 0.95
	width: facetFrame.width
	height: facetFrame.height
	image: "images/component_placeholders/facets.png"
	
#------------------------------#
#      LIST VIEW         	   #
#------------------------------#
searchResultsScroll = new ScrollComponent
	parent: contentFrame
	scale: 0.95
	width: contentFrame.width 
	height: Screen.height
	opacity: 0
	
searchResultsScroll.scrollHorizontal = false
searchResultsScroll.contentInset = bottom: 100
searchResultsScroll.mouseWheelEnabled = true

#------------------------------#	
#          SCROLL BAR          #
#------------------------------#
scrollBar = new SliderComponent 
	parent: searchResultsScroll.content
	width: 10, height: searchResultsScroll.height - 10
	x: searchResultsScroll.width - 10
	min: 0, max: 100, value: 0
	backgroundColor: null
	clip: true
	visible: false
scrollBar.centerY()
scrollBar.fill.backgroundColor = null

# Style the knob of the slider
scrollBar.knob.props = 
	width: 10, height: 80, y: 10
	backgroundColor: "rgba(255,255,255,0.5)"
	borderRadius: 50
	clip: false
	
# Connect the slider to the scroll event
searchResultsScroll.on Events.Move, ->	
	scrollBar.value = Utils.modulate(searchResultsScroll.scrollY, [0, searchResultsScroll.content.height - searchResultsScroll.height], [0, 100], true)
	
updatePosition = -> 	
	scrollValue = Utils.modulate(scrollBar.value, [0, 100], [0, searchResultsScroll.content.height - searchResultsScroll.height], true)
	searchResultsScroll.scrollY = scrollValue

scrollBar.onMouseDown ->
	@on "change:value", updatePosition
			
scrollBar.onMouseUp -> 
	@off "change:value", updatePosition
	
#------------------------------#	
#          DATA TABLE          #
#------------------------------#
resultsLabel = new TextLayer
	parent: searchResultsScroll.content
	x: 20
	text: "ALL RESULTS"
	fontSize: 12
	fontFamily: "GE Inspira Sans"
	color: defaultFontColor
	opacity: 0
	
resultsTableContainer = new Layer
	parent: searchResultsScroll.content
	color: defaultFontColor
	width: contentFrame.width, height: contentFrame.height
	x: 20
	backgroundColor: white
	
searchRows = []
			
drawSearchTableBuild = ->
	for row, i in notificationsData
		tableData[i] = new Layer
			width: contentFrame.width, height: 60
			y: 20 + (62 * i + 1)
			backgroundColor: null #"transparent" #blue02
			parent: resultsTableContainer
			shadowColor: blue04 #?
			shadowY: 1
			opacity: 0
# 			animationOptions:
# 				curve: Bezier(0.3, 0, 0.3, 1)
# 				time: 0.1
		
		tableData[i].assetName = row.notificationName
		tableData[i].tags = row.notificationContent
		
		searchRows.push(tableData[i])
	# 	print searchRows.length
	
		tableData.assetNameEntry = new TextLayer
			parent: tableData[i]
			x: 15, y: 10
			text: row.notificationName
			fontSize: 18
			fontFamily: "GE Inspira Sans"
			color: defaultFontColor
		
		tableData.assetTags = new Layer
			parent: tableData[i]
			width: 400
			x: 15, y: 35
			backgroundColor: null
			color: black
			html: '<div style="font-size:12px; font-family:GE Inspira Sans; padding: 0 0; line-height: 1.3;"><span>' + row.notificationContent + '</span></div>'
			
		tableData.overflowIcon = new Layer
			parent: tableData[i]
			width: 14, height: 13
			x: resultsTableContainer.width - 35, y: 18
			backgroundColor: null
		tableData.overflowIcon.html = """
		<svg width="4px" height="20px" viewBox="0 0 4 20">
		    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
		        <g id="search-results-dark" transform="translate(-725.000000, -480.000000)" fill="#09819C">
		            <g id="search-results" transform="translate(255.000000, 100.000000)">
		                <g id="featured-results" transform="translate(5.000000, 88.000000)">
		                    <g id="featured" transform="translate(0.000000, 32.000000)">
		                        <g id="esp" transform="translate(15.000000, 25.000000)">
		                            <g id="overflow-copy-2" transform="translate(450.000000, 235.000000)">
		                                <path d="M2,12 C3.1045695,12 4,11.1045695 4,10 C4,8.8954305 3.1045695,8 2,8 C0.8954305,8 0,8.8954305 0,10 C0,11.1045695 0.8954305,12 2,12 Z M2,4 C3.1045695,4 4,3.1045695 4,2 C4,0.8954305 3.1045695,0 2,0 C0.8954305,0 0,0.8954305 0,2 C0,3.1045695 0.8954305,4 2,4 Z M2,20 C3.1045695,20 4,19.1045695 4,18 C4,16.8954305 3.1045695,16 2,16 C0.8954305,16 0,16.8954305 0,18 C0,19.1045695 0.8954305,20 2,20 Z" id="overflow-icon"></path>
		                            </g>
		                        </g>
		                    </g>
		                </g>
		            </g>
		        </g>
		    </g>
		</svg>
		"""
		# RUN ANALYSIS BTN
		tableData.runAnalysisBtn = new Layer
			parent: tableData[i]
			width: 100, height: 35
			x: resultsTableContainer.width - 170, y: 14
			backgroundColor: blue04
			html: "Run Analysis"
			borderColor: blue01 #?
			borderWidth: 1
			color: white
		tableData.runAnalysisBtn.style =
			fontSize: "14px"
			fontFamily: "GE Inspira Sans"
			padding: "3px 0 0 12px"
# 			color: "white"
		
		tableData.runAnalysisBtn.on Events.MouseOver, (event, layer) ->
			document.body.style.cursor = "pointer"
			this.backgroundColor = blue03
			
		tableData.runAnalysisBtn.on Events.MouseOut, (event, layer) ->
			document.body.style.cursor = "auto"
			this.backgroundColor = blue04
		
		#-------------------------------------#	
		#          ROW HOVER ACTIONS          #
		#-------------------------------------#
		tableData[i].on Events.MouseOver, (event, layer) ->
			document.body.style.cursor = "pointer"
			this.backgroundColor = "#F3FAFF"
			
		tableData[i].on Events.MouseOut, (event, layer) ->
			document.body.style.cursor = "auto"
			this.backgroundColor = bgColor
		
#Animation
animateSearchComponents = (display) ->
	if display
		facets.animate
			scale: 1
			opacity: 1
			options: 
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.5
		subHeader.animate
			scale: 1
			opacity: 1
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.5
		# Utils.delay 0.1, ->
# 		searchResultsScroll.visible = true
		searchResultsScroll.animate
			scale: 1
			opacity: 1
			options: 
				curve: Bezier.easeInOut
				time: 0.5
								
# 		Utils.delay 0.1, ->
		# TABLE STACKING
		for j in [0...searchRows.length]
			searchRows[j].animate
				opacity: 1
				y: 0 + (62 * j + 1)
				options:
					delay: 0.05 * j
					curve: Bezier.easeIn
					time: 0.2
						 				
		# 	Utils.delay 0.1, ->
		# 	for k in [5..15]
		# 		searchRows[k].animate
		# 			opacity: 1
		# 			y: 0 + (62 * k + 1)
		# 	# 				options:
		# 	# 					delay: 0.02 * k
		# 			animationOptions:
		# 				curve: Bezier(0.3, 0, 0.3, 1)
		# 				time: 0.1		
	else
		facets.animate
			opacity: 0
			scale: 0.95
			options: 
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.2	
		subHeader.animate
			scale: 0.95
			opacity: 0
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.2
# 		searchResultsScroll.visible = false
		searchResultsScroll.animate
			scale: 0.95
			opacity: 0
			options: 
				curve: Bezier.easeInOut
				time: 0.2
								
		Utils.delay 0.1, ->
			# TABLE STACKING
			for j in [0...searchRows.length]
				searchRows[j].animate
					opacity: 0
					y: 0 + (62 * j + 1)
					options:
						delay: 0.02 * j
						curve: Bezier.easeIn
						time: 0.2

#Main
drawSearchTableBuild()



