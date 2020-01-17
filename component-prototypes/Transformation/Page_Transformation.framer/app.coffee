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
#Asset Toggle
assetContainer = new Layer
	parent: pageComp
	y: headerBar.y + headerBar.height
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
	parent: pageComp
	y: headerBar.y + headerBar.height + assetContainer.height
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
		
		breadcrumbItem.page = pages[i]
		
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
					pages[i].animate("default")
			
			@page.animate("active")
			pageComp.snapToPage(@page)
			
			if this.name == "Optimization"
				OptimizationPage.visible = true
				SingleWell_iframe.visible = false					
#Page Component
#This whole app is a giant pageComponent
pageComp = new PageComponent
	parent: IntelliStream_App
	y: headerBar.y + headerBar.height + breadCrumbContainer.height + assetContainer.height
# 	width: default_w
# 	height: default_h
# 	scale: ratio
	originY: 0
	width: 1280
	height: 900
# 	width: Screen.width
# 	height: Screen.height
	backgroundColor: bgColor
# 	scrollVertical: false
	scrollHorizontal: false
	mouseWheelEnabled: true
# pageComp.center()
pages = []

createPageComp = (num) ->
	for i in [0...num]
		# creating pages
		page = new ScrollComponent
			size: pageComp.size
# 			width: 1280
# 			height: Screen.height
			backgroundColor: bgColor
			x: 100 * i 
# 			x: pageComp.width * i
			y: 0
			parent: pageComp.content
			name: BreadcrumbStrings[i]
			scale: 0.9
			opacity: 0
			scrollHorizontal: false
			mouseWheelEnabled: true
			
		page.scrollHorizontal = false
# 		if i == 2
# 			OptimizationPage = new PageComponent #Need a nested pageComponent for section scroll
# 				parent: pageComp.content #.children[2].content #child of the scrollableComponent for Optimization View
# 				width: 1280
# 				height: 730
# 				scrollHorizontal: false
# 				mouseWheelEnabled: true
# 			createModifiedOptimizationView(3,OptimizationPage)
# 		else
		pageContent = new Layer
			parent: page.content
			name: BreadcrumbStrings[i] + "pageContent"
# 			size: pageComp.size
# 			scale: ratio
			width: pageComp.width
			height: 1700
			image: "images/page_placeholders/" + BreadcrumbStrings[i] + ".png"
		page.states = 
			default:
# 				x: pageComp.width * i + 100  
				scale: 0.9
				opacity: 0
				options:
					curve: Bezier.easeInOut
					time: 0.2 * i
			active:
# 				x: pageComp.width * i
				opacity: 1
				scale: 1
				options: 
					curve: Bezier.easeInOut
					time: 0.2 * i
# 					time: 0.2
			
		pages.push(page)
		
#changing active on page scroll
pageComp.onChange "currentPage", ->
	page.states.switch("default") for page in pages
	current = pageComp.horizontalPageIndex(pageComp.currentPage)
	selectedCrumb = pageComp.currentPage.name
	pages[current].states.switch("active")
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
			pages[i].animate("default")
			

createPageComp(BreadcrumbStrings.length)
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
		parent: pageComp.content.children[2]
		height: 90
		width: pageComp.content.children[2].width
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
	parent: pageComp.content.children[2]#.content #child of the scrollableComponent for Optimization View
	y: 90
	width: 1280
	height: 570
	scrollHorizontal: false
	mouseWheelEnabled: true
	
clickThroughAction = new Layer
		parent: pageComp.content.children[2]
		height: 90
		y: pageComp.content.children[2].height - 90
		width: pageComp.content.children[2].width
		backgroundColor: grey01
		opacity: 0.5
		
createModifiedOptimizationView = (num, parent) ->
	pageComp.content.children[2].children[0].opacity = 0
	
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
	pageComp.content.children[2].children[1].opacity = 1
		
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

pageComp.content.children[2].onScrollEnd ->
# 	print "onScrollEnd!"
createModifiedOptimizationView(3) #Create this modified view

SingleWell_iframe = new Layer
	parent: pageComp.content.children[2]#.content #child of the scrollableComponent for Optimization View
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
# 	SingleWell_iframe.animate
# 		opacity: 1
# 		options: 
# 			curve: Bezier.easeInOut
# 			time: 0.2

#Main()

#select Dashboard by default
pages[0].animate("active")
selectedCrumb = "Dashboard"
Breadcrumb[0].backgroundColor = crumbSelected
pageComp.snapToPage(pages[0])
pageComp.content.children[0].states.switchInstant "active"

