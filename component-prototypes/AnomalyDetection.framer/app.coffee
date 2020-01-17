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

#Colors
active_blue = "#143D4A"
white = "#FFFFFF"

tabName = ["Dashboard","Reports"]

pageCompSections = []

pageComp = new PageComponent #Need a nested pageComponent for section scroll
	parent: IntelliStream_App #.content #child of the scrollableComponent for Optimization View
	y: headerBar.y + headerBar.height + tab.height
	width: IntelliStream_App.width
	height: 760
	originY: 0
	scrollHorizontal: false
	mouseWheelEnabled: true
	
createScrollView = (num, parent) ->
	for i in [0...num]
		pageCompSection = new Layer
			parent: pageComp.content
			name: tabName[i]
# 			image: "images/page_placeholders/WLP/new/" + i + ".png"
			width: IntelliStream_App.width
			height: IntelliStream_App.height - headerBar.height - footerBar.height
			y: 0
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
	
# 	createScrollBar(num)
	
	#Set the first section to be active by default
	pageCompSections[0].opacity = 1
	pageCompSections[0].state = "active"
	pageCompSections[1].state = "active"
	
# 	for j in [0...steps[0].children.length-1]
# 		steps[0].children[j].animate("active")
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
	
createScrollView(2) #Create this modified view