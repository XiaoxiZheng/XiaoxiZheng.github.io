# CONFIGURATION SETTINGS 
scroll = new ScrollComponent
	parent: component_index_master_
# 	x: Content.x
# 	y: Content.y
	width: Content.width
	height: Content.height 
	backgroundColor: "transparent"
	scrollHorizontal: false
	mouseWheelEnabled: true
	
menu_items.parent = scroll.content 
# lines.parent = scroll.content

searchField.bringToFront()

InputModule = require "input"
menuIndex = JSON.parse Utils.domLoadDataSync "menu_index.json"


# print menuIndex.length

# for i in [0...menuIndex.length]
# 	for j in [0...Object.keys(menuIndex[i]).length]
# 		print Object.keys(menuIndex[i])[j]
	
# for i in [0...Object.keys(menuIndex).length]
# 	print "Menu Index: " + Object.keys(menuIndex)[i]
	
# 	print "Menu Index Children: " + Object.keys(menuIndex.menuIndex[i])
# 	print "Menu Index Children: " + Object.keys(menuIndex.Application_Frame)
	
# 	print JSON.parse(Object.key)
# 	print Object.keys(menuIndex[i]).length
# 	for j in [0...Object.keys(menuIndex[i]).length]
# 		Object.keys(Object.keys(menuIndex[i]))[j]
# 	print "========="
#SEARCH
closeIcon = new Layer
	parent: searchField
	width: 15
	height: 15
	x: searchField.width - 30, y: 10
	backgroundColor: null
	opacity: 0
closeIcon.html = """
<svg width="15px" height="15px" viewBox="0 0 14 13">
	<g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
		<g id="search-icon" transform="translate(-631.000000, -428.000000)" stroke="#143D4A">
			<g id="Close" transform="translate(632.000000, 428.000000)">
				<path d="M6,6.788 L0,12.788 L6,6.788 L0,0.788 L6,6.788 Z M6,6.788 L12,0.788 L6,6.788 L12,12.788 L6,6.788 Z" id="close-icon"></path>
			</g>
		</g>
	</g>
</svg>
"""

closeBtn = new Layer
	parent: closeIcon
	width: 16, height: 16, y: 10
	backgroundColor: null

buildSearchBar = ->
	matched = false
	type_wrapper.visible = false
	inputElement.value = ''
	
	searchField.visible = true
	closeIcon.visible = true
				
	closeIcon.animate
		opacity: 1
		options:
			curve: Bezier.easeInOut
			time: .1
			
closeSearchBar = ->
	resetSearchParameters()
	
	closeIcon.animate
		opacity: 0
		options:
			curve: Bezier.easeInOut
			time: .1
# 			delay: 0.2
	
	closeIcon.visible = false

# CLOSE SEARCH FIELD
closeIcon.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
				
closeIcon.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
closeIcon.on Events.TouchEnd, ->
	closeSearchBar()
	
searchRows = []

#----------------------------------------#	
#          SEARCH FUNCTIONALITY          #
#----------------------------------------#
# Array to store matched results
results = []
	
searchField.ignoreEvents = false

searchField.on Events.TouchEnd, ->	
	buildSearchBar() 
		
resetSearchParameters = () ->
	matched = false
	type_wrapper.visible = false
	inputElement.value = ''
	closeIcon.opacity = 0

#type_wrapper is defined in design mode
type_wrapper.z = 100

# This creates a text input and adds some styling in plain js
inputElement = document.createElement("textarea")
inputElement.parent = searchField

inputElementWidth = searchField.width
inputElement.style["width"]  =  inputElementWidth.toString() + "px"
inputElement.style["height"] = "30px"
inputElement.style["font"] = "14px/1.35em GE Inspira" #48px
inputElement.style["font-weight"] = "200"
inputElement.style["color"] = "#065769"
inputElement.style["padding-left"] = "0px"
inputElement.style["padding-top"] = "8px"
inputElement.style["background-color"] = "transparent"
inputElement.style["resize"] = "none"
inputElement.style["outline"] = "none"

# Set the value, focus and listen for changes
inputElement.placeholder = search_placeholder.text
inputElement.value = ""
inputElement.focus()
inputElement.onkeyup = (e) ->	
	# Set values and Regex query
	val = inputElement.value.toLowerCase()
	callSearch(val)
	
callSearch = (val) ->
	type_wrapper.visible = true 
	# Clear Everything
	matchedStrings = []
	matchedLayers = []
	matched = false
	
	# Garbage collect old layers
	_.invoke(type_wrapper.subLayers, "destroy")
			
	reg = new RegExp(val, 'i');
	
	# Iterate through search_data and store names in matchedStrings array
	for i in [0...menu_items.descendants.length]
		if menu_items.descendants[i].text != undefined
			if menu_items.descendants[i].text.match reg
				matched = true
				matchedLayers.push(menu_items.descendants[i])	
	
	# For all layers:
	#	collapse children that doesn't contain "matched character"
	# If names match:
	#	 - highlight in the matrix
	#	 - dynamic shift to nearest sibling layer.y + y_padding
	if val != ""
		for layer in results
			layer.destroy()
# 		for j in [0...menu_items.descendants.length]
# 			if isAnimatableLayer(menu_items.descendants[j].parent.name)
# # 				menu_items.descendants[j].parent.animate("default")
# # 				menu_items.descendants[j].parent.animate("defaultState")
# 				menu_items.descendants[j].parent.backgroundColor = "transparent"
# # 				print "collapse children that doesn't contain matched character"

		if matched is true
			for j in [0...matchedLayers.length]
# 				print "matchedLayer: " + matchedLayers[j].parent.name 
				if isAnimatableLayer(matchedLayers[j].parent.name)
					#animate Target layer(s) to shift to top
# 					doAnimation_on(menu_items.descendants[j].parent)
					doTypingAnimation(val,matchedLayers[j].parent)
					
# 					print "animatable layer from search: " + matchedLayers[j].parent.name
					
				subString_index = matchedLayers[j].text.search reg
				
				textOverlay = new Layer
					parent: matchedLayers[j]
					width: matchedLayers[j].width + 10
					height: matchedLayers[j].height
					color: matchedLayers[j].color
					backgroundColor: "#FFE070"
					html: '<div style="font-size: 15px; font-family:GE Inspira Sans; padding: 0 0; letter-spacing: 0; line-height: 1;"><span>' + matchedLayers[j].text.replace(reg,val.bold()) + '</span></div>'
				
				results.push textOverlay
																	
				closeBtn.onClick ->
					resetSearchParameters()
								
# 		if matched is false
			# DO NOTHING FOR EMPTY STATE
			
	else #When the inputfield is empty
		for layer in results
			layer.destroy()
		for j in [0...menu_items.descendants.length]
			menu_items.descendants[j].animate("defaultState")
			
			if isAnimatableLayer(menu_items.descendants[j].parent.name)
# 				print "DefaultState: " + menu_items.descendants[j].parent.name
# 				print "defaultY: " + menu_items.descendants[j].parent.defaultY
# 				print "defaultHeight: " + menu_items.descendants[j].parent.defaultHeight
				menu_items.descendants[j].parent.animate("defaultState")
				menu_items.descendants[j].parent.backgroundColor = "transparent"
				#turn everything back to default state (everything is expanded)
				
			
# Add textInputLayer to the Screen
searchField._element.appendChild(inputElement)

#TextLayer Animations
onStateTime = 0.1
y_padding = 25

animationOption = 
	curve: Bezier.easeOut
	time: .1

#Add Layer States
#Default is everything defined in DESIGN MODE
for i in [0...menu_items.descendants.length]
	menu_items.descendants[i].defaultY = menu_items.descendants[i].y
	menu_items.descendants[i].defaultHeight = menu_items.descendants[i].height
	menu_items.descendants[i].currentlyExpanded = true 
	
	menu_items.descendants[i].states =
		defaultState:
			y: menu_items.descendants[i].defaultY
			height: menu_items.descendants[i].defaultHeight
			opacity: 1
			options: animationOption
			
isAnimatableLayer = (layerName) ->
	if layerName == "headers_children" || layerName == "layouts_children" || layerName == "conditions_children" || layerName == "formats_children" || layerName == "buttons_children" || layerName == "loaders_children" || layerName == "bar_charts_children" || layerName == "circle_charts_children" || layerName == "line_charts_children" || layerName == "plot_charts_children"
# 		print layerName + ":animatable"
		return true
	else
		return false

globalBool = true 

doTypingAnimation = (subString,layer) ->
# 	print "layerName: " + layer.name
	if subString == "p"
		if globalBool
# 		if layouts_children.currentlyExpanded
			doAnimation_off(layouts_children)
			doAnimation_off(formats_children)
			doAnimation_off(bar_charts_children)
# 			print "inside currentlyExpanded"
			
		else #if headers_children.currentlyExpanded is true# # # 			
			for i in [0...layer.parent.siblings.length]
				layer.parent.siblings[i].animate("defaultState")
				for j in [0...layer.parent.siblings[i].children.length]
					layer.parent.siblings[i].children[j].animate("defaultState")
# # 				
			headers_children.animate("defaultState")
			conditions_children.animate("defaultState")
			buttons_children.animate("defaultState")
			loaders_children.animate("defaultState")
			line_charts_children.animate("defaultState")
			plot_charts_children.animate("defaultState")
# # 			
# # # 			doAnimation_on(layouts_children)
# # # 			doAnimation_on(formats_children)
# # # 			doAnimation_on(bar_charts_children)
# # 					print "layer.currentlyExpanded is false "n)
			
# 			doAnimation_on(headers_children)
# 			doAnimation_on(conditions_children)
# 			doAnimation_on(buttons_children)
# 			doAnimation_on(loaders_children)
# 			doAnimation_on(line_charts_children)
# 			Utils.delay 0.25, ->
# 				doAnimation_on(plot_charts_children)
		
# 			layer.currentlyExpanded = !layer.currentlyExpanded	
			
# 		print "p"
		
	else if subString == "pi"
		if globalBool
# 		if headers_children.currentlyExpanded
# 			print "insde layer.currentlyExpanded"
			doAnimation_off(headers_children)
			doAnimation_off(conditions_children)
			doAnimation_off(buttons_children)
			doAnimation_off(loaders_children)
			doAnimation_off(line_charts_children)
			Utils.delay 0.25, ->
				doAnimation_off(plot_charts_children)
# 		else
# 			doAnimation_on(conditions_children)
# 			doAnimation_on(buttons_children)
# 			doAnimation_on(loaders_children)
# 			doAnimation_on(line_charts_children)
# 			Utils.delay 0.25, ->
# 				doAnimation_on(plot_charts_children)
# 
# 			for i in [0...layer.parent.siblings.length]
# 				layer.parent.siblings[i].animate("defaultState")
# 				for j in [0...layer.parent.siblings[i].children.length]
# 					layer.parent.siblings[i].children[j].animate("defaultState")

# 			print layer.currentlyExpanded = !layer.currentlyExpanded	
# 		print "pi"
		
	else if subString == "pie"
# 		print "pie"
		globalBool =! globalBool
# 		layer.currentlyExpanded =! layer.currentlyExpanded
	
doAnimation_shift = (animatingLayer, shift_y) ->
	anim = new Animation animatingLayer,
		y: animatingLayer.y + shift_y
		options: animationOption
	anim.start()
	
doAnimation_shift_with_target = (animatingLayer, target_y) ->
	anim = new Animation animatingLayer,
		y: target_y
# 		y: animatingLayer.y + shift_y
		options: animationOption
# 	animatingLayer.onMouseDown ->
	anim.start()
# 	print "shifted layer name: " + animatingLayer.name	
		
doAnimation_off = (animatingLayer) ->
	if isAnimatableLayer(animatingLayer.name)
		anim = new Animation animatingLayer,
			opacity: 0
			height: animatingLayer.height - 50
			y: animatingLayer.y - 30 #animatingLayer.height
			options: animationOption
		
		parentSiblingLength = animatingLayer.parent.siblings.length
		anim.start()
		
# 		shift_y = 0
		for x in [0...animatingLayer.parent.siblings.length-1]
			if animatingLayer.parent.siblings[x].y > animatingLayer.parent.y
# 				print animatingLayer.parent.siblings[x].name
# 				print "animatingLayer.y: " + animatingLayer.y + "|| parentSiblingLayer.y:" + animatingLayer.parent.siblings[x].y 
				shift_y = (-animatingLayer.height - y_padding) 
				doAnimation_shift_with_target(animatingLayer.parent.siblings[x], animatingLayer.parent.siblings[x].y + shift_y)
		
# 		if animatingLayer.parent.siblings[parentSiblingLength-1].height > 0
		print "off: animatingLayer name: " + animatingLayer.na		
		print animatingLayer.parent.siblings[parentSiblingLength-1].height += shift_y
		
		animatingLayer.currentlyExpanded != animatingLayer.currentlyExpanded

doAnimation_on = (animatingLayer) ->
	if isAnimatableLayer(animatingLayer.name)
# 		print "off: animatingLayer name: " + animatingLayer.name
		anim = new Animation animatingLayer,
			opacity: 1
			height: animatingLayer.height + 50 
			y: animatingLayer.y + 30  #animatingLayer.height
			options: animationOption
		
		parentSiblingLength = animatingLayer.parent.siblings.length
		anim.start()
		
		shift_y = 0
		for x in [0...animatingLayer.parent.siblings.length-1]
			if animatingLayer.parent.siblings[x].y > animatingLayer.parent.y
# 				print animatingLayer.parent.siblings[x].name
# 				print "animatingLayer.y: " + animatingLayer.y + "|| parentSiblingLayer.y:" + animatingLayer.parent.siblings[x].y 
				print "shift_y" + shift_y = (animatingLayer.height + y_padding) 
				doAnimation_shift_with_target(animatingLayer.parent.siblings[x], animatingLayer.parent.siblings[x].y + shift_y)
				
		animatingLayer.parent.siblings[parentSiblingLength-1].height += (animatingLayer.height + y_padding)
		

# doAnimation_on = (animatingLayer) ->	
# 	if isAnimatableLayer(animatingLayer.name)
# 		anim = new Animation animatingLayer,
# 			opacity: 1
# 			height: animatingLayer.defaultHeight #animatingLayer.height 
# 			y: animatingLayer.defaultY  #animatingLayer.y
# 			options: animationOption
# 		anim.start()
# # 		print "on: animatingLayer name: " + animatingLayer.name
# # 		print "on: animatingLayer.height" + animatingLayer.height	
# # 		print 
# 		parentSiblingLength = animatingLayer.parent.siblings.length
# 		for x in [0...animatingLayer.parent.siblings.length-1]
# # 			print animatingLayer.parent.siblings[x].name
# # 			doAnimation_shift(animatingLayer.parent.siblings[x], + (animatingLayer.height + y_padding))
# # 			print "shift_y" + shift_y = (animatingLayer.height + y_padding) 
# 			if animatingLayer.parent.siblings[x].y > animatingLayer.parent.y
# 				doAnimation_shift_with_target(animatingLayer.parent.siblings[x], animatingLayer.parent.siblings[x].defaultY)
# 
# 		animatingLayer.parent.siblings[parentSiblingLength-1].height += (animatingLayer.height + y_padding)
