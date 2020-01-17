# SETTINGS
{DynamicLoader} = require "DynamicLoader"
InputModule = require "input"
FontAwesome = require 'FontAwesome'

# exports.mapboxgl = require "mapbox-gl"
# {mapboxgl} = require "npm"
document.body.style.cursor = "auto"
Framer.Defaults.Layer.force2d = true
Framer.Extras.Hints.enable()

highCharts = ['//code.highcharts.com/highcharts.js','//code.highcharts.com/modules/data.js','//code.highcharts.com/modules/exporting.js','//code.highcharts.com/highcharts-more.js']
	
# Responsive Screen
default_w = 1280
default_h = 1060

ratio = Screen.width/default_w

Framer.Defaults.Layer.force2d = true

# ANIMATION CURVES
animateIn = "spring(750,60,50)"
animateOut = "spring(750,65,30)"


white = "#FFFFFF"
black = "#000000"

# BLUE SHADES
blue01 = "#0D1418" # background dark
blue02 = "#012939" # header
blue03 = "#065769"
blue04 = "#09819C"
blue05 = "#8BD6FF"

blue06 = "#006F87" # Global overlay color
# BASE COLORS
blue = '#00CCFF'
green = '#33FF00'
lemon = "#C5FF00"
yellow = '#FFC107'
red = "#ED2B2A"
orange = "#FF7900"
gray = "#555555"

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

# Dark/Light mode tracking
darkMode = true 
bgColor = white
defaultFontColor = black


Screen.backgroundColor = bgColor
#Header
logo.onClick ->
	pages[0].animate("active")
# 	pageComp.snapToPage(pages[0])
			
	pages[1].animate("default")
	pages[2].animate("default")
	appDrawerContainer.animate("stateB")
	
	
notification.onClick ->
	pages[2].animate("active")
# 	pageComp.snapToPage(pages[2])
	
	pages[0].animate("default")
	pages[1].animate("default")
	
	appDrawerContainer.animate("stateB")
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

	pages[0].animate("active")
# 	pageComp.snapToPage(pages[0])
	
	pages[1].animate("default")
	pages[2].animate("default")
		
	appDrawerContainer.animate("stateB")
				
appDrawerApps.on Events.Click, ->
	
	pages[1].animate("active")
# 	pageComp.snapToPage(pages[1])
	
	pages[0].animate("default")	
	pages[2].animate("default")
	appDrawerContainer.animate ("stateB")
	
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
pageNames = [
	'Dashboard',
	'MWEO',
	'Notifications'
]
pageComp = new PageComponent
	parent: IntelliStream_App
	y: headerBar.y + headerBar.height
	originY: 0
	width: 1280
	height: 1187
	backgroundColor: bgColor
	scrollHorizontal: false
	mouseWheelEnabled: true
	
pages = []

createPageComp = (num) ->
	for i in [0...num]
		# creating pages
		page = new ScrollComponent
			size: pageComp.size
			backgroundColor: bgColor
			x: 0
			y: 0
			parent: pageComp.content
			name: pageNames[i]
			opacity: 0
			scrollHorizontal: false
			mouseWheelEnabled: true
			
		page.scrollHorizontal = false
		
		pageContent = new Layer
			parent: page.content
			name: pageNames[i]
			width: pageComp.width
			height: pageComp.height
			image: "images/page_placeholders/" + pageNames[i] + ".png"
			
		page.states = 
			default:
				opacity: 0
				options:
					curve: Bezier.easeInOut
					time: 0.5
			active:
				opacity: 1
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
pageComp.snapToPage(pages[0])
pageComp.content.children[0].states.switchInstant "active"

#Add Content after creating page component

