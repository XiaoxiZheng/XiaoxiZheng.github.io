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
default_h = 960

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

blackStatus = "#143D4A"
greyStatus = "#575E66"

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
#Vertical Scroll Steps
#Steps
stepLineLength = 70
stepLineWidth = 7
dotWidth = 7
dotHeight = 1
steps = []

scrollBarDescriptions = [
	'Upload File',
	'Wellbore Geometry',
	'Production & Constraints',
	'Financial Information',
	'Decline Curve Analysis',
	'Generate Well Plan'
]
#Helper Functions
calcContainerWidth = (length) -> #calc individual containerWidth
	if length < 0
		return 0 
	containerWidth = 20 + (8 * (length - 2)) #10px capital letter + 8px per lower case
# 	containerWidth = 2 * breadCrumbPadding + iconWidth + 5 + fontSize
	return containerWidth
	
createScrollBar = (num) ->
	stepsContainer = new Layer
		parent: IntelliStream_App
		x: IntelliStream_App.width - 30 #margin
		y: headerBar.y + headerBar.height + 110 #padding
		height: 390
		width: 151
		backgroundColor: null
	
	for i in [0...num]
		stepItem = new Layer
			parent: stepsContainer
			height: 70
# 			width: stageLineWidth + stageDotWidth
			backgroundColor: null
			name: scrollBarDescriptions[i]
			 					
		dot = new Layer #using dot as alias for the vertical lines
			parent: stepItem
			name: scrollBarDescriptions[i]
			width: stepLineWidth
			height: stepLineLength
			y: (stepLineLength + 10 + dotHeight ) * i
			borderWidth: 1
			borderColor: blackStatus
			borderRadius: 0
			backgroundColor: blackStatus
		
# 		stepDescriptionWidth = calcContainerWidth(scrollBarDescriptions[i].length)
		
		stepDescription = new TextLayer
			parent: stepItem
			text: scrollBarDescriptions[i]
			fontFamily: "GE Inspira Sans"
			fontSize: 15
			width: 170 #stepDescriptionWidth
			y: (stepLineLength + 10 + dotHeight ) * i
			x: dot.x - 15 - 170
			textAlign: "right"
			color: black
			
		if i < num-1
			line = new Layer #using line as an alias for dots
				parent: stepItem
				y: dot.y + dot.height + 5
				height: 1
				width: stepLineWidth
				backgroundColor: blackStatus
		
		dot.section = pageCompSections[i]
			
		steps.push(stepItem)
		
		#Step states
		dot.states = 
			active:
				backgroundColor: white #Fill in the dot
				options: 
					curve: Bezier.easeIn
					time: 0.1
			inactive:
				backgroundColor: blackStatus
				options: 
					curve: Bezier.easeIn
					time: 0.1
			complete:
				backgroundColor: blackStatus
				options: 
					curve: Bezier.easeIn
					time: 0.1
		stepDescription.states = 
			active:
				color: black
# 				fontStyle: "bold"
				fontSize: 15
				options: 
					curve: Bezier.easeIn
					time: 0.1
			inactive:
				color: greyStatus
# 				fontStyle: "regular"
				fontSize: 12
				options: 
					curve: Bezier.easeIn
					time: 0.1
			complete:
				color: greyStatus
				fontSize: 15
				options: 
					curve: Bezier.easeIn
					time: 0.1
		line.states = 
			active:
				height: 1
				backgroundColor: black
			inactive:
				height: 1
				backgroundColor: black
			complete:
				height: 1
				backgroundColor: black 
		
		dot.onClick ->
			selectedSection = this.name
			selectedSectionIndex = i
			pageComp.snapToPage(@section)
#Input Page Scroll
pageCompSections = []
selectedSection = scrollBarDescriptions[0]
selectedSectionIndex = 0

# Framer.Device = null
# Framer.Device.deviceImage = null
# Framer.Device.setOrientation(90, true)


# IntelliStream_App.frame = Screen.frame

# IntelliStream_App.width = Screen.width
# ratio = Screen.width/IntelliStream_App.width
# IntelliStream_App.height = Screen.height
# print ratio = Framer.Device.screen.width/IntelliStream_App.width
# ratio = Framer.Device.screen.height/IntelliStream_App.height

print "Screen.height: " + Screen.height

#modify page content for Optimization
pageComp = new PageComponent #Need a nested pageComponent for section scroll
	parent: IntelliStream_App #.content #child of the scrollableComponent for Optimization View
	y: headerBar.y + headerBar.height + tab.height
	width: IntelliStream_App.width
	height: Screen.height - headerBar.height - tab.height - footerBar.height
# 	height: IntelliStream_App.height - headerBar.height - tab.height - footerBar.height
	originY: 0
	scrollHorizontal: false
	mouseWheelEnabled: true

calculateYPostition = (i_position) ->
	finalY = 0
	for i in [0...i_position]
		finalY += headerBar.y + headerBar.height + WLP_Inputs_1.children[i].height
	return finalY
	
createScrollView = (num, parent) ->
	for i in [0...num]
		pageCompSection = new Layer
			parent: pageComp.content
			name: scrollBarDescriptions[i]
			image: "images/page_placeholders/WLP/ipad/" + i + ".png"
			width: IntelliStream_App.width
			height: WLP_Inputs_1.children[i].height
			y: calculateYPostition(i)
			opacity: 0.2

		pageCompSections.push(pageCompSection)
		
		pageCompSection.state = "inactive"
		
		pageCompSection.states = 
			active:
				opacity: 1
				scale: 1
				options: 
					curve: Bezier.easeOut
					time: 0.2
					
		pageCompSection.onClick ->
			#Pretend save was clicked
			@state = "complete" #change the state
			
			#Update Steps visuals
			for i in [0...steps.length]
				if steps[i].name == selectedSection == this.name
					selectedSectionIndex = i 
					steps[i].children[0].animate("complete")#dot
					steps[i].children[1].animate("complete")#stepDescription
			
			current = pageComp.verticalPageIndex(pageComp.currentPage)
			selectedSection = pageComp.currentPage.name
			
			#AutoScroll if there are more sections
			if (current+1) < scrollBarDescriptions.length
				pageComp.snapToPage(pageCompSections[current+1])
	createScrollBar(num)	
	#Set the first section to be active by default
	pageCompSections[0].opacity = 1
	pageCompSections[0].state = "active"
	pageCompSections[1].state = "active"
	for j in [0...steps[0].children.length-1]
		steps[0].children[j].animate("active")
	#I shouldn't have to do this but Framer failed me :/
	IntelliStream_App.children[1].opacity = 1
		
#changing active on pageComp scroll
pageComp.onChange "currentPage", ->
	section.states.switch("default") for section in pageCompSections
	current = pageComp.verticalPageIndex(pageComp.currentPage)
	selectedSection = pageComp.currentPage.name
	
	pageCompSections[current].states.switch("active")
		
	#Going forward logic	
	for i in [0...steps.length]
		steps[i].children[0].animate("inactive")
		steps[i].children[1].animate("inactive")
		if steps[i].name == selectedSection && pageCompSections[i].state != "complete"
			selectedSectionIndex = i 
			steps[i].children[0].animate("active")#dot
			steps[i].children[1].animate("active")#stepDescription
				 

# pageComp.onScrollEnd ->
# 	print "onScrollEnd!"
	
createScrollView(5) #Create this modified view



