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
lines.parent = scroll.content

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

	searchField.animate
		height: 90
		options:
			time: 0.1
			curve: Bezier.ease
	closeIcon.animate
		opacity: 0
		options:
			curve: Bezier.easeInOut
			time: .1
			delay: 0.2
	
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
# 	_.invoke(type_wrapper.subLayers, "destroy")
			
	reg = new RegExp(val, 'i');
	
	# Iterate through search_data and store names in matchedStrings arrayppie
	for i in [0...menu_items.children.length]
	
		if menu_items.children[i].text.match reg
			matched = true
			matchedLayers.push(menu_items.children[i])
					
	# If names match display the typeahead otherwise hide it
	if val != ""
		for layer in results
			layer.destroy()
		for j in [0...menu_items.children.length]
			menu_items.children[j].backgroundColor = "transparent"
					
		if matched is true
			for j in [0...matchedLayers.length]
# 				matchedLayers[j].backgroundColor = "#E6F5FF"
				
				
				subString_index = matchedLayers[j].text.search reg
# 				matchedLayers[j].text[subString_index].bold()
# 				matchedLayers[j].text[subString_index].fontStyle = "bold"
				
# 				print matchedLayers[j].text.html

# 				matchedLayers[j].text.innerHTML = matchedLayers[j].text.replace(reg,val.bold())
# 				matchedLayers[j].text.html = matchedLayers[j].text.replace(reg,val.bold())
# 				matchedLayers[j].html = matchedLayers[j].text.replace(reg,val.bold())
				
				textOverlay = new Layer
					parent: matchedLayers[j]
					width: matchedLayers[j].width + 10
					height: matchedLayers[j].height
					color: matchedLayers[j].color
					backgroundColor: "#FFE070"
					html: '<div style="font-size: 15px; font-family:GE Inspira Sans; padding: 0 0; letter-spacing: 0; line-height: 1;"><span>' + matchedLayers[j].text.replace(reg,val.bold()) + '</span></div>'
				
				results.push textOverlay
# 				matchedLayers[j] = textOverlay
				
# 				matchedLayers[j].color = "null"
				
# 				textOverlay = new TextLayer
# 					parent: matchedLayers[j]
# 					x: subString_index * 8
# 					font: matchedLayers[j].font
# 					fontSize: matchedLayers[j].fontSize
# 					color: matchedLayers[j].color
# 					fontStyle: "bold" 
# 					text: val
# 					backgroundColor: "yellow"
								
# 			for j in [0..matchedStrings.length - 1]
				#Matched
# 				result = new TextLayer
# 					text: matchedStrings[j]
# 					parent: type_wrapper
# 					width: type_wrapper.width, height: 15
# 					x: 0, y: j * 25 + 10
# 					backgroundColor: "#143D4A"
# 					fontSize: 14
# 					color: "white"
# 					padding: 5
# 				
# 				results.push result
# 				
# 				result.on Events.MouseOver, (event, layer) ->
# 					document.body.style.cursor = "pointer"
# 					this.backgroundColor = "#09819C" #blue03
# 				
# 				result.on Events.MouseOut, (event, layer) ->
# 					document.body.style.cursor = "auto"
# 					this.backgroundColor = "#143D4A"
# 					
# 				# here is what happens after selecting an autofill search
# 				result.on Events.TouchEnd, (event, layer) -> 										
# 					type_wrapper.visible = false
# 					inputElement.value = layer.text
																	
				closeBtn.onClick ->
					resetSearchParameters()
								
		if matched is false
			for i in [0...menu_items.descendants.length]
				menu_items.descendants[i].backgroundColor = "transparent"
				
	else
		for layer in results
			layer.destroy()
	
# here is what happens after pressing enter 
document.addEventListener 'keydown', (e) ->
	if (e.keyCode is 13 && !e.shiftKey)
		val = inputElement.value.toLowerCase()
		e.preventDefault(); #prevent new line from happening 
		inputElement.value = val
		
		callSearch(val)
			
# Add textInputLayer to the Screen
searchField._element.appendChild(inputElement)