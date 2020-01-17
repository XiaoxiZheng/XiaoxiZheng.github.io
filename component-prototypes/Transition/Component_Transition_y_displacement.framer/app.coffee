# SETTINGS
{Highcharts} = require "npm"
FontAwesome = require 'FontAwesome'

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

#Predix Color
grey01 ="#EBEFF2"
grey02 = "#889AA5"#boderColor
grey03 = "#677E8C" #fontColor 
blueGrey = "#E2E8ED"
highlightColor = blue04 

crumbDefault = "#E2E8ED"
crumbHovered = "#C5D1D8"
crumbPressed = "#B6C3CC"
crumbSelected = "white"

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
	'D_Dashboard',
	'Notifications',
	'Search',
	'Analysis',
	'MWEO',
]

#Header
logo.onClick ->
	pageIndex = findPageIndex("D_Dashboard")
	setPageToActive(pageIndex)
	
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
	setPageToActive(pageIndex)


#Helper Functions
setPageToActive = (pageIndex) ->
	pages[pageIndex].animate("active")
	pages[pageIndex].bringToFront()
	appDrawerContainer.bringToFront()
	
	Utils.delay 1, ->
		scaleDown(pageIndex)
			
	animateAllPagesToDefault()
	
	appDrawerContainer.animate("stateB")
	animateSearchComponents(false)
	AnalysisAnimation(false)
	
scaleDown = (exceptionIndex) ->
	for i in [0...pages.length]
		if i != exceptionIndex
			pages[i].animate
				scale: 1

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
	pageIndex = findPageIndex("D_Dashboard")
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
# 			scale: 0.95
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
# 				scale: 1
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
dashboardPage = findPageIndex("D_Dashboard")

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
	parent: pages[dashboardPage]
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
	parent: pages[dashboardPage]
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
	parent: pages[dashboardPage]
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

	tableData.clicked = false
			
	#             ROW CLICK ACTIONS                #
	tableData.states =
		selected:
			backgroundColor: blue02
	
	tableData.on Events.MouseOver, (event, layer) ->
		document.body.style.cursor = "pointer"
		this.backgroundColor = highlightColor
		
		if darkMode is false && !this.clicked #for light mode only change font color on hover
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
		this.clicked = true 
		
		this.actions.onClick ->
			findPageIndex("Analysis")
			pageIndex = findPageIndex("Analysis")
			setPageToActive(pageIndex)
			AnalysisAnimation(true)
		
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
	pages[dashboardPage].children[0].animate
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
	pages[dashboardPage].children[0].animate
		opacity: 1
		options:
			time: 0.2
			curve: 'ease-in-out'
	expandTableIcon.visible = true
	backNavContainer.visible = false
	expandTableIcon.x = tableControl.x + tableControl.width + 14
	
	tableContainer.animate("smallTable")
#NOTIFICATIONS 
notificationPage = findPageIndex("Notifications")
#Search
## Pages[3]
searchPage = findPageIndex("Search")

contentFrame.parent = pages[searchPage].content
subHeader.parent = pages[searchPage].content

#FACET
facets = new Layer
	parent: pages[searchPage].content
	x: 0
	y: 0
	opacity: 0
# 	scale: 0.95
	width: facetFrame.width
	height: facetFrame.height
	image: "images/component_placeholders/facets.png"
	
#------------------------------#
#      LIST VIEW         	   #
#------------------------------#
searchResultsScroll = new ScrollComponent
	parent: contentFrame
# 	scale: 0.95
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
	y: 60
	backgroundColor: white
	
searchRows = []
			
drawSearchTableBuild = ->
	for row, i in notificationsData
		tableData[i] = new Layer
			width: contentFrame.width, height: 60
			y: 10 + (82 * i + 1)
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
			
		tableData.runAnalysisBtn.on Events.Click, (event, layer) ->
			pageIndex = findPageIndex("Analysis")
			setPageToActive(pageIndex)
			AnalysisAnimation(true)
		
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
			opacity: 1
			y: 0
			options: 
				curve: Bezier.easeIn
				time: 0.8
		subHeader.animate
			opacity: 1
			options:
				curve: Bezier.easeIn
				time: 0.5
		# Utils.delay 0.1, ->
# 		searchResultsScroll.visible = true
		resultsTableContainer.animate
			y: 0
			options: 
				curve: Bezier.easeIn
				time: 0.5
		searchResultsScroll.animate
			opacity: 1
			options: 
				curve: Bezier.easeIn
				time: 0.5
								
# 		Utils.delay 0.1, ->
		# TABLE STACKING
		searchRows[0].animate
			opacity: 1
			y: 10 + (62 * 0 + 1)
			options:
				curve: Bezier.easeInOut
				time: 0.5
		Utils.delay 0.2, -> 
			searchRows[1].animate
				opacity: 1
				y: 10 + (62 * 1 + 1)
				options:
	# 				delay: 0.3
					time: 0.5
					curve: Bezier.easeInOut
		Utils.delay 0.4, ->
			for j in [2...searchRows.length]
				searchRows[j].animate
					opacity: 1
					y: 10 + (62 * j + 1)
					options:
	# 					delay: 0.2
						curve: Bezier.easeInOut
						time: 0.5
	else
		facets.animate
			opacity: 0
			y: 0
			options: 
				curve: Bezier.easeInOut
				time: 0.1	
		subHeader.animate
			opacity: 0
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
		resultsTableContainer.animate
			y: 60
			options:
				curve: Bezier.easeInOut
				time: 0.1
		searchResultsScroll.animate
			opacity: 0
			options: 
				curve: Bezier.easeInOut
				time: 0.1
								
		Utils.delay 0.1, ->
			# TABLE STACKING
			for j in [0...searchRows.length]
				searchRows[j].animate
					opacity: 0
					y: 10 + (82 * j + 1)
					options:
						delay: 0.1 * j
						curve: Bezier.easeInOut
						time: 0.1
#Analysis Detail View
analysisPage = findPageIndex("Analysis")

analysisHeader.parent = pages[analysisPage].content
slider_bg.parent = pages[analysisPage].content
#              ANALYSIS             #
analysisContainer = new Layer
	parent: pages[analysisPage].content
	width: 1250, height: 850
	x: 15, y: headerBar.height + 60
	clip: true
	opacity: 0
	backgroundColor: null

#              A / B Counters             #
aFrequency = new Layer
	parent: analysisContainer
	width: 375, height: 30, x: 50, y: 0
	borderColor: blue05
	borderWidth: 1
	backgroundColor: null
	opacity: 0
	color: highlightColor
	html: '<div class="analysisLabel">Increase Frequency: 56.7Hz to 145 stb/d </div>'
	
bFrequency = new Layer
	parent: analysisContainer
	width: 375, height: 30, x: aFrequency.width + 80
	borderColor: blue05
	borderWidth: 1
	backgroundColor: null
	opacity: 0
	color: highlightColor
	html: '<div class="analysisLabel">Decrease WHP: 327 psig to 83 stb/d </div>'
	
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
	width: 375, height: 240, y: aFrequency.height + 80, x: 50
	backgroundColor: white
	opacity: 0
vspCurveContainer.html = '<div id="vspCurveContainer" style="height:240px;"></div>'

gradientCurveContainer = new Layer
	parent: analysisContainer
	width: 375, height: 240, y: aFrequency.height + 80, x: vspCurveContainer.width + 80
	backgroundColor: white
	opacity: 0
gradientCurveContainer.html = '<div id="gradientCurveContainer" style="height:240px;"></div>'

iprCurveContainer = new Layer
	parent: analysisContainer
	width: 375, height: 240, y: aFrequency.height + 80, x: vspCurveContainer.width + gradientCurveContainer.width + 110
	backgroundColor: white
	opacity: 0
iprCurveContainer.html = '<div id="iprCurveContainer" style="height:240px;"></div>'

#              SPLINE CHARTS             #
# DynamicLoader.series(highCharts).then(->
drawSplineCurves = () ->
	vspCurveChart = Highcharts.chart('vspCurveContainer',
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'spline', renderTo: '', marginLeft: 20, marginRight: 20, marginTop: 35, marginBottom: 20, backgroundColor: null}
		title: {text:'VARIABLE SPEED PERFORMANCE CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', color: defaultFontColor, fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: true, text: 'FLOW RATE (rb/d)', style: {color: defaultFontColor}}
		yAxis:
			title: {text: 'HEAD (ft)', style: {color: defaultFontColor}}
			labels: {enabled: false}
			gridLineColor: gray
			tickInterval: 10
			lineColor: defaultFontColor
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
		title: {text:'GRADIENT CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', defaultFontColor, fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: true, text: 'PRESSURE (psig)', style: {color: defaultFontColor}}
		yAxis:
			title: {text: 'TRUE VERTICAL DEPTH (ft)', style: {color: defaultFontColor}}
			labels: {enabled: false}
			tickInterval: 10
			gridLineColor: gray
			lineColor: defaultFontColor
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
		title: {text:'IPR CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', color: defaultFontColor, fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: true, text: 'FLOW RATE (stb/d)', style: {color: defaultFontColor}}
		yAxis:
			title: {text: 'FLOW PRESSURE (psia)', style: {color: defaultFontColor}}
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
	x: 110, y: aFrequency.height + vspCurveContainer.height + 210, width: 210, height: 5
	min: 0, max: 2000
# 	value: 1500
	knobSize: 20
	opacity: 0
surfaceFlowrateSlider.fill.backgroundColor = highlightColor
surfaceFlowrateSlider.backgroundColor = "#B6C3CC"
surfaceFlowrateSlider.borderRadius = 0
surfaceFlowrateSlider.animateToValue(1500, {curve: Bezier.easeInOut, time: 0.5})

surfaceFlowrateLabel = new TextLayer
	parent: surfaceFlowrateSlider
	x: -60, y: -40, width: 200, height: 30
	text: "SURFACE FLOWRATE"
	color: defaultFontColor
	fontSize: 12
	fontFamily: "GE Inspira Sans"

surfaceFlowrateValue1 = new TextLayer
	parent: surfaceFlowrateSlider
	x: surfaceFlowrateSlider.width + 15, y: -5, width: 100
	text: 1800
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	
surfaceFlowrateValue2 = new TextLayer
	parent: surfaceFlowrateSlider
	x: -60, y: -12, width: 50
	borderColor: highlightColor
	borderWidth: 1
	padding: 8
	text: 1653
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
surfaceFlowrateUnit = new TextLayer
	parent: surfaceFlowrateSlider
	x: surfaceFlowrateSlider.width + 45, y: -5, width: 100
	text: "stb/d"
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	
#              BOTTOMHOLE PRESSURE SLIDER             #
bottomholePressureSlider = new SliderComponent
	parent: analysisContainer
	x: 110, y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 300
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 800
	knobSize: 20
	opacity: 0
bottomholePressureSlider.fill.backgroundColor = highlightColor
bottomholePressureSlider.backgroundColor = "#B6C3CC"
bottomholePressureSlider.borderRadius = 0
bottomholePressureSlider.animateToValue(800, {curve: Bezier.easeInOut, time: 0.5})

bottomholePressureLabel = new TextLayer
	parent: bottomholePressureSlider
	x: -60, y: -40, width: 200, height: 30
	text: "BOTTOMHOLE PRESSURE"
	color: defaultFontColor
	fontSize: 12
	fontFamily: "GE Inspira Sans"

bottomholePressureValue1 = new TextLayer
	parent: bottomholePressureSlider
	x: surfaceFlowrateSlider.width + 15, y: -5, width: 100
	text: 2000
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	
bottomholePressureValue2 = new TextLayer
	parent: bottomholePressureSlider
	x: -60, y: -12, width: 50
	borderColor: highlightColor
	borderWidth: 1
	padding: 8
	text: 1260
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
bottomholePressureUnit = new TextLayer
	parent: bottomholePressureSlider
	x: surfaceFlowrateSlider.width + 45, y: -5, width: 100
	text: "psig"
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"

#             MOTOR TEMPERATURE SLIDER             #	
motorTempSlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + 310, y: aFrequency.height + vspCurveContainer.height + 210
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 1800
	knobSize: 20
	opacity: 0
motorTempSlider.fill.backgroundColor = red
motorTempSlider.backgroundColor = "#B6C3CC"
motorTempSlider.knob.color = defaultFontColor
motorTempSlider.knob.width = 2
motorTempSlider.knob.height = 20
motorTempSlider.animateToValue(1800, {curve: Bezier.easeInOut, time: 0.5})

motorTempLabel = new TextLayer
	parent: motorTempSlider
	x: -60, y: -40, width: 200, height: 30
	text: "MOTOR TEMPERATURE"
	color: defaultFontColor
	fontSize: 12
	fontFamily: "GE Inspira Sans"

motorTempValue1 = new TextLayer
	parent: motorTempSlider
	x: motorTempSlider.width + 15, y: -5, width: 100
	text: 260
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	
motorTempValue2 = new TextLayer
	parent: motorTempSlider
	x: -60, y: -12, width: 50
	padding: 8
	text: 220
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
motorTempUnit = new TextLayer
	parent: motorTempSlider
	x: motorTempSlider.width + 45, y: -5, width: 100
	text: "F"
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	
#             FREQUENCY SLIDER             #	
frequencySlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + 310
	y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 300
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 500
	knobSize: 20
	opacity: 0
frequencySlider.fill.backgroundColor = lemon
frequencySlider.backgroundColor = "#B6C3CC"
frequencySlider.knob.color = "white"
frequencySlider.knob.width = 2
frequencySlider.knob.height = 20
frequencySlider.animateToValue(500, {curve: Bezier.easeInOut, time: 0.5})

frequencyLabel = new TextLayer
	parent: frequencySlider
	x: -60, y: -40, width: 200, height: 30
	text: "FREQUENCY"
	color: defaultFontColor
	fontSize: 12
	fontFamily: "GE Inspira Sans"

frequencyValue1 = new TextLayer
	parent: frequencySlider
	x: motorTempSlider.width + 15, y: -5, width: 100
	text: 100
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	
frequencyValue2 = new TextLayer
	parent: frequencySlider
	x: -60, y: -12, width: 50
	padding: 8
	text: 50
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
frequencyUnit = new TextLayer
	parent: frequencySlider
	x: motorTempSlider.width + 45, y: -5, width: 100
	text: "Hz"
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"

#              WELLHEAD PRESSURE SLIDER             #
wellheadPressureSlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + bottomholePressureSlider.width + 510
	y: aFrequency.height + vspCurveContainer.height + 210
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 1400
	knobSize: 20
	opacity: 0
wellheadPressureSlider.fill.backgroundColor = orange
wellheadPressureSlider.backgroundColor = "#B6C3CC"
wellheadPressureSlider.borderRadius = 0
wellheadPressureSlider.knob.color = "white"
wellheadPressureSlider.knob.width = 2
wellheadPressureSlider.knob.height = 20
wellheadPressureSlider.animateToValue(1400, {curve: Bezier.easeInOut, time: 0.5})

wellheadPressureLabel = new TextLayer
	parent: wellheadPressureSlider
	x: -60, y: -40, width: 200, height: 30
	text: "WELLHEAD PRESSURE"
	color: defaultFontColor
	fontSize: 12
	fontFamily: "GE Inspira Sans"

wellheadPressureValue1 = new TextLayer
	parent: wellheadPressureSlider
	x: wellheadPressureSlider.width + 15, y: -5, width: 100
	text: 425
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	
wellheadPressureValue2 = new TextLayer
	parent: wellheadPressureSlider
	x: -60, y: -12, width: 50
	padding: 8
	text: 327
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
wellheadPressureUnit = new TextLayer
	parent: wellheadPressureSlider
	x: wellheadPressureSlider.width + 45, y: -5, width: 100
	text: "psig"
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	
#              INTAKE PRESSURE SLIDER             #
intakePressureSlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + bottomholePressureSlider.width + 510
	y: aFrequency.height + vspCurveContainer.height + 300
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 500
	knobSize: 20
	opacity: 0
intakePressureSlider.fill.backgroundColor = green
intakePressureSlider.backgroundColor = "#B6C3CC"
intakePressureSlider.borderRadius = 0
intakePressureSlider.knob.color = "white"
intakePressureSlider.knob.width = 2
intakePressureSlider.knob.height = 20
intakePressureSlider.animateToValue(500, {curve: Bezier.easeInOut, time: 0.5})

intakePressureLabel = new TextLayer
	parent: intakePressureSlider
	x: -60, y: -40, width: 200, height: 30
	text: "INTAKE PRESSURE"
	color: defaultFontColor
	fontSize: 12
	fontFamily: "GE Inspira Sans"

intakePressureValue1 = new TextLayer
	parent: intakePressureSlider
	x: wellheadPressureSlider.width + 15, y: -5, width: 100
	text: 6000
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	
intakePressureValue2 = new TextLayer
	parent: intakePressureSlider
	x: -60, y: -12, width: 50
	text: 1032
	fontSize: 12
	color: defaultFontColor
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
intakePressureUnit = new TextLayer
	parent: intakePressureSlider
	x: wellheadPressureSlider.width + 45, y: -5, width: 100
	text: "psig"
	fontSize: 12
	color: defaultFontColor
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

## Analysis Animation
AnalysisAnimation = (display) ->
	if display
		##analysisHeader & slider_bg is manually drawn in design mode
		analysisHeader.animate
			opacity: 1
			options:
				curve: Bezier.easeInOut
				time: 1
		#####		
		analysisContainer.animate
			opacity: 1
# 			y: headerBar.height + 60
			options:
				curve: Bezier.easeInOut
				time: 1
				
		aFrequency.animate
			opacity: 1
			options:
				delay: 0.3
				curve: Bezier.easeInOut
				time: 0.5
		bFrequency.animate
			opacity: 1
			options:
				delay: 0.3
				curve: Bezier.easeInOut
				time: 0.5
				 				
		vspCurveContainer.animate
			opacity: 1
			y: aFrequency.height + 50
			options:
				delay: 0.5
				curve: Bezier.easeInOut
				time: 0.5
			
		gradientCurveContainer.animate
			opacity: 1
			y: aFrequency.height + 50
			options:
				delay: 0.5
				curve: Bezier.easeInOut
				time: 0.5
				
		iprCurveContainer.animate
			opacity: 1
			y: aFrequency.height + 50
			options:
				delay: 0.5
				curve: Bezier.easeInOut
				time: 0.5
				
		Utils.delay 0.5, ->		
			drawSplineCurves()
		
		slider_bg.animate
			opacity: 1
			options:
# 				delay: 0.5
				curve: Bezier.easeIn
				time: 1
					
		surfaceFlowrateSlider.animate
			opacity: 1
			y: aFrequency.height + vspCurveContainer.height + 180
			options:
# 				delay: 0.5
				curve: Bezier.easeInOut
				time: 1
		motorTempSlider.animate
			opacity: 1
			y: aFrequency.height + vspCurveContainer.height + 180
			options:
# 				delay: 0.5
				curve: Bezier.easeInOut
				time: 1
				
		wellheadPressureSlider.animate
			opacity: 1
			y: aFrequency.height + vspCurveContainer.height + 180
			options:
# 				delay: 0.5
				curve: Bezier.easeInOut
				time: 1
		bottomholePressureSlider.animate
			opacity: 1
			y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 270
			options:
# 				delay: 0.5
				curve: Bezier.easeInOut
				time: 1
						
		frequencySlider.animate
			opacity: 1
			y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 270
			options:
# 				delay: 0.5
				curve: Bezier.easeInOut
				time: 1

		intakePressureSlider.animate
			opacity: 1
			y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 270
			options:
# 				delay: 0.5
				curve: Bezier.easeInOut
				time: 1
				
		analysisSave.animate
			opacity: 1
			options:
# 				delay: 0.5
				curve: Bezier.easeInOut
				time: 1
	else
		##analysisHeader & slider_bg is manually drawn in design mode
		analysisHeader.animate
			opacity: 0
			options:
				curve: Bezier.easeInOut
				time: 0.2
		slider_bg.animate
			opacity: 0
			options:
				curve: Bezier.easeIn
				time: 0.2
		#####		
		analysisContainer.animate
			opacity: 0
			options:
				curve: Bezier.easeInOut
				time: 0.2
				
		aFrequency.animate
			opacity: 0
			options:
				delay: 0.1
				curve: Bezier.easeInOut
				time: 0.1
		bFrequency.animate
			opacity: 0
			options:
				delay: 0.1
				curve: Bezier.easeInOut
				time: 0.1
				 				
		vspCurveContainer.animate
			opacity: 0
			y: aFrequency.height + 80
			options:
				delay: 0.1
				curve: Bezier.easeInOut
				time: 0.1
			
		gradientCurveContainer.animate
			opacity: 0
			y: aFrequency.height + 80
			options:
				delay: 0.1
				curve: Bezier.easeInOut
				time: 0.1
				
		iprCurveContainer.animate
			opacity: 0
			y: aFrequency.height + 80
			options:
				delay: 0.1
				curve: Bezier.easeInOut
				time: 0.1
			
		surfaceFlowrateSlider.animate
			opacity: 0
			y: aFrequency.height + vspCurveContainer.height + 210
			options:
# 				delay: 0.2
				curve: Bezier.easeInOut
				time: 0.2
		motorTempSlider.animate
			opacity: 0
			y: aFrequency.height + vspCurveContainer.height + 210
			options:
# 				delay: 0.2
				curve: Bezier.easeInOut
				time: 0.2
				
		wellheadPressureSlider.animate
			opacity: 0
			y: aFrequency.height + vspCurveContainer.height + 210
			options:
# 				delay: 0.2
				curve: Bezier.easeInOut
				time: 0.2
		bottomholePressureSlider.animate
			opacity: 0
			y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 300
			options:
# 				delay: 0.2
				curve: Bezier.easeInOut
				time: 0.2
						
		frequencySlider.animate
			opacity: 0
			y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 300
			options:
# 				delay: 0.2
				curve: Bezier.easeInOut
				time: 0.2

		intakePressureSlider.animate
			opacity: 0
			y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 300
			options:
# 				delay: 0.2
				curve: Bezier.easeInOut
				time: 0.2
				
		analysisSave.animate
			opacity: 0
			options:
				delay: 0.2
				curve: Bezier.easeInOut
				time: 0.2


## Applications
#MWEO
##Pages[5]
mweoIndex = findPageIndex("MWEO")

#Asset Toggle
assetContainer = new Layer
	parent: pages[mweoIndex].content#MWEOpageComp
	y: 0 #headerBar.y + headerBar.height
	height: 30
	width: 1280 
	image:"images/nav/asset_breadcrumb.svg"
	backgroundColor: crumbPressed
	
#Breadcrumb
BreadcrumbStrings = [
	'Dashboard',
	'Plans',
	'Optimization',
	'Analysis',
	'Alerts',
	'Cases',
]

#Empty array to store breadcrumb items
Breadcrumb = [] 
selectedCrumb = "Dashboard"
iconWidth = 30
breadCrumbPadding = 15
 
#Helper Functions
calcCrumbContainerWidth = (index) -> #calc individual containerWidth
	if index < 0
		return 0 
	fontSize = 10 + (8 * BreadcrumbStrings[index].length) #10px capital letter + 8px per lower case
	containerWidth = 2 * breadCrumbPadding + iconWidth + 5 + fontSize
	return containerWidth
	
calcCrumbXPosition = (index) -> #calc x position based off of previous container widths
	if index < 0
		return 0
	xPos = 0
	for i in [0...index]
		fontSize = 10 + (8 * BreadcrumbStrings[i].length) #10px capital letter + 8px per lower case
		containerWidth = breadCrumbPadding + iconWidth + 5 + fontSize
		xPos = xPos + containerWidth
	return xPos

# Breadcrumb Layer Drawing #
			
breadCrumbContainer = new Layer
	parent: pages[mweoIndex].content#MWEOpageComp
	y: assetContainer.height #headerBar.y + headerBar.height + assetContainer.height
	height: 60
	width: 1280 #Screen.width
	backgroundColor: crumbDefault
	
breadCrumbIndicator = new Layer
		parent: breadCrumbContainer
		x: calcCrumbXPosition(0)
		y: breadCrumbContainer.height
		width: calcCrumbContainerWidth(0) - 15
		height: 2
		backgroundColor: highlightColor
						
createBreadCrumb = (num) ->
	for i in [0...num]
		breadcrumbItemWidth = calcCrumbContainerWidth(i)
		breadcrumbItemXPos = calcCrumbXPosition(i)
		breadcrumbItem = new Layer
			parent: breadCrumbContainer
			name: BreadcrumbStrings[i]
			x: breadcrumbItemXPos
			width: breadcrumbItemWidth
			height: 60
			backgroundColor: crumbDefault
		breadCrumbIcon = new Layer
			parent: breadcrumbItem
			x: 15
			y: 15
			width: 30
			height: 30
			image: "images/icons/" + BreadcrumbStrings[i] + ".svg"
		breadCrumbName = new TextLayer
			parent: breadcrumbItem
			x: 50 #15(padding) + 30(icon) + 5 (icon/name spacing)
			y: 22
			fontFamily: "GE Inspira Sans"
			text: BreadcrumbStrings[i]
			fontSize: 15
		
		breadcrumbItem.page = MWEOPages[i]
		
		Breadcrumb.push(breadcrumbItem)
				
		breadcrumbItem.states = 
			default:
				backgroundColor: crumbDefault
				options: 
					curve: Bezier.easeIn
					time: 0.1
			selected:
				backgroundColor: crumbSelected
				options:
					curve: Bezier.easeIn
					time: 0.1
			hovered:
				backgroundColor: crumbHovered
				options: 
					curve: Bezier.easeIn
					time: 0.1
			pressed:
				backgroundColor: crumbPressed
				options: 
					curve: Bezier.easeIn
					time: 0.1
								
		breadcrumbItem.onMouseOut ->
			if selectedCrumb != this.name
				this.animate("default")
		breadcrumbItem.onMouseOver ->
			if selectedCrumb != this.name
				this.animate("hovered")
		breadcrumbItem.onMouseDown ->
			this.animate("pressed")
		breadcrumbItem.onMouseUp ->
			this.animate("selected")
			selectedCrumb = this.name
			
			for i in [0...Breadcrumb.length]
				if Breadcrumb[i].name == selectedCrumb
					#move the indicator here
					breadCrumbIndicator.animate
						x: calcCrumbXPosition(i)
						width: calcCrumbContainerWidth(i) - 15 #adjust for padding
						options: 
							curve: Bezier.easeInOut
							time: 0.2
				else
					Breadcrumb[i].animate("default")
					MWEOPages[i].animate("default")
			
			@page.animate("active")
			MWEOpageComp.snapToPage(@page)
			
			if this.name == "Optimization"
				OptimizationPage.visible = true
				SingleWell_iframe.visible = false

#Sub-application within IntelliStream
MWEOpageComp = new PageComponent
	parent: pages[mweoIndex].content #Child of the IntelliStream_App PageComponent
	y: breadCrumbContainer.height + assetContainer.height #headerBar.y + headerBar.height + breadCrumbContainer.height + assetContainer.height
	originY: 0
	width: 1280
	height: 900
	backgroundColor: bgColor
	scrollVertical: false
	scrollHorizontal: false
# pageComp.center()

MWEOPages = []

createMWEOPageComp = (num) ->
	for i in [0...num]
		# creating pages
		m_page = new ScrollComponent
			parent: MWEOpageComp.content
			size: MWEOpageComp.size
			backgroundColor: bgColor
			x: MWEOpageComp.width * i
			y: 0
			name: BreadcrumbStrings[i]
			scale: 0.9
			opacity: 0
			scrollHorizontal: false
			mouseWheelEnabled: true
			mouseWheelSpeedMultiplier: 0.5
			
		m_page.scrollHorizontal = false
		pageContent = new Layer
			parent: m_page.content
			name: BreadcrumbStrings[i] + "pageContent"
			width: MWEOpageComp.width
			height: 1700
			image: "images/page_placeholders/" + BreadcrumbStrings[i] + ".png"
		m_page.states = 
			active:
				opacity: 1
				scale: 1
				options: 
					curve: Bezier.easeInOut
					time: 0.5
			
		MWEOPages.push(m_page)
		
#changing active on page scroll
MWEOpageComp.onChange "currentPage", ->
	m_page.states.switch("default") for m_page in MWEOPages
	current = MWEOpageComp.horizontalPageIndex(MWEOpageComp.currentPage)
	selectedCrumb = MWEOpageComp.currentPage.name
	MWEOPages[current].states.switch("active")
	for i in [0...Breadcrumb.length]
		if Breadcrumb[i].name == selectedCrumb
			#move the indicator here
			breadCrumbIndicator.animate
				x: calcCrumbXPosition(i)
				width: calcCrumbContainerWidth(i) - 15 #adjust for padding
				options: 
					curve: Bezier.easeInOut
					time: 0.2
		else
			Breadcrumb[i].animate("default")
			MWEOPages[i].animate("default")
			

createMWEOPageComp(BreadcrumbStrings.length)
createBreadCrumb(BreadcrumbStrings.length)

#Steps
stepsDescrption = [
	'Optimization Group Configuration',
	'Well List',
	'Limiting Constraint Summary',
]

stageLineLength = 215
stageDotWidth = 20
steps = []

#Helper Functions
calcContainerWidth = (length) -> #calc individual containerWidth
	if length < 0
		return 0 
	containerWidth = 10 + (8 * length) #10px capital letter + 8px per lower case
# 	containerWidth = 2 * breadCrumbPadding + iconWidth + 5 + fontSize
	return containerWidth
	
createStepsSummary = (num) ->
	stepsContainer = new Layer
		parent: MWEOpageComp.content.children[2]
		height: 90
		width: MWEOpageComp.content.children[2].width
		backgroundColor: grey01
	
	for i in [0...num]
		stepItem = new Layer
			parent: stepsContainer
			width: stageLineLength + stageDotWidth
			backgroundColor: null
			name: stepsDescrption[i]
			
		dot = new Layer
			parent: stepItem
			name: stepsDescrption[i]
			width: stageDotWidth
			height: stageDotWidth
			x: (stepsContainer.width/num) + (stageLineLength * i) #padding + length of line
			y: 25
			borderWidth: 1
			borderColor: grey02
			borderRadius: 100
			backgroundColor: null
			
		dotCheck = new FontAwesome
			parent: dot
			icon: 'check'
			color: white
			fontSize: 12
			x: 4
			y: 4
			visible: false
# 		dotCheck = new Layer
# 			parent: stepItem
# 			width: 10
# 			height: 5
# 			x: Align.center
# # 			y: Align.center
# 			image: "images/icon/check.svg"
# 			backgroundColor: null	

		stepDescriptionWidth = calcContainerWidth(stepsDescrption[i].length)
		
		stepDescription = new TextLayer
			parent: stepItem
			text: stepsDescrption[i]
			fontFamily: "GE Inspira Sans"
			fontSize: 15
			width: stepDescriptionWidth
			x: (stepsContainer.width/num) + (stageLineLength * i) - stepDescriptionWidth/4
			y: 55
			color: grey03
		if i < num-1
			line = new Layer
				parent: stepItem
				width: 215 - stageDotWidth
				height: 1
				x: (stepsContainer.width/num + stageDotWidth) + (stageLineLength * i)
				y: 35
				backgroundColor: grey02
		
		dot.section = OptimizationPageSections[i]
			
		steps.push(stepItem)
		
		#Step states
		dot.states = 
			active:
				backgroundColor: highlightColor #Fill in the dot
				options: 
					curve: Bezier.easeIn
					time: 0.1
			inactive:
				backgroundColor: null
				options: 
					curve: Bezier.easeIn
					time: 0.1
			complete:
				backgroundColor: highlightColor
				options: 
					curve: Bezier.easeIn
					time: 0.1
		dotCheck.states = 
			active:
				visible: false
				options: 
					curve: Bezier.easeIn
					time: 0.1
			inactive:
				visible: false
				options: 
					curve: Bezier.easeIn
					time: 0.1
			complete:
				visible: true
				options: 
					curve: Bezier.easeIn
					time: 0.1
		stepDescription.states = 
			active:
				color: highlightColor
				fontStyle: "bold"
				options: 
					curve: Bezier.easeIn
					time: 0.1
			inactive:
				color: grey03
				fontStyle: "regular"
				options: 
					curve: Bezier.easeIn
					time: 0.1
			complete:
				color: grey03
				fontStyle: "regular"
				options: 
					curve: Bezier.easeIn
					time: 0.1
		line.states = 
			active:
				height: 4
				backgroundColor: highlightColor
			inactive:
				height: 1
				backgroundColor: grey02
			complete:
				height: 4
				backgroundColor: highlightColor 
		
		dot.onClick ->
			selectedSection = this.name
			selectedSectionIndex = i
			OptimizationPage.snapToPage(@section)
		

#Optimization
OptimizationPageSections = []
selectedSection = stepsDescrption[0]
selectedSectionIndex = 0

#Single Well Optimization HTML iFramer
singleWellOptimization = "<iframe width='#{Screen.width}' height='#{Screen.height}' src='https://github.build.ge.com/pages/212598191/component-prototypes/Scrolling/SidebarScroll/scroll.html' frameborder='0' allowfullscreen></iframe>" 

	
#modify page content for Optimization
OptimizationPage = new PageComponent #Need a nested pageComponent for section scroll
	parent: MWEOpageComp.content.children[2]#.content #child of the scrollableComponent for Optimization View
	y: 90
	width: 1280
	height: 570
	scrollHorizontal: false
	mouseWheelEnabled: true
	
clickThroughAction = new Layer
		parent: MWEOpageComp.content.children[2]
		height: 90
		y: MWEOpageComp.content.children[2].height - 190
		width: MWEOpageComp.content.children[2].width
		backgroundColor: grey01
		opacity: 0.5
		
createModifiedOptimizationView = (num, parent) ->
	MWEOpageComp.content.children[2].children[0].opacity = 0
	
	resetButton = new Layer
		parent: clickThroughAction
		width: 115
		height: 30
		x: pageComp.width/2 - 65 -30
		y: 30
		backgroundColor: grey03
		
	resetText = new TextLayer
		parent: resetButton
		x: Align.center
		y: Align.center
		text: "Reset"
		fontFamily: "GE Inspira Sans"
		color: black
		fontSize: 15
	createCasesButton = new Layer
		parent: clickThroughAction
		width: 115
		height: 30
		x: pageComp.width/2 + 65 - 30
		y: 30
		backgroundColor: blue04
	createCaseText = new TextLayer
		parent: createCasesButton
		x: Align.center
		y: Align.center
		text: "Create Cases"
		fontFamily: "GE Inspira Sans"
		color: white
		fontSize: 15					
	for i in [0...num]
		OptimizationPageSection = new Layer
			parent: OptimizationPage.content
			name: stepsDescrption[i]
			size: OptimizationPage.size
			width: 1280
			height: 570
			y: OptimizationPage.height * i
			image: "images/page_placeholders/Optimization/" + i + ".png"
			opacity: 0.5
		
		OptimizationPageSections.push(OptimizationPageSection)
		
		OptimizationPageSection.state = "inactive"
		
		OptimizationPageSection.states = 
			active:
				opacity: 1
				scale: 1
				options: 
					curve: Bezier.easeInOut
					time: 0.2 * i
					
		OptimizationPageSection.onClick ->
			#Pretend save was clicked
			@state = "complete" #change the state
			
			#Update Steps visuals
			for i in [0...steps.length]
				if steps[i].name == selectedSection == this.name
					selectedSectionIndex = i 
					steps[i].children[0].animate("complete")#dot
					steps[i].children[0].children[0].animate("complete")#dotCheck
					steps[i].children[1].animate("complete")#stepDescription
			
			current = OptimizationPage.verticalPageIndex(OptimizationPage.currentPage)
			selectedSection = OptimizationPage.currentPage.name
			
			#AutoScroll if there are more sections
			if (current+1) < stepsDescrption.length
				OptimizationPage.snapToPage(OptimizationPageSections[current+1])
				
			else #enable the clickThroughAction if the user got to the end
				clickThroughAction.animate
					opacity: 1
					options: 
						curve: Bezier.easeInOut
						time: 0.2
		
	createStepsSummary(num) #Create the stage
	#Set the first section to be active by default
	OptimizationPageSections[0].opacity = 1
	OptimizationPageSections[0].state = "active"
	for j in [0...steps[0].children.length-1]
		steps[0].children[j].animate("active")
	#I shouldn't have to do this but Framer failed me :/
	MWEOpageComp.content.children[2].children[1].opacity = 1
		
#changing active on OptimizationPage scroll
OptimizationPage.onChange "currentPage", ->
	section.states.switch("default") for section in OptimizationPageSections
	current = OptimizationPage.verticalPageIndex(OptimizationPage.currentPage)
	selectedSection = OptimizationPage.currentPage.name
	
	OptimizationPageSections[current].states.switch("active")
	
	#Going backgward logic			
	if current < selectedSectionIndex && OptimizationPageSections[selectedSectionIndex].state != "complete" #if we are going back a steps
		steps[selectedSectionIndex].children[0].animate("inactive")#dot
		steps[selectedSectionIndex].children[0].children[0].animate("inactive")#dotCheck
		steps[selectedSectionIndex].children[1].animate("inactive")#stepDescription
		if selectedSectionIndex > 0
				#if this isn't the first node, de-highlight the line
				steps[selectedSectionIndex-1].children[2].animate("inactive")#line
		clickThroughAction.opacity = 0.5		
	#Going forward logic	
	for i in [0...steps.length]
		if steps[i].name == selectedSection && OptimizationPageSections[i].state != "complete"
			selectedSectionIndex = i 
			steps[i].children[0].animate("active")#dot
			steps[i].children[0].children[0].animate("inactive")#dotCheck
			steps[i].children[1].animate("active")#stepDescription
			if i > 0
				#if this isn't the first node, highlight the previous line
				steps[i-1].children[2].animate("active")#line
				 
			if i == steps.length-1
				clickThroughAction.animate
					opacity: 1
					options: 
						curve: Bezier.easeInOut
						time: 0.2

MWEOpageComp.content.children[2].onScrollEnd ->
# 	print "onScrollEnd!"
createModifiedOptimizationView(3) #Create this modified view

SingleWell_iframe = new Layer
	parent: MWEOpageComp.content.children[2]#.content #child of the scrollableComponent for Optimization View
	y: 0
	width: 1280
	height: 470
	ignoreEvents: false
	html: singleWellOptimization
# 	opacity: 0
	visible: false
	
document.addEventListener 'keydown', (e) ->
	if (e.keyCode is 27) #escape key
		SingleWell_iframe.visible = false
		OptimizationPage.visible = true
			
#Listen for the clickEvent for the Well List section only
OptimizationPageSections[1].onDoubleClick ->
	OptimizationPage.visible = false
	SingleWell_iframe.visible = true

# Main for MWEO # 
#select Dashboard by default
MWEOPages[0].animate("default")
selectedCrumb = "Dashboard"
Breadcrumb[0].backgroundColor = crumbSelected
MWEOpageComp.snapToPage(MWEOPages[0])
MWEOpageComp.content.children[0].states.switchInstant "active"				

#Main
drawSearchTableBuild()




