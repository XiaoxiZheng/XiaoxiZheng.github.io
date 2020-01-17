# SETTINGS
{Highcharts} = require "npm"
{countup} = require "npm"

FontAwesome = require 'FontAwesome'
Placeholder = require 'LoadingPlaceholder'

document.body.style.cursor = "auto"
Framer.Defaults.Layer.force2d = true
# Framer.Extras.Hints.enable()
	
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
spring_animateIn = "spring(750,60,50)"
spring_animateOut = "spring(750,65,30)"

# Bezier Curves
easeInCubic = Bezier(0.55,0.055,0.675,0.19)

easeOutCubic = Bezier(0.215,0.61,0.355,1)
easeOutQuart = Bezier(0.19,1,0.22,1)
easeOutQuart = Bezier(0.165,0.84,0.44,1)

easeOutInCubic = Bezier(0.645, 0.045, 0.355, 1)

easeInOutQuad = Bezier(0.455, 0.03, 0.515, 0.955)
easeInExpo = Bezier(0.95, 0.05, 0.795, 0.035)

bezier_curveOptions = [0.8, 0.03, 0.65, 0.02]

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
darkBlue = blue02
logoBlue = "#0067A5"

white = "#FFFFFF"
black = "#000000"

#Predix Color
grey01 ="#EBEFF2"
grey02 = "#889AA5"#boderColor
grey03 = "#677E8C" #fontColor 
blueGrey = "#E2E8ED"
highlightColor = blue04 
facetItemBgColor = white

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

searchData = JSON.parse Utils.domLoadDataSync "searchResultsData.json"
notificationsData = JSON.parse Utils.domLoadDataSync "notificationsData.json"
# CSS STYLES
Utils.insertCSS ("
	section {border-top:1px solid #000; margin:15px 15px 0 15px; width:210px; padding:0; font-size:14px;}
	section.selectTag {border-top:1px solid #000; margin-top: 1rem;}
	hr {
		display: block;
		height: 1px;
		border: 0;
		border-top: 1px solid #000;
		margin: 1em 0;
		padding: 0; 
	}
	h2 {font-size:14px; margin:5px 12px 0 12px; padding-top:10px;}
	h2 > span, li > span {float:right;}
	.pill {color: #FFF; font-size: 12px; line-height: 2.2; padding: 0 10px 0 12px; background-color: #09819C; border-radius: 20px; height: 25px; display:inline-block;}
	.close {background: url('images/close-icon.svg') right center no-repeat; background-size:cover; display:inline-block; width:10px; float:right; margin:8px 0 0 10px; height:10px;}
	.check-wrapper {position:relative; background-color:#fff; color:#09819C; border-bottom:1px solid #8BD6FF; padding: 5px 0;}
	.check-wrapper input {position:absolute; z-index: 2; top:12px; left:12px;}
	label {padding-left:35px;}
	.more-btn {display:block; float:right; color:#09819C; margin:0 12px 0 0;}
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
	li {font-size: 15px; font-family:GE Inspira Sans; color:#09819C; padding:5px 12px; border:none;}
	
	ul.selectMenu {margin-top:4px; height: 30px; width: 120px; color:#fff; font:15px GE Inspira Sans; background-color: #065769;}
	ul.selectMenu li {padding:5px 15px; z-index: 2; list-style:none;}
	ul.selectMenu li:not(.init) {float: left; width:90px; display:none; background-color:#666; }
	ul.selectMenu li:not(.init):hover, ul li.selected:not(.init) { background: #09f; }
	ul.selectMenu li.init {cursor:pointer;}
	.dots {padding: 5px 10px; list-style:none;}
	.dots li { position:relative;}
	.dots li > span {color:#fff;  margin-left:5px; font-size:14px; position:absolute; top:2px; left:25px;}
")
#Global Variables & Helper Functions
pageNames = [
	'D_Dashboard',
	'Notifications',
	'Search',
	'Analysis',
	'MWEO',
	'Loader'
]

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
	animateListViewComponents(false) 
	AnalysisAnimation(false, "prevPage", "currentPage")
	
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

#Theme Changing
toggleColorTheme = (darkModeIsOn) ->
	if darkModeIsOn
		bgColor = blue01
		defaultFontColor = white
		
		pages[dashboardPage].content.children[0].image = "images/page_placeholders/D_Dashboard_Dark.png"
		
		#Analysis Chart bg
		vspCurveContainer.image = "images/curves/vspCurve_dark.svg"
		gradientCurveContainer.image = "images/curves/gradientCurve_dark.svg"
		iprCurveContainer.image = "images/curves/iprCurve_dark.svg"
		analysisHeader.image = "images/analysis-header_dark.png"
	else
		bgColor = white
		defaultFontColor = black
		
		pages[dashboardPage].content.children[0].image = "images/page_placeholders/D_Dashboard.png"
		#Analysis Chart bg
		vspCurveContainer.image = "images/curves/vspCurve.svg"
		gradientCurveContainer.image = "images/curves/gradientCurve.svg"
		iprCurveContainer.image = "images/curves/iprCurve.svg"
		analysisHeader.image = "images/analysis-header.png"
	
	#Update Highchart colors
	createHighChart(defaultFontColor,"timeseriesContainer")
	
	updateBgColor (bgColor)
	updateDefaultFontColor (defaultFontColor)

updateBgColor = (bgColor_) ->
	pageComp.backgroundColor = bgColor_
	
	for i in [0...pages.length]
		pages[i].backgroundColor = bgColor_
		
	kpisContainer.backgroundColor = bgColor_
	timeseriesContainer.backgroundColor = bgColor_
	topWellsContainer.backgroundColor = bgColor_
	tableContainer.backgroundColor = bgColor_

	##Data table row was stored in row[]
	for i in [0...rows.length]
		rows[i].backgroundColor = bgColor_
		if darkMode
			rows[i].chart.backgroundColor = blue02
		else
			rows[i].chart.backgroundColor = white
	
	#SearchListView/Notifications list view
	if darkMode
		facetBg.opacity = 0
		n_facetBG.opacity = 0

	else
		facetBg.opacity = 1
		n_facetBG.opacity = 1

	resultsTableContainer.backgroundColor = bgColor_
	n_resultsTableContainer.backgroundColor = bgColor_
	
	for i in [0...searchRows.length]
		searchRows[i].backgroundColor = bgColor_
		rowContent[i].backgroundColor = bgColor_
		
updateDefaultFontColor = (defaultFontColor_) ->
	for i in[0...kpisContainer.descendants.length]
		kpisContainer.descendants[i].color = defaultFontColor_
	for i in [0...topWellsContainer.descendants.length]
		topWellsContainer.descendants[i].color = defaultFontColor_
		
	#Data table font so many edge cases^&*()(*&^&*&^)
	expandTableIcon.color = defaultFontColor
	if darkMode
		backBtnTitle.color = blue05
		#Search result facet panel is a special princess too...
		for i in [0...facetContainer.descendants.length]
			facetContainer.descendants[i].color = "#45ACCC"
	else
		backBtnTitle.color = blue04
		for i in [0...facetContainer.descendants.length]
			facetContainer.descendants[i].color = "#09819C"
	backBtnSubtitle.color = defaultFontColor_
	for i in [0...tableHeaderContainer.descendants.length]
		tableHeaderContainer.descendants[i].color = defaultFontColor_
	for i in [0...rows.length]
# 		createDataTableHighChart(defaultFontColor,"tsDivId_" + i)
		for j in [3...rows[i].descendants.length]
			rows[i].descendants[j].color = defaultFontColor_
			
	#AnalysisPage Color updateBgColor
	currentPageText.color = defaultFontColor_
	for i in [0...sliderContainer.descendants.length]
		sliderContainer.descendants[i].color = defaultFontColor_
	
	#SearchListView
	##facets
	if darkMode
		Utils.insertCSS("
			section {border-top:1px solid #fff; margin:15px 15px 0 15px; width:210px; padding:0; font-size:14px;}
			hr {
				display: block;
				height: 1px;
				border: 0;
				border-top: 1px solid #fff;
				margin: 1em 0;
				padding: 0; 
			}
			.check-wrapper {position:relative; background-color:#012939; color:#fff; border-bottom:1px solid #8BD6FF; padding: 5px 0;}
		")
	else
		Utils.insertCSS("
			section {border-top:1px solid #000; margin:15px 15px 0 15px; width:210px; padding:0; font-size:14px;}
			hr {
				display: block;
				height: 1px;
				border: 0;
				border-top: 1px solid #000;
				margin: 1em 0;	
				padding: 0; 
			}
			.check-wrapper {position:relative; background-color:#fff; color:#000; border-bottom:1px solid #8BD6FF; padding: 5px 0;}
		")
	## subHeader
	for i in [0...subHeader.children.length]
		subHeader.children[i].color = defaultFontColor_
		notifications_subHeader.children[i].color = defaultFontColor_
	##ListContent
	for i in [0...searchRows.length]
		searchRows[i].assetTags.color = defaultFontColor_
		searchRows[i].assetNameEntry.color = defaultFontColor_
		
		rowContent[i].assetTags.color = defaultFontColor
		rowContent[i].assetNameEntry.color = defaultFontColor
	
		
		



#Header

logo.onMouseOver ->
	document.body.style.cursor = "pointer"
logo.onMouseOut ->
	document.body.style.cursor = "auto"
logo.onClick ->
	pageIndex = findPageIndex("D_Dashboard")
	setPageToActive(pageIndex)
	smallTable()


search.onMouseOver ->
	document.body.style.cursor = "pointer"
search.onMouseOut ->
	document.body.style.cursor = "auto"
search.onClick ->
	pageIndex = findPageIndex("Search")
	pages[pageIndex].animate("active")
	pages[pageIndex].bringToFront()
	
# 	SearchHistory.bringToFront()
	appDrawerContainer.bringToFront()
	
# 	drawSearchTableBuild(0,searchData.length)
	animateSearchComponents(true)
	animateListViewComponents(false)
	 
	Utils.delay 1, ->
		scaleDown(pageIndex)
			
	animateAllPagesToDefault()

notification.onMouseOver ->
	document.body.style.cursor = "pointer"
notification.onMouseOut ->
	document.body.style.cursor = "auto"
notification.onClick ->
	notification_inbox.stateCycle("on", "off")
	notification_inbox.bringToFront()

	if notification_inbox.states.current.name == "on"
		animateNotificationInbox("in")
	else
		animateNotificationInbox("out")
		
profile.onClick ->
	darkMode = !darkMode
	toggleColorTheme(darkMode)			

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
		animationOptions:
			curve: easeOutQuart
			time: 0.2
	stateB:
		x: -240
		animationOptions:
			curve: easeOutQuart
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


appDrawerDashboards.onMouseOver ->
	document.body.style.cursor = "pointer"
appDrawerDashboards.onMouseOut ->
	document.body.style.cursor = "auto"
	
appDrawerDashboards.on Events.Click, ->
# 	animateLoader(0.07)
	
	pageIndex = findPageIndex("D_Dashboard")
	pages[pageIndex].animate("active")
	pages[pageIndex].bringToFront()
	appDrawerContainer.bringToFront()
	
	Utils.delay 1, ->
		scaleDown(pageIndex)
			
	animateAllPagesToDefault()
	
	animateSearchComponents(false)
	animateListViewComponents(false)
	appDrawerContainer.animate("stateB")

appDrawerApps.onMouseOver ->
	document.body.style.cursor = "pointer"
appDrawerApps.onMouseOut ->
	document.body.style.cursor = "auto"
					
appDrawerApps.on Events.Click, ->
	pace = 0.03
	animateLoader(pace)
	
	Utils.delay pace*100, ->
		pageIndex = findPageIndex("MWEO")
		pages[pageIndex].animate("active")
		pages[pageIndex].bringToFront()
		appDrawerContainer.bringToFront()
	
		scaleDown(pageIndex)
			
	animateAllPagesToDefault()
	
	appDrawerContainer.animate ("stateB")
	animateSearchComponents(false)
	animateListViewComponents(false)
	
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
	height: 890
	backgroundColor: bgColor
	scrollHorizontal: false
	mouseWheelEnabled: true

createPageComp = (num) ->
	for i in [0...num]
		# creating pages
		page = new ScrollComponent
			parent: pageComp
			size: pageComp.size
			x: 0
			y: headerBar.height
			parent: pageComp.content
			name: pageNames[i] + " ScrollComponent"
			opacity: 0
			scrollHorizontal: false
			scrollVertical: false
			mouseWheelEnabled: true
					
		pageContent = new Layer
			parent: page.content
			name: pageNames[i] + " Content"
			width: pageComp.width
			height: pageComp.height
			image: "images/page_placeholders/" + pageNames[i] + ".png"
			
		page.states = 
			default:
				opacity: 0
				y: headerBar.height
				options:
					curve: Bezier.easeInOut
					time: 0.2
			active:
				opacity: 1
				y: headerBar.height
				options: 
					curve: Bezier.easeInOut
					time: 0.4
			
		pages.push(page)
		

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

#############
# KPI SPINE #
#############

kpisContainer = new Layer
	parent: pages[dashboardPage]
	width: dashboardWidth, height: 100
	backgroundColor: bgColor
	borderWidth: 1
	borderColor: highlightColor

# WELL COUNT
wellKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	
wellCountLabel = new TextLayer
	parent: wellKpiContainer
	x: 25, y: 25
	text: "WELL COUNT"
	font: "300 12px/1.5 GE Inspira Sans"
	color: defaultFontColor
	
wellCountVal = new Layer
	parent: wellKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: defaultFontColor
	clip: true
wellCountVal.html = '<div id="wellCountVal" style="font-size:32px; font-family:GE Inspira Sans; line-height:1";></div>'
# wellNumber = new countup("wellCountVal", 0, Utils.randomNumber(10, 180), 0, 2, options)
# wellNumber.start()

# LIQUID COUNT	
liquidKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	x: wellKpiContainer.width
	
liquidCountLabel = new TextLayer
	parent: liquidKpiContainer
	x: 25, y: 25
	text: "LIQUID"
	font: "300 12px/1.5 GE Inspira Sans"
	color: defaultFontColor
	
liquidCountVal = new Layer
	parent: liquidKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: defaultFontColor
	clip: true
liquidCountVal.html = '<div id="liquidCountVal" style="font-size:32px; font-family:GE Inspira Sans; line-height:1";></div>'
# liquidNumber = new countup("liquidCountVal", 0, Utils.randomNumber(1000, 100000), 0, 2, options)
# liquidNumber.start()

liquidUoM = new TextLayer
	parent: liquidKpiContainer
	x: liquidCountVal.x + 80 
	y: liquidCountVal.y + 10 
	font:"300 12px/1.5 GE Inspira Sans"
	color: defaultFontColor
	text:" bbl/day"

# OIL COUNT	
oilKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	x: wellKpiContainer.width + liquidKpiContainer.width
	
oilCountLabel = new TextLayer
	parent: oilKpiContainer
	x: 25, y: 25
	text: "OIL"
	font: "300 12px/1.5 GE Inspira Sans"
	color: defaultFontColor
	
oilCountVal = new Layer
	parent: oilKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: defaultFontColor
	clip: true
	originX: 0 #topLeft
	html: '<div id="oilCountVal" style="font-size:32px; font-family:GE Inspira Sans; line-height:1";></div>'
# oilNumber = new countup("oilCountVal", 0, Utils.randomNumber(1000, 50000), 0, 2, options)
# oilNumber.start()

oilUoM = new TextLayer
	parent: oilKpiContainer
	x: oilCountVal.x + 90 
	y: oilCountVal.y + 10 
	font:"300 12px/1.5 GE Inspira Sans"
	color: defaultFontColor
	text:"MCFD"
	
oilSpine = new Layer
	parent: oilKpiContainer
	width: 190
	height: 15
	y: 70
	x: 25
	opacity: 0.5
	originX: 0
	image: "images/spine/green.svg"

#Hover
oilKpiContainer.onMouseOver ->
	oilCountVal.animate
		scale: 0.75
		options: 
			time: 0.2
	oilUoM.animate
		opacity: 0
		options: 
			time: 0.2
	oilSpine.animate
		opacity: 1
		scale: 1.15
		options: 
			time: 0.2
oilKpiContainer.onMouseOut ->
	oilCountVal.animate
		scale: 1
		options: 
			time: 0.2
	oilUoM.animate
		opacity: 1
		options: 
			time: 0.2
	oilSpine.animate
		opacity: 0.5
		scale: 1
		options: 
			time: 0.2

# WATER COUNT	
waterKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	x: wellKpiContainer.width + liquidKpiContainer.width + oilKpiContainer.width
	
waterCountLabel = new TextLayer
	parent: waterKpiContainer
	x: 25, y: 25
	text: "WATER"
	font: "300 12px/1.5 GE Inspira Sans"
	color: defaultFontColor
	
waterCountVal = new Layer
	parent: waterKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: defaultFontColor
	clip: true
	originX: 0
waterCountVal.html = '<div id="waterCountVal" style="font-size:32px; font-family:GE Inspira Sans; line-height:1";></div>'
# waterNumber = new countup("waterCountVal", 0, Utils.randomNumber(1000, 100000), 0, 2, options)
# waterNumber.start()

waterUoM = new TextLayer
	parent: waterKpiContainer
	x: waterCountVal.x + 90 
	y: waterCountVal.y + 10 
	font:"300 12px/1.5 GE Inspira Sans"
	color: defaultFontColor
	text:"bbl/day"
	
waterSpine = new Layer
	parent: waterKpiContainer
	width: 190
	height: 15
	y: 70
	x: 25
	opacity: 0.8
	originX: 0
	image: "images/spine/blue.svg"

#Hover
waterKpiContainer.onMouseOver ->
	waterCountVal.animate
		scale: 0.75
		options: 
			time: 0.2
	waterUoM.animate
		opacity: 0
		options: 
			time: 0.2
	waterSpine.animate
		opacity: 1
		scale: 1.15
		options: 
			time: 0.2
waterKpiContainer.onMouseOut ->
	waterCountVal.animate
		scale: 1
		options: 
			time: 0.2
	waterUoM.animate
		opacity: 1
		options: 
			time: 0.2
	waterSpine.animate
		opacity: 0.5
		scale: 1
		options: 
			time: 0.2
			
# GAS COUNT	
gasKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	x: wellKpiContainer.width + liquidKpiContainer.width + oilKpiContainer.width + waterKpiContainer.width
	
gasCountLabel = new TextLayer
	parent: gasKpiContainer
	x: 25, y: 25
	text: "GAS"
	font: "300 12px/1.5 GE Inspira Sans"
	color: defaultFontColor
	
gasCountVal = new Layer
	parent: gasKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: defaultFontColor
	originX: 0
	clip: true
gasCountVal.html = '<div id="gasCountVal" style="font-size:32px; font-family:GE Inspira Sans; line-height:1";></div>'
# gasNumber = new countup("gasCountVal", 0, Utils.randomNumber(1000, 50000), 0, 2, options)
# gasNumber.start()

gasUoM = new TextLayer
	parent: gasKpiContainer
	x: gasCountVal.x + 90 
	y: gasCountVal.y + 10 
	font:"300 12px/1.5 GE Inspira Sans"
	color: defaultFontColor
	text:"bbl/day"
	
gasSpine = new Layer
	parent: gasKpiContainer
	width: 190
	height: 15
	y: 70
	x: 25
	opacity: 0.8
	image: "images/spine/orange.svg"
	originX: 0

#Hover
gasKpiContainer.onMouseOver ->
	gasCountVal.animate
		scale: 0.75
		options: 
			time: 0.2
	gasUoM.animate
		opacity: 0
		options: 
			time: 0.2
	gasSpine.animate
		opacity: 1
		scale: 1.15
		options: 
			time: 0.2
gasKpiContainer.onMouseOut ->
	gasCountVal.animate
		scale: 1
		options: 
			time: 0.2
	gasUoM.animate
		opacity: 1
		options: 
			time: 0.2
	gasSpine.animate
		opacity: 0.5
		scale: 1
		options: 
			time: 0.2
			
# ALERTS COUNT	
alertsKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	x: wellKpiContainer.width + liquidKpiContainer.width + oilKpiContainer.width + waterKpiContainer.width + gasKpiContainer.width
	
alertsCountLabel = new TextLayer
	parent: alertsKpiContainer
	x: 25, y: 25
	text: "ALERTS"
	font: "300 12px/1.5 GE Inspira Sans"
	color: defaultFontColor
	
alertsCountVal = new Layer
	parent: alertsKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: defaultFontColor
	clip: true
alertsCountVal.html = '<div id="alertsCountVal" style="font-size:32px; font-family:GE Inspira Sans; line-height:1";></div>'
# alertsNumber = new countup("alertsCountVal", 0, Utils.randomNumber(1, 50), 0, 2, options)
# alertsNumber.start()

div = new TextLayer
	parent: alertsKpiContainer
	x: 55, y: 40
	text: "/"
	font: "300 32px/1.5 GE Inspira Sans"
	color: defaultFontColor

alertsCountVal2 = new Layer
	parent: alertsKpiContainer
	width: 140, height: 30, x: 70, y: 45
	backgroundColor: null
	color: defaultFontColor
	clip: true
alertsCountVal2.html = '<div id="alertsCountVal2" style="font-size:32px; font-family:GE Inspira Sans; line-height:1";></div>'
# alertsNumber = new countup("alertsCountVal2", 0, Utils.randomNumber(1, 50), 0, 2, options)
# alertsNumber.start()
	

generateRandomKPIs = () ->		
	for i in [0..101-1]
		gasData.push Math.round(Utils.randomNumber(22000, 35000))
		waterData.push Math.round(Utils.randomNumber(30000, 50000))
		oilData.push Math.round(Utils.randomNumber(65000, 90000))
		
generateRandomKPIs()

###############################
# Time-series chart dashboard #
###############################

timeseriesContainer = new Layer
	parent: pages[dashboardPage]
	width: dashboardWidth/3 * 2, height: 260
	y: kpisContainer.height - 1
	backgroundColor: bgColor
	borderWidth: 1
	borderColor: highlightColor
	opacity: 0
	html: '<div id="timeseriesContainer" style="height:225px;"></div>'

dropDown = new TextLayer
	width: 120, height: 30, x: 230
	y: 13
	backgroundColor: blue04
	text: "Year"
	font: "400 15px/1 -apple-system, GE Isnpira Sans"
	color: "white"
	padding: 8
	parent: timeseriesContainer
	
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
	parent: timeseriesContainer
	width: 69, height: 19, x: timeseriesContainer.width - 90, y: 20
	image: "images/widget-controls.svg"

oilLegend = new Layer
	parent: timeseriesContainer
	backgroundColor: null
	x: timeseriesContainer.width - 90, y: 65
	width: 70, height: 25
	html: '<div class="greenLegend">Oil</div>'
	
waterLegend = new Layer
	parent: timeseriesContainer
	backgroundColor: null
	x: timeseriesContainer.width - 90, y: oilLegend.y + oilLegend.height + 5
	width: 70, height: 25
	html: '<div class="waterLegend">Water</div>'
	
gasLegend = new Layer
	parent: timeseriesContainer
	backgroundColor: null
	x: timeseriesContainer.width - 90, y: waterLegend.y + waterLegend.height + 5
	width: 70, height: 25
	html: '<div class="gasLegend">Gas</div>'

timeseriesContainer.onMouseOver ->
timeseriesContainer.onMouseOut ->
	
#Highcharts
createHighChart = (defaultFontColor_,chartID) -> #string, strngID
	timeSeriesChart = Highcharts.chart(chartID,
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'line', renderTo: '', marginLeft: 75, marginRight: 110, marginTop: 65, marginBottom: 20, backgroundColor: null}
		title: {text:'PRODUCTION OVER TIME', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '18px', color: defaultFontColor_, fontWeight: 400}, y: 25, x: 15}
		xAxis:
			categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			tickColor: null, type: 'datetime', tickInterval: 30 * 24 * 3600 * 1000
			labels:
				enabled: true, style: {color: defaultFontColor_}, format: '{value: %m}'
		yAxis:
			title: null, crosshair: false, tickInterval: 30000
			labels: {style: {color: defaultFontColor_}}
			gridLineColor: gray
			lineColor: defaultFontColor_
			lineWidth: 1.5
		series: 
			[{type: 'line', name: 'Gas', data: gasData, color: orange
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
			backgroundColor: white
			borderColor: '#555555'
			borderWidth: 1
			shadow: false
			headerFormat: '<span class="metric">Production Over Time</span></br>'
			pointFormat: '<span class="row"><span class="alignLeft"><span style="color:{point.color}">\u25CF</span> {series.name} </span><span class="alignRight"><b> {point.y} (cu.ft/d)</b></span></span>'
		plotOptions:
			line: {lineWidth: 1.5}
			series:
				marker: {enabled: false, symbol: 'circle'}
				states: {hover: {fillColor: null, lineWidth: 2, lineColor: null}}
				pointStart: Date.UTC(2017, 0, 3)
				pointRange: 30 * 24 * 3600 * 1000
# 				animation: {
# 					duration: 500,
# 					easing: "easeInExpo"
# 				}
	)
	
# createHighChart(defaultFontColor,"timeseriesContainer") #timeseriesChart = 

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

#######################
# TOP PRODUCING WELLS #
#######################

topWellsContainer = new Layer
	parent: pages[dashboardPage]
	y: kpisContainer.height - 1, x: timeseriesContainer.width - 1
	width: dashboardWidth/3, height: 790
	backgroundColor: bgColor
	borderWidth: 1
	borderColor: highlightColor
	
topWellsBarContainer = new Layer
	parent: pages[dashboardPage]
	y: kpisContainer.height, x: timeseriesContainer.width
	width: dashboardWidth/3, height: 790
	backgroundColor: null
	
topWellHeader = new TextLayer
	height: 60, x: 30, y: 20
	parent: topWellsContainer
	text: "FAVORITE WELLS"
	font: "400 18px/1.5 GE Inspira Sans"
	color: defaultFontColor
	
widgetControls = new Layer
	parent: topWellsContainer
	width: 69, height: 19, x: topWellsContainer.width - 90, y: 20
	image: "images/widget-controls.svg"
	
# Create an array to store the histogram and an array to assign a random height to each bar 
histogram = []
barWidth = []

# create gray bars, well names, esp and BBL labels		
buildTopWellsInit = (length) ->
	for i in [0...length]
		grayBars = new Layer
			width: 280, height: 4
			y: i * 73 + 115, x: 30
			parent: topWellsContainer
			backgroundColor: gray
			
		well = new TextLayer
			y: grayBars.y - 40, x: 30
			parent: topWellsContainer
			text: wellName[i]
			font: "18px/1 GE Inspira Sans"
			color: defaultFontColor
			
		esp = new TextLayer
			y: grayBars.y - 35, x: 30 + well.width + 10
			parent: topWellsContainer
			text: "ESP"
			font: "12px/1 GE Inspira Sans"
			color: defaultFontColor
			
		bblLabel = new TextLayer
			y: grayBars.y - 4, x: 360
			parent: topWellsContainer
			text: "BBL/DAY"
			font: "12px/1 GE Inspira Sans"
			color: defaultFontColor
		
		bars = new Layer
			width: 0, height: 4
			y: i * 73 + 115, x: 30
			parent: topWellsContainer
			backgroundColor: ""
	
		# populate the arrays with the number of bars and their random generated numbers
		histogram.push bars
		barWidth.push Utils.randomNumber(50, 200)
	
		# logic to determine the color of the bars
		if barWidth[i] < 100
			bars.backgroundColor = red
			
		if barWidth[i] >= 100 && barWidth[i] <= 150
			bars.backgroundColor = yellow
			
		if barWidth[i] > 150
			bars.backgroundColor = green
		
		BBLCounter = new TextLayer
			y: bars.y - 4, x: 325
			parent: topWellsContainer
			text: Math.round(barWidth[i])
			font: "12px/1 GE Inspira Sans"
			color: "white"
		
animateTopWells = () ->
	# animate the bars	
	for bar, j in histogram
		bar.animate
			curve: easeInCubic
			properties:
				width: barWidth[j]
				x: barWidth[j] - bar
			delay: bar/10
			time: .3

rebuildTopWells = ->
	Utils.delay 0.1, ->
		topWellsContainer.animate
			opacity: 1
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
							
# buildTopWellsInit(10)
# animateTopWells()


rows = []

tableContainer = new Layer
		parent: pages[dashboardPage]
		width: dashboardWidth/3 * 1.95, height: tableHeight - 40
		x: 15
		y: headerBar.height + kpisContainer.height + timeseriesContainer.height + 50
		clip: true
		backgroundColor: null
		opacity: 0 
		
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
	y: 30
	image: "images/back-arrow.svg"
	
backBtnTitle = new TextLayer
	parent: backNavContainer
	width: 225, height: 23, x: backArrow.width + 40
	y: 28
	text: "DASHBOARD"
	font: "400 18px/1.5 GE Inspira Sans"
	color: blue04
	
backBtnSubtitle = new TextLayer
	parent: backNavContainer
	width: 450, height: 23
	y: 28, x: backArrow.width + backBtnTitle.width - 70
	text: "PRODUCTION BY REGION"
	font: "400 18px/1.5 GE Inspira Sans"
	color: defaultFontColor

backNavContainer.on Events.MouseOver, ->
document.body.style.cursor = "pointer"

backNavContainer.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
		
backNavContainer.on Events.TouchEnd, ->
	pages[dashboardPage].children[0].animate
		opacity: 1
		options:
			time: 0.2
			curve: easeOutQuart
	
	tableContainer.animate("smallTable")
	
	expandTableIcon.visible = true
	backNavContainer.visible = false
# 	expandTableIcon.x = tableControl.x + tableControl.width + 14
	
	kpisContainer.visible = true
	timeseriesContainer.visible = true
	topWellsContainer.visible = true
	
# TABLE HEADER
# 	tableContainer = new Layer
# 		parent: pages[dashboardPage]
# 		width: dashboardWidth/3 * 1.95, height: tableHeight - 40
# 		x: 15
# 		y: headerBar.height + kpisContainer.height + timeseriesContainer.height
# 		clip: true
# 		backgroundColor: null

tableContainer.states = 
	smallTable:
		height: tableHeight - 40
		width: dashboardWidth/3 * 1.95
		height: tableHeight - 40
		x: 15
		y: headerBar.height + kpisContainer.height + timeseriesContainer.height
		options:
			time: 0.4
			curve: easeOutQuart
	bigTable:
		y: headerBar.height
		width: tableWidth
		height: tableFullHeight
		options:
			time: 0.4
			curve: easeOutQuart

expandTableIcon = new FontAwesome
	parent: pages[dashboardPage]
	icon: 'expand'
	color: black
	fontSize: 15
	x: tableControl.x + tableControl.width + 14
	y: 390
	visible: true			
expandTableIcon.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"	
expandTableIcon.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
expandTableIcon.on Events.TouchEnd, ->
	expandTable()
		
tableHeaderContainer = new Layer
	parent: tableContainer
	backgroundColor: null
# 	backgroundColor: bgColor
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
# 	backgroundColor: bgColor
	contentInset: top: 0, bottom: 100
tableScrollContainer.scrollHorizontal = false
tableScrollContainer.mouseWheelEnabled = true

drawDashboardTable = () ->
	# TABLE BUILD
	for i in [0..rowCount]	
		tableData = new Layer
			width: tableWidth, height: 42, y: 5 + (43 * i)
			backgroundColor: bgColor
			parent: tableScrollContainer.content
			shadowColor: "rgba(100,100,100,0.5)"
			shadowY: 1
			name: "dataRow"
			clip: true
			opacity: 1
			animationOptions:
				curve: easeInExpo
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
				pageIndex = findPageIndex("Analysis")
				
				setPageToActive(pageIndex)				
				pages[pageIndex].animate("active")
				pages[pageIndex].bringToFront()
				
				appDrawerContainer.bringToFront()
				
				animateSearchComponents(false)
				animateListViewComponents(false)
				
				AnalysisAnimation(true,"PRODUCTION", "OPTIMIZATION")
				 
				Utils.delay 1, ->
					scaleDown(pageIndex)
						
				animateAllPagesToDefault()
			
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
			tableData.donutTotal = new TextLayer
				parent: dcContainer
				backgroundColor: 'transparent'
				width: 90, height: 90
				y: 110, x: 162
				text: 152 + 'k'
				color: defaultFontColor
				fontSize: 36
				fontWeight: 400
				
	# 		donutTotalNum = Utils.randomChoice([1..150])	
	# 		# shift the total number based on a 1 or 2 or 3 digit
	# 		if donutTotalNum < 10
	# 			tableData.donutTotal.x = 180
	# 		else if donutTotalNum > 10 and donutTotalNum < 99
	# 			tableData.donutTotal.x = 172
	# 		else
	# 			tableData.donutTotal.x = 162
	# 		
	# 		tableData.donutTotal.text = donutTotalNum
			
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
					curve: easeInExpo
					time: 0.02
			
	Utils.delay 0.1, ->
		for k in [4..17]
			rows[k].animate
				opacity: 1
				y: 0 + (43 * k)
				options:
					delay: 0.05
				animationOptions:
					curve:easeInExpo
					time: 0.02
					
smallTable = () ->
	tableContainer.animate
		height: tableHeight - 40
		width: dashboardWidth/3 * 1.95
		height: tableHeight - 40
		x: 15
		y: headerBar.height + kpisContainer.height + timeseriesContainer.height
		options:
			time: 0.4
			curve: easeOutQuart
			
	kpisContainer.visible = true
	timeseriesContainer.visible = true
	topWellsContainer.visible = true
	
	pages[dashboardPage].children[0].animate
		opacity: 1
		options:
			time: 0.2
			curve: easeOutQuart
	expandTableIcon.visible = true
	backNavContainer.visible = false
# 	expandTableIcon.x = tableControl.x + tableControl.width + 14
	
expandTable = ->
	pages[dashboardPage].children[0].animate
		opacity: 0
		options:
			time: 0.2
			curve: easeOutQuart
			
	tableContainer.animate("bigTable")
	
	kpisContainer.visible = false
	timeseriesContainer.visible = false
	topWellsContainer.visible = false
	expandTableIcon.visible = false
	backNavContainer.visible = true
# 	expandTableIcon.x = tableWidth - 20

animateKPI = () ->
	wellNumber = new countup("wellCountVal", 0, Utils.randomNumber(10, 180), 0, 2, options)
	wellNumber.start()
	liquidNumber = new countup("liquidCountVal", 0, Utils.randomNumber(1000, 100000), 0, 2, options)
	liquidNumber.start()
	oilNumber = new countup("oilCountVal", 0, Utils.randomNumber(1000, 50000), 0, 2, options)
	oilNumber.start()
	waterNumber = new countup("waterCountVal", 0, Utils.randomNumber(1000, 100000), 0, 2, options)
	waterNumber.start()
	gasNumber = new countup("gasCountVal", 0, Utils.randomNumber(1000, 50000), 0, 2, options)
	gasNumber.start()
	alertsNumber = new countup("alertsCountVal", 0, Utils.randomNumber(1, 50), 0, 2, options)
	alertsNumber.start()
	alertsNumber = new countup("alertsCountVal2", 0, Utils.randomNumber(1, 50), 0, 2, options)
	alertsNumber.start()
	
animateDashboardContent = () ->
	animateKPI()
	
	Utils.delay 0.2,->
		timeseriesContainer.animate
			opacity: 1
			options:
				time: 0.2
				curve: easeOutQuart
		
		Utils.delay 0.2,->
			timeseriesChart = createHighChart(defaultFontColor,"timeseriesContainer") #timeseriesChart = 
	
		tableContainer.animate
			opacity: 1
			y: headerBar.height + kpisContainer.height + timeseriesContainer.height
			options:
				time: 0.5
				curve: easeOutQuart
		drawDashboardTable()
	
		buildTopWellsInit(10)
		animateTopWells()
#NOTIFICATIONS 
notificationPage = findPageIndex("Notifications")

#Notification Attributes
xStart = 890
yStart = 85
cardWidth = 375
cardHeight = 160
cardHeight_shrink = 110 
gutterSize = 10

maxOnScreenNotifications = 3
triggerCount = 0 
banners = [] 

####################
#Notification Inbox#
####################

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
	visible: false
# 	image: "images/Notifications/inbox_shape.svg"

notification_inbox.states = 
	on:
		opacity: 1
		visible: true
		options: 
			curve: easeOutQuart
			time: 0.2
	off:
		opacity: 0
		visible: false
		options: 
			curve: easeOutQuart
			time: 0.1
					
inbox_header = new Layer
	parent: notification_inbox
	image: "images/Notifications/inbox_header.png"
	width: 370
	height: 55

inbox_header.onMouseOver ->
	document.body.style.cursor = "pointer"
inbox_header.onMouseOut ->
	document.body.style.cursor = "auto"
	
inbox_header.onClick ->
	pageIndex = findPageIndex("Notifications")
	setPageToActive(pageIndex)
	
inbox_progress_bg = new Layer
	parent: notification_inbox
	y: 50
	width: 370
	height: 30
	backgroundColor: grey01
	opacity: 1
	
inbox_progress = new Layer
	parent: notification_inbox
	y: 50
	width: 0
	height: 30
	backgroundColor: "#3B5B6C"
	opacity: 1
	
inbox_progress_text = new TextLayer
	parent: notification_inbox
	text: "ALL NOTIFICATIONS LOADING..."
	fontSize: 12
	font: "GE Inspira Sans"
	x: 14
	y: 60
	height: 12
	color: white
	
	
inbox_progress.states = 
	default:
		width: 0
		opacity: 1
		options:
			time: 0.3
			curve: easeOutQuart
	loading:
		width: 370
		opacity: 1
		options:
			time: 1
			curve: easeOutQuart
	endLoading:
		opacity: 1
		options:
			time: 0.2
			curve: easeOutQuart
	
inbox_contentScroll = new ScrollComponent
	parent: notification_inbox
	width: inbox_width
	height: inbox_height - inbox_header.height - 30
	y: 80
	backgroundColor: "transparent"
	scrollHorizontal: false
	mouseWheelEnabled: true

# ROW TOGGLE
toggleExpand_inbox = (layer, distance) ->
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
	
	for sib in layer.siblings
		newY = sib.y + distance
		if sib.y > layer.y
			sib.animate
				y: newY
				height: sib.height
				options:
					curve: Bezier.easeIn
					time: 0.2
				
	layer.expanded = !layer.expanded
	 
delayLoader = (layer, index) ->
  Utils.delay 0.1 * (index+5), ->
#     layer.loaded()
    layer.img.animate
      opacity: 1
#       y: 110 * index
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
			y: 110 * i
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
			opacity: 1
# 			image:"images/Notifications/inbox_banner/icons/" + randomNum + "_icons.svg"
			backgroundColor: "#eeeeee"
	
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
			opacity: 1
			backgroundColor: "#eeeeee"
		
		#Provide placeholder for these layers
# 		inbox_content_text.placeholder
# 			customElement: customPlaceholder

# 		inbox_banner.placeholder
# 			depth: 1
					
		inbox_content.push(inbox_banner)	
			
		inbox_banner.onClick ->
			#toggleExpand
			toggleExpand_inbox(@, 50)
	
		inbox_banner.actions.onMouseOver ->
			document.body.style.cursor = "pointer"
		inbox_banner.actions.onMouseOut ->
			document.body.style.cursor = "auto"
		inbox_banner.actions.onClick ->
			resetOnScreenNotificationBanners()
			notification_inbox.stateCycle("on", "off")
			
			#navigateToNotificationHistory
			pages[notificationPage].animate("active")
			pages[notificationPage].bringToFront()
			
			appDrawerContainer.bringToFront()
			 
			Utils.delay 1, ->
				scaleDown(notificationPage)
					
			animateAllPagesToDefault()
			
			animateSearchComponents(false)
			animateListViewComponents(true)
			
animateNotificationInbox = (state) ->
	if state == "in"
		inbox_progress.animate("loading")
		inbox_progress.onAnimationEnd ->
			inbox_progress.animate("endLoading")
			for i in [0...inbox_content.length]	
				delayLoader(inbox_content[i], i)
				
			inbox_progress_text.text = "ALL NOTIFICATIONS"
			
	if state == "out"
		inbox_progress.animate("default")

########################
# Notification Banners #
########################

## Methods/Functions
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
				curve: easeOutQuart
				time: 0.5
		}
		animateIn:{
			opacity: 1
			x: xStart
			options:
				curve: easeInOutQuad
				time: 0.3
		}
	
	banners[currentTriggerCount].onMouseOver ->
		document.body.style.cursor = "pointer"
	banners[currentTriggerCount].onMouseOut ->
		document.body.style.cursor = "auto"
	banners[currentTriggerCount].onClick ->
		resetOnScreenNotificationBanners()
		
		#navigateToNotificationHistory
		pageIndex = findPageIndex("Notifications")
		setPageToActive(pageIndex)
		
		notification_inbox.stateCycle("on", "off")
		
		pages[pageIndex].animate("active")
		pages[pageIndex].bringToFront()
		
		appDrawerContainer.bringToFront()
		 
		Utils.delay 1, ->
			scaleDown(pageIndex)
				
		animateAllPagesToDefault()
		
		animateListViewComponents(true) 
		
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
					newOpacity = 1
					newScale = 1
					
					banners[i].animate
						y: newYpos
						options:
							curve: easeOutQuart
							time: 0.4
							
					updateBannerAttribute(i,xStart, newYpos, newOpacity, newScale)
			else # maxOnScreenNotifications was hit, start stacking
				stackTill = triggerCount - maxOnScreenNotifications + 1
				for i in [0...stackTill+1]
					#stack it
					newYpos = yStart + (2 * (cardHeight + gutterSize + 10) - (10 * i)) 
					
					newOpacity = 1
					
					if triggerCount - i > maxOnScreenNotifications + 1
						newOpacity = 0
					
					newScale = Utils.modulate(triggerCount-i, [0,5], [1,0.9], 1)
					
					banners[i].animate
						y: newYpos
						scale: newScale
						opacity: newOpacity
						options:
							curve: easeOutQuart
							time: 0.4
					
					updateBannerAttribute(i,xStart, newYpos, newOpacity, newScale)
					
				for j in [stackTill+1...triggerCount]
					#push the second latest one down by 1 (shift)
					newYpos = yStart + (cardHeight + gutterSize)
					newOpacity = 1
					newScale = 1
					
					banners[j].animate
						y: newYpos
						options:
							curve: easeOutQuart
							time: 0.4
							
					updateBannerAttribute(j,xStart, newYpos, newOpacity, newScale)
					
		triggerCount++		
	## Reserving 'Q' to dismiss all  notifications
	if (e.keyCode is 81)
		resetOnScreenNotificationBanners()

resetOnScreenNotificationBanners = () ->
	for i in [banners.length-1...-1]
			banners[i].animate("directionalFadeOut")
				
		banners = []
		triggerCount = 0

##########################
# Notification List View #
##########################
Notifications.parent = pages[notificationPage].content
notification_facetFrame.parent = pages[notificationPage].content
notification_contentFrame.parent = pages[notificationPage].content
notifications_subHeader.parent = pages[notificationPage].content

#FACETED PANEL

facetWidth = 240

notificationFacetContainer = new Layer
	parent: notification_facetFrame
	width: notification_facetFrame.width 
	height: 960
	backgroundColor: null
	
drawNotificationFacetedPanel = () ->
	notificationFacetContainer.selectedTags = new Layer
		parent: notificationFacetContainer
		color: defaultFontColor
		backgroundColor: null
	notificationFacetContainer.selectedTags.html = '<section class="selectTag">
		<p>SELECTED TAGS</p>
		<p class="pill">ESP<span class="close"></span></p>
		<p class="pill">Total Liquid<span class="close"></span></p>
		<p class="pill">Oil Production<span class="close"></span></p>
		<p class="pill">BBL/Day<span class="close"></span></p>
		</section>'
			
	notificationFacetContainer.type = new Layer
		parent: notificationFacetContainer
		color: defaultFontColor		
		backgroundColor: null
		y: 140
	notificationFacetContainer.type.html = '<section>
		<p>NOTIFICATION TYPE</p>
		<ul>
			<div class="check-wrapper">
				<input type="checkbox"><label>ALL</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Alerts</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Cases</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Recommendations</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Others</label>
			</div>
		</ul>
		<a class="more-btn">more</a>
		</section>'
		
			
	notificationFacetContainer.kpis = new Layer
		parent: notificationFacetContainer
		color: defaultFontColor
		backgroundColor: null
		y: 400
	notificationFacetContainer.kpis.html = '<section>
		<p>KPIS</p>
		<form>
			<div class="check-wrapper">
				<input type="checkbox"><label>Total Liquid</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Oil Prodction</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Water Prodcution</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Gas Produciton</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Uptime</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Water Cut</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Operational Expenditure</label>
			</div>
		</form>
		<a class="more-btn">more</a>
		</section>'
		
	notificationFacetContainer.applyBtn = new Layer
		parent: notificationFacetContainer
		x: 15
		y: notificationFacetContainer.height - 150
		width: 215
		height: 40
		backgroundColor: blue04
		opacity: 0.5
	applyBtnText = new TextLayer
		parent: notificationFacetContainer.applyBtn
		text: "APPLY"
		width: 215
		y: 12
		color: white
		textAlign: "center"
		font: "400 15px/1 -apple-system, GE Isnpira Sans"
	
	notificationFacetContainer.applyBtn.onClick ->
		trimNotificationDataRandomly()
		
	notificationFacetContainer.applyBtn.onMouseOver ->
		document.body.style.cursor = "pointer"
	notificationFacetContainer.applyBtn.onMouseOut ->
		document.body.style.cursor = "auto"
			
notificationFacetContainer.onClick ->
	notificationFacetContainer.applyBtn.animate
		opacity: 1

#------------------------------#
#      LIST VIEW         	   #
#------------------------------#
listViewScroll = new ScrollComponent
	parent: notification_contentFrame
	width: notification_contentFrame.width
	height: 960
	opacity: 0
	
listViewScroll.scrollHorizontal = false
listViewScroll.contentInset = bottom: 100
listViewScroll.mouseWheelEnabled = true

#------------------------------#	
#          SCROLL BAR          #
#------------------------------#
scrollBar = new SliderComponent 
	parent: listViewScroll.content
	width: 10, height: listViewScroll.height - 10
	x: listViewScroll.width - 10
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
listViewScroll.on Events.Move, ->	
	scrollBar.value = Utils.modulate(listViewScroll.scrollY, [0, listViewScroll.content.height - listViewScroll.height], [0, 100], true)
	
updatePosition = -> 	
	scrollValue = Utils.modulate(scrollBar.value, [0, 100], [0, listViewScroll.content.height - listViewScroll.height], true)
	listViewScroll.scrollY = scrollValue

scrollBar.onMouseDown ->
	@on "change:value", updatePosition
			
scrollBar.onMouseUp -> 
	@off "change:value", updatePosition
	
#------------------------------#	
#          DATA TABLE          #
#------------------------------#
n_resultsLabel = new TextLayer
	parent: listViewScroll.content
	x: 20
	text: "ALL RESULTS"
	fontSize: 12
	fontFamily: "GE Inspira Sans"
	color: defaultFontColor
	opacity: 0
	
n_resultsTableContainer = new Layer
	parent: listViewScroll.content
	color: defaultFontColor
	width: notification_contentFrame.width, height: notification_contentFrame.height
	x: 20
	y: 60
	backgroundColor: white
	
rowContent = []
			
drawListView = (b_index, end_index) ->
	for i in [b_index...end_index]
		rowContent[i] = new Layer
			parent: n_resultsTableContainer
			width: notification_contentFrame.width, height: 60
			y: 10 + (82 * i + 1)
			backgroundColor: null #"transparent" #blue02
			shadowColor: blue04 #?
			shadowY: 1
			opacity: 0
		
		rowContent[i].assetName = notificationsData[i].notificationName
		rowContent[i].tags = notificationsData[i].notificationContent

		iconEntry = new Layer
			parent: rowContent[i]
			x: 15
			y: 10
			width: 40, height: 40 
			image: "images/Notifications/icons/" + Math.floor(Utils.randomNumber(1,5)) + ".svg"
			
		rowContent[i].assetNameEntry = new TextLayer
			parent: rowContent[i]
			x: iconEntry.x + iconEntry.width + 15, y: 10
			text: notificationsData[i].notificationName
			fontSize: 18
			fontFamily: "GE Inspira Sans"
			color: defaultFontColor
		
		rowContent[i].assetTags = new Layer
			parent: rowContent[i]
			width: notification_contentFrame.width - 50
			x: iconEntry.x + iconEntry.width + 15, y: 35
			backgroundColor: null
			color: black
			html: '<div style="font-size:12px; font-family:GE Inspira Sans; padding: 0 0; line-height: 1.3;"><span>' + notificationsData[i].notificationContent + '</span></div>'
			
		overflowIcon = new Layer
			parent: rowContent[i]
			width: 14, height: 13
			x: n_resultsTableContainer.width - 35, y: 18
			backgroundColor: null
		overflowIcon.html = """
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
		runAnalysisBtn = new Layer
			parent: rowContent[i]
			width: 100, height: 35
			x: n_resultsTableContainer.width - 170, y: 14
			backgroundColor: blue04
			html: "Run Analysis"
			borderColor: blue01 #?
			borderWidth: 1
			color: white
		runAnalysisBtn.style =
			fontSize: "14px"
			fontFamily: "GE Inspira Sans"
			padding: "3px 0 0 12px"
# 			color: "white"
		
		rowContent[i].states =
			display:
				opacity: 1
				y: 0 + (62 * i + 1)
				options:
					delay: 0.02 * i
					curve: easeOutQuart
					time: 0.2
			hide:
				opacity: 0
# 				y: 5 + (62 * i + 1)
				options:
					curve: easeOutQuart
					time: 0.1
					
		runAnalysisBtn.on Events.MouseOver, (event, layer) ->
			document.body.style.cursor = "pointer"
			this.backgroundColor = blue03
			
		runAnalysisBtn.on Events.MouseOut, (event, layer) ->
			document.body.style.cursor = "auto"
			this.backgroundColor = blue04
		
		runAnalysisBtn.on Events.Click, (event, layer) ->
			pageIndex = findPageIndex("Analysis")
			setPageToActive(pageIndex)
			AnalysisAnimation(true, "NOTIFICATION","OPTIMIZATION")
		#-------------------------------------#	
		#          ROW HOVER ACTIONS          #
		#-------------------------------------#
		rowContent[i].on Events.MouseOver, (event, layer) ->
			document.body.style.cursor = "pointer"
			this.backgroundColor = highlightColor
			if darkMode is false  #for light mode only change font color on hover
				this.assetTags.color = white
				this.assetNameEntry.color = white
			
		rowContent[i].on Events.MouseOut, (event, layer) ->
			document.body.style.cursor = "auto"
			this.backgroundColor = bgColor
			
			this.assetTags.color = defaultFontColor
			this.assetNameEntry.color = defaultFontColor
					
#Animation
animateListViewComponents = (display) ->
	
	if display
		drawNotificationFacetedPanel()
		
		notification_facetFrame.animate
			opacity: 1
			y: 0
			options: 
				curve: easeOutQuart
				time: 2
				
		notifications_subHeader.animate
			opacity: 1
			options:
				curve: easeOutQuart
				time: 0.5
				
		listViewScroll.animate
			opacity: 1
			y: 0 
			options: 
				curve: easeOutQuart
				time: 0.5
				
		n_resultsTableContainer.animate
			y: 0
			options: 
				curve: easeOutQuart
				time: 0.5
			
		# TABLE STACKING
		rowContent[0].animate
			opacity: 1
			y: 10 + (62 * 0 + 1)
			options:
				curve: easeOutQuart
				time: 0.5
		Utils.delay 0.2, -> 
			rowContent[1].animate
				opacity: 1
				y: 10 + (62 * 1 + 1)
				options:
					time: 0.5
					curve: easeOutQuart
		Utils.delay 0.3, ->
			for j in [2...rowContent.length]
				rowContent[j].animate
					opacity: 1
					y: 10 + (62 * j + 1)
					options:
						curve: easeOutQuart
						time: 0.5
	else
		notification_facetFrame.animate
				opacity: 0
				options: 
					curve: Bezier.easeIn
					time: 0.3
				
		notifications_subHeader.animate
			opacity: 2
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.2
				
		listViewScroll.animate
			opacity: 0
			options: 
				curve: Bezier.easeInOut
				time: 0.2
				
		n_resultsTableContainer.animate
			y: 60
			options: 
				curve: Bezier.easeIn
				time: 0.2
			
		# TABLE STACKING
		Utils.delay 0.1, ->
			for j in [0...rowContent.length]
				rowContent[j].animate
					opacity: 0
					y: 10 + (82 * j + 1)
					options:
						delay: 0.1 * j
						curve: Bezier.easeInOut
						time: 0.1

#Data Trim
trimNotificationDataRandomly = () ->
	indexToBeRemove = Math.floor(Utils.randomNumber(0,notificationsData.length))
	rangeTobeRemove = Math.floor(Utils.randomNumber(2, notificationsData.length/4))
		
	if indexToBeRemove+rangeTobeRemove < notificationsData.length
		for i in [indexToBeRemove...indexToBeRemove+rangeTobeRemove]
			rowContent[i].animate("hide")
	
		notificationsData.splice(indexToBeRemove,rangeTobeRemove)
		rowContent.splice(indexToBeRemove,rangeTobeRemove)
	
		#Animate the updated y position after splicing data
		Utils.delay 0.2, ->
			for i in [indexToBeRemove...rowContent.length]
				rowContent[i].animate
					y: (62 * i + 1)
					options:
						curve: easeOutQuart
						time: 0.1
						

#Search
## Pages[3]
searchPage = findPageIndex("Search")

contentFrame.parent = pages[searchPage].content
subHeader.parent = pages[searchPage].content

#FACETED PANEL
facetFrame.parent = pages[searchPage].content

facetWidth = 240

facetContainer = new Layer
	parent: facetFrame
	y: 0
	width: facetFrame.width 
	height: 960
	backgroundColor: null
# 	opacity: 0
	
drawFacetedPanel = () ->
	facetContainer.selectedTags = new Layer
		parent: facetContainer
		color: defaultFontColor
		backgroundColor: null
	facetContainer.selectedTags.html = '<section class="selectTag">
		<p>SELECTED TAGS</p>
		<p class="pill">ESP<span class="close"></span></p>
		<p class="pill">Total Liquid<span class="close"></span></p>
		<p class="pill">Oil Production<span class="close"></span></p>
		<p class="pill">BBL/Day<span class="close"></span></p>
		</section>'
			
	facetContainer.type = new Layer
		parent: facetContainer
		color: defaultFontColor		
		backgroundColor: null
		y: 140
	facetContainer.type.html = '<section>
		<p>PUMPS</p>
		<ul>
			<div class="check-wrapper">
				<input type="checkbox"><label>ALL</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>ESP</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Rod Lift</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Plunger</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Gas Lift</label>
			</div>
		</ul>
		<a class="more-btn">more</a>
		</section>'
		
			
	facetContainer.kpis = new Layer
		parent: facetContainer
		color: defaultFontColor
		backgroundColor: null
		y: 400
	facetContainer.kpis.html = '<section>
		<p>KPIS</p>
		<form>
			<div class="check-wrapper">
				<input type="checkbox"><label>Total Liquid</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Oil Prodction</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Water Prodcution</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Gas Produciton</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Uptime</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Water Cut</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Operational Expenditure</label>
			</div>
		</form>
		<a class="more-btn">more</a>
		</section>'
	
	facetContainer.applyBtn = new Layer
		parent: facetContainer
		x: 15
		y: facetContainer.height - 150
		width: 215
		height: 40
		backgroundColor: blue04
		opacity: 0.5
	applyBtnText = new TextLayer
		parent: facetContainer.applyBtn
		text: "APPLY"
		width: 215
		y: 12
		color: white
		textAlign: "center"
		font: "400 15px/1 -apple-system, GE Isnpira Sans"
	
	facetContainer.applyBtn.onClick ->
		trimDataRandomly()
		
	facetContainer.applyBtn.onMouseOver ->
		document.body.style.cursor = "pointer"
	facetContainer.applyBtn.onMouseOut ->
		document.body.style.cursor = "auto"
			
facetContainer.onClick ->
	facetContainer.applyBtn.animate
		opacity: 1
		
trimDataRandomly = () ->
	indexToBeRemove = Math.floor(Utils.randomNumber(0,searchData.length))
	rangeTobeRemove = Math.floor(Utils.randomNumber(2, searchData.length/4))
		
	if indexToBeRemove+rangeTobeRemove < searchData.length
		for i in [indexToBeRemove...indexToBeRemove+rangeTobeRemove]
			searchRows[i].animate("hide")
	
		searchData.splice(indexToBeRemove,rangeTobeRemove)
		searchRows.splice(indexToBeRemove,rangeTobeRemove)
	
		#Animate the updated y position after splicing data
# 		Utils.delay 0.2, ->
		for i in [indexToBeRemove...searchRows.length]
			searchRows[i].animate
				y: 10 + (62 * i + 1)
				options:
					curve: easeOutQuart
					time: 0.2
						
								
#------------------------------#
#      LIST VIEW         	   #
#------------------------------#
searchResultsScroll = new ScrollComponent
	parent: contentFrame
	width: contentFrame.width 
	height: 960
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
	backgroundColor: bgColor
	
searchRows = []
			

drawSearchTableBuild = (b_index, end_index) ->
	for i in [b_index...end_index]
		searchRows[i] = new Layer
			width: contentFrame.width, height: 60
			y: 10 + (82 * i + 1) 
			backgroundColor: null #"transparent" #blue02
			parent: resultsTableContainer
			shadowColor: blue04 #?
			shadowY: 1
			opacity: 0
		
		searchRows[i].assetName = searchData[i].assetName
		searchRows[i].tags = searchData[i].tags
		
		searchRows[i].assetNameEntry = new TextLayer
			parent: searchRows[i]
			x: 15, y: 10
			text: searchData[i].assetName
			fontSize: 18
			fontFamily: "GE Inspira Sans"
			color: defaultFontColor
		
		searchRows[i].assetTags = new Layer
			parent: searchRows[i]
			width: contentFrame.width - 50
			x: 15, y: 35
			backgroundColor: null
			color: defaultFontColor
			html: '<div style="font-size:12px; font-family:GE Inspira Sans; padding: 0 0; line-height: 1.3;"><span>' + searchData[i].tags + '</span></div>'
			
		overflowIcon = new Layer
			parent: searchRows[i]
			width: 14, height: 13
			x: resultsTableContainer.width - 35, y: 18
			backgroundColor: null
		overflowIcon.html = """
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
		runAnalysisBtn = new Layer
			parent: searchRows[i]
			width: 100, height: 35
			x: resultsTableContainer.width - 170, y: 14
			backgroundColor: blue04
			html: "Run Analysis"
			borderColor: blue01 #?
			borderWidth: 1
			color: white
		runAnalysisBtn.style =
			fontSize: "14px"
			fontFamily: "GE Inspira Sans"
			padding: "3px 0 0 12px"
# 			color: "white"
		
		searchRows[i].states =
			display:
				opacity: 1
				y: 0 + (62 * i + 1)
				options:
					delay: 0.02 * i
					curve: easeInExpo
					time: 0.2
			hide:
				opacity: 0
# 				y: 5 + (62 * i + 1)
				options:
					curve: easeOutQuart
					time: 0.1
					
		runAnalysisBtn.on Events.MouseOver, (event, layer) ->
			document.body.style.cursor = "pointer"
			this.backgroundColor = blue03
			
		runAnalysisBtn.on Events.MouseOut, (event, layer) ->
			document.body.style.cursor = "auto"
			this.backgroundColor = blue04
		
		runAnalysisBtn.on Events.Click, (event, layer) ->
			pageIndex = findPageIndex("Analysis")
				
# 			setPageToActive(pageIndex)				
# 			pages[pageIndex].animate("active")
# 			pages[pageIndex].bringToFront()
# 			
# 			appDrawerContainer.bringToFront()
# 			
# 			animateSearchComponents(false)
# 			animateListViewComponents(false)
# 			
# 			AnalysisAnimation(true,"PRODUCTION", "OPTIMIZATION")
# 			 
# 			Utils.delay 1, ->
# 				scaleDown(pageIndex)
# 					
# 			animateAllPagesToDefault()
				
			pageIndex = findPageIndex("Analysis")
			setPageToActive(pageIndex)
			AnalysisAnimation(true, "SEARCH RESULT", "OPTIMIZATION")
			
		#-------------------------------------#	
		#          ROW HOVER ACTIONS          #
		#-------------------------------------#
		searchRows[i].on Events.MouseOver, (event, layer) ->
			document.body.style.cursor = "pointer"
			this.backgroundColor = highlightColor
			
			if darkMode is false  #for light mode only change font color on hover
				this.assetTags.color = white
				this.assetNameEntry.color = white
			
		searchRows[i].on Events.MouseOut, (event, layer) ->
			document.body.style.cursor = "auto"
			this.backgroundColor = bgColor
			
			this.assetTags.color = defaultFontColor
			this.assetNameEntry.color = defaultFontColor
				
#Animation
animateSearchComponents = (display) ->
	if display
		drawFacetedPanel()
		
		facetFrame.animate
			opacity: 1
			y: 0
			options: 
				curve: easeOutQuart
				time: 2
		subHeader.animate
			opacity: 1
			options:
				curve: easeOutQuart
				time: 0.5
		resultsTableContainer.animate
			y: 0
			options: 
				curve: easeOutQuart
				time: 0.5
		searchResultsScroll.animate
			opacity: 1
			options: 
				curve: easeOutQuart
				time: 0.5
					
		# TABLE STACKING
		searchRows[0].animate
			opacity: 1
			y: 10 + (62 * 0 + 1)
			options:
				curve: easeOutQuart
				time: 0.5
		Utils.delay 0.2, -> 
			searchRows[1].animate
				opacity: 1
				y: 10 + (62 * 1 + 1)
				options:
					curve: easeOutQuart
					time: 0.5
		Utils.delay 0.3, ->
			for j in [2...searchRows.length]
				searchRows[j].animate
					opacity: 1
					y: 10 + (62 * j + 1)
					options:
						curve: easeOutQuart
						time: 0.7
	else
		facetFrame.animate
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

Analysis_subHeader.parent = pages[analysisPage].content
analysisHeader.parent = pages[analysisPage].content
slider_bg.parent = pages[analysisPage].content

prevPageText = new TextLayer
	parent: Analysis_subHeader
	x: 20, y: 1
	width: 135
	height: 20
	text: "PREVIOUS PAGE"
	font: "GE Inspira Sans"
	color: highlightColor
	fontSize: 18
	fontFamily: "GE Inspira Sans"

currentPageText = new TextLayer
	parent: Analysis_subHeader
	x: prevPageText.width + 15, y: 1
	width: 125
	height: 21
	text: "CURRENT PAGE"
	font: "GE Inspira Sans"
	color: defaultFontColor
	fontSize: 18
	fontFamily: "GE Inspira Sans"

#              ANALYSIS             #
analysisContainer = new Layer
	parent: pages[analysisPage].content
	width: 1250, height: 850
	x: 15, y: headerBar.height + 60
	clip: true
	backgroundColor: null

#              A / B Counters             #
aFrequency = new Layer
	parent: analysisContainer
	width: 375, height: 30, x: 50, y: 30
	borderColor: blue05
	borderWidth: 1
	backgroundColor: null
	opacity: 0
	color: highlightColor
	html: '<div class="analysisLabel">Increase Frequency: 56.7Hz to 145 stb/d </div>'
	
bFrequency = new Layer
	parent: analysisContainer
	width: 375, height: 30, x: aFrequency.width + 100
	y: 10
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

curveContainer = new Layer
	parent: analysisContainer
	x: 0
	y: aFrequency.height + 60
	height: 240
	width: 1125
	backgroundColor: null
	opacity: 0 
	
#              SPLINE CHART CONTAINERS             #
vspCurveContainer = new Layer
	parent: curveContainer
	width: 375, height: 240, y: 0, x: 50
	backgroundColor: null
	image: "images/curves/vspCurve.svg"
vspCurveContainer.html = '<div id="vspCurveContainer" style="height:240px;"></div>'

gradientCurveContainer = new Layer
	parent: curveContainer
	width: 375, height: 240, y: 0, x: vspCurveContainer.width + 80
	backgroundColor: null
	image: "images/curves/gradientCurve.svg"
gradientCurveContainer.html = '<div id="gradientCurveContainer" style="height:240px;"></div>'

iprCurveContainer = new Layer
	parent: curveContainer
	width: 375, height: 240, y: 0, x: vspCurveContainer.width + gradientCurveContainer.width + 110
	backgroundColor: null
	image: "images/curves/iprCurve.svg"
iprCurveContainer.html = '<div id="iprCurveContainer" style="height:240px;"></div>'

#              SPLINE CHARTS             #
drawSplineCurves = () ->
	vspCurveChart = Highcharts.chart('vspCurveContainer',
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'spline', renderTo: '', marginLeft: 30, marginRight: 20, marginTop: 35, marginBottom: 20, backgroundColor: null}
		title: null 
# 		title: {text:'VARIABLE SPEED PERFORMANCE CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', color: defaultFontColor, fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: false, text: 'FLOW RATE (rb/d)', style: {color: defaultFontColor}}
		yAxis:
			title: {enabled: false, text: 'HEAD (ft)', style: {color: defaultFontColor}}
			labels: {enabled: false}
			tickInterval: 10
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
				animation: {
					duration: 500,
					easing: "easeInExpo"
				}
	)
	vspCurveContainer.onMouseOver ->
	vspCurveContainer.onMouseOut ->
		
	gradientCurveChart = Highcharts.chart('gradientCurveContainer',
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'spline', renderTo: '', marginLeft: 30, marginRight: 20, marginTop: 35, marginBottom: 25, backgroundColor: null}
		title: null
# 		title: {text:'GRADIENT CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', defaultFontColor, fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: false, text: 'PRESSURE (psig)', style: {color: defaultFontColor}}
		yAxis:
			title: {enabled: false, text: 'TRUE VERTICAL DEPTH (ft)', style: {color: defaultFontColor}}
			labels: {enabled: false}
			tickInterval: 10
# 			gridLineColor: gray
# 			lineColor: defaultFontColor
# 			lineWidth: 1
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
				animation: {
					duration: 500,
					easing: "easeInExpo"
				}
	)
	gradientCurveContainer.onMouseOver ->
	gradientCurveContainer.onMouseOut ->
	
	iprCurveChart = Highcharts.chart('iprCurveContainer',
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'spline', renderTo: '', marginLeft: 30, marginRight: 20, marginTop: 35, marginBottom: 20, backgroundColor: null}
		title: null 
# 		title: {text:'IPR CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', color: defaultFontColor, fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: false, text: 'FLOW RATE (stb/d)', style: {color: defaultFontColor}}
		yAxis:
			title: {enabled: false, text: 'FLOW PRESSURE (psia)', style: {color: defaultFontColor}}
			labels: {enabled: false}
			tickInterval: 10
# 			gridLineColor: gray
# 			lineColor: "white"
# 			lineWidth: 1
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
				animation: {
					duration: 500,
					easing: "easeInExpo"
				}
	)
	iprCurveContainer.onMouseOver ->
	iprCurveContainer.onMouseOut ->
# )

sliderContainer = new Layer
	parent: analysisContainer
	x: 110
	y: aFrequency.height + vspCurveContainer.height + 20
	backgroundColor: null
	width: 630 
	height: 150
	opacity: 0 

#              SURFACE FLOWRATE SLIDER             #
surfaceFlowrateSlider = new SliderComponent
	parent: sliderContainer
	x: 0, y: 180, width: 210, height: 5
	min: 0, max: 2000
# 	value: 1500
	knobSize: 20
surfaceFlowrateSlider.fill.backgroundColor = highlightColor
surfaceFlowrateSlider.backgroundColor = "#B6C3CC"
surfaceFlowrateSlider.borderRadius = 0

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
	parent: sliderContainer
	x: 0, y: surfaceFlowrateSlider.height + 270
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 800
	knobSize: 20
bottomholePressureSlider.fill.backgroundColor = highlightColor
bottomholePressureSlider.backgroundColor = "#B6C3CC"
bottomholePressureSlider.borderRadius = 0
# bottomholePressureSlider.animateToValue(800, {curve: Bezier.easeInOut, time: 0.5})

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
	parent: sliderContainer
	x: surfaceFlowrateSlider.width + 210, y: 180
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 1800
	knobSize: 20
motorTempSlider.fill.backgroundColor = red
motorTempSlider.backgroundColor = "#B6C3CC"
motorTempSlider.knob.color = defaultFontColor
motorTempSlider.knob.width = 2
motorTempSlider.knob.height = 20
# motorTempSlider.animateToValue(1800, {curve: Bezier.easeInOut, time: 0.5})

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
	parent: sliderContainer
	x: surfaceFlowrateSlider.width + 210
	y: surfaceFlowrateSlider.height + 270
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 500
	knobSize: 20
frequencySlider.fill.backgroundColor = lemon
frequencySlider.backgroundColor = "#B6C3CC"
frequencySlider.knob.color = "white"
frequencySlider.knob.width = 2
frequencySlider.knob.height = 20
# frequencySlider.animateToValue(500, {curve: Bezier.easeInOut, time: 0.5})

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
	parent: sliderContainer
	x: surfaceFlowrateSlider.width + bottomholePressureSlider.width + 410
	y: 180
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 1400
	knobSize: 20
wellheadPressureSlider.fill.backgroundColor = orange
wellheadPressureSlider.backgroundColor = "#B6C3CC"
wellheadPressureSlider.borderRadius = 0
wellheadPressureSlider.knob.color = "white"
wellheadPressureSlider.knob.width = 2
wellheadPressureSlider.knob.height = 20
# wellheadPressureSlider.animateToValue(1400, {curve: Bezier.easeInOut, time: 0.5})

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
	parent: sliderContainer
	x: surfaceFlowrateSlider.width + bottomholePressureSlider.width + 410
	y: 270
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 500
	knobSize: 20
intakePressureSlider.fill.backgroundColor = green
intakePressureSlider.backgroundColor = "#B6C3CC"
intakePressureSlider.borderRadius = 0
intakePressureSlider.knob.color = "white"
intakePressureSlider.knob.width = 2
intakePressureSlider.knob.height = 20
# intakePressureSlider.animateToValue(500, {curve: Bezier.easeInOut, time: 0.5})

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

animateSliders = () ->
	surfaceFlowrateSlider.animateToValue(1800, {curve: easeInExpo, time: 0.3})
	frequencySlider.animateToValue(800, {curve: easeInExpo, time: 0.3})
	intakePressureSlider.animateToValue(700, {curve: easeInExpo, time: 0.3})
	bottomholePressureSlider.animateToValue(900, {curve: easeInExpo, time: 0.3})
	motorTempSlider.animateToValue(1900, {curve: easeInExpo, time: 0.3})
	wellheadPressureSlider.animateToValue(1700, {curve: easeInExpo, time: 0.3})
	
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
		options: {curve: easeInExpo, time: 0.3}
	wellheadPressureSlider.animate
		value: surfaceFlowrateSlider.value / 1.5
		options: {curve: easeInExpo, time: 0.3}
	bottomholePressureSlider.animate
		value: surfaceFlowrateSlider.value / 1.5
		options: {curve: easeInExpo, time: 0.3}
	frequencySlider.animate
		value: surfaceFlowrateSlider.value * 1.1
		options: {curve: easeInExpo, time: 0.3}
	intakePressureSlider.animate
		value: surfaceFlowrateSlider.value * 1.2
		options: {curve: easeInExpo, time: 0.3}
		
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
		options: {curve: easeInExpo, time: 0.3}
	wellheadPressureSlider.animate
		value: bottomholePressureSlider.value / 1.5
		options: {curve: easeInExpo, time: 0.3}
	surfaceFlowrateSlider.animate
		value: bottomholePressureSlider.value / 1.5
		options: {curve: easeInExpo, time: 0.3}
	frequencySlider.animate
		value: bottomholePressureSlider.value * 1.1
		options: {curve: easeInExpo, time: 0.3}
	intakePressureSlider.animate
		value: bottomholePressureSlider.value * 1.2
		options: {curve: easeInExpo, time: 0.3}
		
	bottomholePressureSlider.knob.onDragEnd ->
		drawSplineCurves()

analysisSave = new Layer
	parent: analysisContainer
	width: 1165, height: 30, x: 50
	y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + bottomholePressureSlider.height + 400
	image: "images/analysis-save.png"

Analysis_subHeader.onMouseOver ->
	document.body.style.cursor = "pointer"
	
Analysis_subHeader.onMouseOut ->
	document.body.style.cursor = "auto"
	
Analysis_subHeader.onClick ->
	#animate out Anlysis page
	pages[analysisPage].animate
# 		opacity: 0
		scale: 0.98
		options:
			curve: easeOutQuart
			time: 0.2
			
	if (prevPageText.text == "PRODUCTION")
		pageIndex = findPageIndex("D_Dashboard")
		setPageToActive(pageIndex)
		
	else if (prevPageText.text == "SEARCH RESULT")		
		pageIndex = findPageIndex("Search")
		pages[pageIndex].animate("active")
		pages[pageIndex].bringToFront()
		appDrawerContainer.bringToFront()
		
		facetFrame.opacity = 1
		subHeader.opacity = 1
		
		searchResultsScroll.opacity = 1
		resultsTableContainer.y = 0
		
		for j in [0...searchRows.length]
			searchRows[j].y = 0 + (62 * j + 1)
			searchRows[j].opacity = 1
		
		Utils.delay 1, ->
			scaleDown(pageIndex)
				
		animateAllPagesToDefault()
	
	else if (prevPageText.text == "NOTIFICATION")
		pageIndex = findPageIndex("Notifications")
		setPageToActive(pageIndex)			
		animateListViewComponents(true)
		#BUG!!!!
## Analysis Animation
AnalysisAnimation = (display, prevPage, currentPage) ->
	if display
		##analysisHeader & slider_bg is manually drawn in design mode
		prevPageText.text = prevPage
		currentPageText.text = currentPage
			
		Analysis_subHeader.animate
			opacity: 1
			options:
				curve: easeOutQuart
				time: 0.5
		
		analysisHeader.animate
			opacity: 1
			options:
				curve: easeOutQuart
				time: 0.5
			
		Utils.delay 0.2, -> 
			aFrequency.animate
				opacity: 1
				y: 0
				options:
					curve: easeOutQuart
					time: 0.5
			bFrequency.animate
				opacity: 1
				y: 0
				options:
					curve: easeOutQuart
					time: 0.5
		Utils.delay 0.3, -> 			
			curveContainer.animate
				opacity: 1
				y: aFrequency.height + 40
				options:
					curve: easeOutQuart
					time: 0.5
			
			sliderContainer.animate
				opacity: 1
				y: aFrequency.height + vspCurveContainer.height
				options:
					delay: 0.1
					curve: easeOutQuart
					time: 0.7
			slider_bg.animate
				opacity: 1
				options:
					curve: easeOutQuart
					time: 0.7
					
			drawSplineCurves()		
		
		Utils.delay 0.5, ->
			animateSliders()
	
			
# 		analysisSave.animate
# 			opacity: 1
# 			options:
# # 				delay: 0.5
# 				curve: Bezier.easeInOut
# 				time: 1
	else
		##analysisHeader & slider_bg is manually drawn in design mode
		
		aFrequency.animate
			opacity: 0
			y: 30 
			options:
				curve: Bezier.easeInOut
				time: 0.1
		bFrequency.animate
			opacity: 0
			y: 30 
			options:
				curve: Bezier.easeInOut
				time: 0.1
		
		curveContainer.animate
			opacity: 0
			y: aFrequency.height + 60
			options:
				curve: Bezier.easeInOut
				time: 0.1		
		
		sliderContainer.animate
			opacity: 0
			y: aFrequency.height + vspCurveContainer.height + 20
			options:
				curve: Bezier.easeInOut
				time: 0.2
		slider_bg.animate
			opacity: 0
			options:
				curve: Bezier.easeIn
				time: 0.2
								
		surfaceFlowrateSlider.animate
			value: 0
		motorTempSlider.animate
			value: 0		
		wellheadPressureSlider.animate
			value: 0
		bottomholePressureSlider.animate
			value: 0				
		frequencySlider.animate
			value: 0
		intakePressureSlider.animate
			value: 0
				
# 		analysisSave.animate
# 			opacity: 0
# 			options:
# 				delay: 0.2
# 				curve: Bezier.easeInOut
# 				time: 0.2

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


#Override Dashboard placeholder with custom iframe
#Dashboard Scroll HTML iFrame
Dashboard_Scroll = "<iframe width='1280px' height='960px' src='https://github.build.ge.com/pages/212598191/component-prototypes/Scrolling/Pulse_AnchorScroll/index.html' frameborder='0' allowfullscreen></iframe>" 

Dashboard_Scroll_Page = new Layer #Need a nested pageComponent for section scroll
	parent: MWEOpageComp.content.children[0].content#.content #child of the scrollableComponent for Optimization View
	y: 0
	x: - 10
	width: 1280
	height: 960
	scrollHorizontal: false
	mouseWheelEnabled: true
	ignoreEvents: false
	html: Dashboard_Scroll
	

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
singleWellOptimization = "<iframe width='#{Screen.width}' height='960px' src='https://github.build.ge.com/pages/212598191/component-prototypes/Scrolling/SidebarScroll/scroll.html' frameborder='0' allowfullscreen></iframe>" 
	
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
# OptimizationPage.onScroll ->
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

#Loader
#Donkey Loader
percentNum = 0
transitionTime = 3 #seconds

##Scaling
screen_width = 1280#Screen.width#Framer.Device.screen.width
screen_height = 960#Screen.height#Framer.Device.screen.height

default_w = 960
default_h = 1280

ratio = screen_width/default_w

loader = new Layer
# 	parent: pages[loaderPage].content
	opacity: 0
	backgroundColor: darkBlue
	width: screen_width
	height: Screen.height

#Donkey

#Doneky Container
donkey = new Layer
	parent: loader
	x: screen_width/4
	y: screen_height/4
	width: default_w/2
	height: default_h/2
	scale: ratio * 0.3
	backgroundColor: darkBlue
	
donkey.states = 
	zeroOpaque:{
		opacity: 0
		animationOptions:{
			curve:"ease-out"
			time: 0.2	
		} 
	}
	fullOpaque:{
		opacity: 100
		animationOptions:{
			curve:"ease-in"
			time: 0.3	
		}
	}
	
##DonkeyBase
donkeyBase = new Layer
	parent: donkey
	image: "images/donkey/donkeyBase.svg"
	width: 415
	height: 230
	x: 180
	y: donkey.y	- 130

donkeyLine = new Layer
	parent: donkey
	width: 3
	height: donkeyBase.height + 10
	backgroundColor: white
	x: donkey.x/2 + 90
	y: donkey.y - 140

donkeyWeight = new Layer
	parent: donkeyLine
	width: 10
	height: 60
	borderRadius: 5
	y: 100
	x: -3
	backgroundColor: white

donkeyWeight.states = 
	up:{
		y: 80
		animationOptions:
			curve:Bezier.easeOut
			time: 1
	}
	down: {
		y: 100
		animationOptions:
			curve:Bezier.easeIn
			time: 1
	}
	
##DonkeyTop
donkeyTop = new Layer
	parent: donkey
	image: "images/donkey/donkeyTop.svg"
	width: 310
	height: 145
	x: donkey.x/2 + 80
	y: donkey.y/2 - 100
	rotate: 0
	
donkeyTop.states = 
	default:{
		rotation: 0
		animationOptions:
			curve:Bezier.easeOut
			time: 1
	}
	rotate:{
		rotation: -10
		animationOptions:
			curve:Bezier.easeIn
			time: 1
	}
	
offSet = 30
yOffset = 120

percentLoaded = new TextLayer
	parent: loader
	text: percentNum + "%"
	color: white
	fontSize: 20
	x: donkeyBase.x + donkey.width - 50
	y: donkey.height - 60
	opacity: 1
	font: "GE Inspira Sans"
	
	#animate the loader after drawing 
# 	animateLoader(0.09)
	
#Utility Helper Functions
##Clock
interval = null 

startInterval = (pace)->
	interval = Utils.interval pace, ->
		percentNum += 1
		percentLoaded.text = percentNum + "%"
		
stopInterval = ->
	clearInterval(interval)
	percentNum = 0

animateLoader = (pace_) ->
	pace = pace_
	stopPoint = pace_ * 99 + pace
	
	loader.visible = true
	percentLoaded.visible = true
	donkey.visible = true
		
	loader.opacity = 1
	percentLoaded.opacity = 1
	donkey.opacity = 1

	startInterval(pace_)
	
	donkeyWeight.stateCycle("down", "up")
	donkeyTop.stateCycle("rotate", "default")
	donkeyTop.onAnimationEnd -> 
		donkeyWeight.stateCycle("down", "up")
		donkeyTop.stateCycle("rotate", "default")
	
	Utils.delay stopPoint, ->
# 		animateDashboardContent()
		
		stopInterval(interval)
		loader.animate
			opacity: 0
			animationOptions:{
				time: 0.1
			}
		
		percentLoaded.animate
			opacity: 0
			animationOptions:{
				curve:"ease-out"
				time: 0.2	
			} 
		donkey.animate("zeroOpaque")
		
		Utils.delay 0.2, ->
# 		donkey.onAnimationEnd ->
# 			animateDashboardContent()
			
		Utils.delay 1.0, ->
			loader.visible = false
			percentLoaded.visible = false
			donkey.visible = false
		
		

# Main #

# animateLoader(0.05)
# Utils.delay (0.02*100),->
animateDashboardContent()

createNotificationInboxContent(5)

drawSearchTableBuild(0,searchData.length)
drawListView(0,notificationsData.length)


 


