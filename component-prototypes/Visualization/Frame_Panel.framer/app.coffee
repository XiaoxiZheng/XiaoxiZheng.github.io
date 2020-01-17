#Color Definitions
blue_active = "#1479C9"
mono_selected = "#282D33"
white = "#FFFFFF"
black = "#000000"

currentPanel = main_tool_bar
previousPanel = main_tool_bar
#Link variable 
secondary_toolset.active = false
settings_panel.active = false

animationOption = 
	time: 0.1
	curve: Bezier.easeOut
animationOption_1 = 
	time: 0.3
	curve: Bezier.easeOut

navigateTo = (screenName) ->
	base_bg.animate("settings_full")
	settings_content_base.opacity = 0 
	screenName.opacity = 1
	
	currentPanel = screenName
	
listItemMouseInteractions = (layerName,nextScreen) ->
	layerName.onMouseOver ->
		layerName.fill = mono_selected
	layerName.onMouseOut ->
		layerName.fill = black
	layerName.onClick ->
		previousPanel = settings_content_base
		navigateTo(nextScreen)
		
#State Definitions
main_tool_bar.states =
	inactive:
		opacity: 0
		options: animationOption
	active: 
		opacity: 1
		options: animationOption
		
secondary_toolset.states = 
	inactive:
		opacity: 0
# 		y: 70 - 10
		options: animationOption
	active: 
		opacity: 1
# 		y: 70
		options: animationOption_1
			
settings_panel.states =
	active:
		opacity: 1
# 		x: 0
		options: animationOption_1
	inactive:
		opacity: 0
# 		x: 20
		options: animationOption
for i in [0...settings_panel.children.length]
	settings_panel.children[i].states = 
		active:
			opacity: 1
			options: animationOption
		inactive:
			opacity: 0
			options: animationOption
			
base_bg.states = 
	main:
		height: 50
		options: animationOption
	zoom_sub_panel:
		height: 100
		options: animationOption
	settings_min:
		height: 200
		options: animationOption
	settings_full:
		height: 405
		options: animationOption
		
#MouseInteractions
#Zoom Panel
zoom_all.onMouseOver ->
	document.body.style.cursor = "pointer"
	zoom_all.children[0].fill = blue_active
zoom_all.onMouseOut ->
	document.body.style.cursor = "auto"
	zoom_all.children[0].fill = white
zoom_all.onClick ->
	zoom_all.children[0].fill = blue_active
	if secondary_toolset.active
		base_bg.animate("main")
		secondary_toolset.animate("inactive")
	else
		base_bg.animate("zoom_sub_panel")
		secondary_toolset.animate("active")
			
	secondary_toolset.active =! secondary_toolset.active
	
#Settings Panel	
settings.onMouseOver ->
	document.body.style.cursor = "pointer"
	settings.children[0].fill = blue_active
settings.onMouseOut ->
	document.body.style.cursor = "auto"
	settings.children[0].fill = white
settings.onClick ->
	if settings_panel.active
		base_bg.animate("main")
		settings.children[0].fill = white	
		main_tool_bar.animate("active")
		currentPanel = main_tool_bar
		previousPanel = settings_content_base
		settings_panel.animate("inactive")
		settings_content_base.animate("inactive")
		main_tool_bar.bringToFront()
		settings_panel.active = false
	else
		base_bg.animate("settings_min")
		
		settings.children[0].fill = blue_active	
		
		main_tool_bar.animate("inactive")
		
		settings_panel.animate("active")
		settings_content_base.animate("active")
		settings_panel.bringToFront()
		settings_panel.active = true
		
		currentPanel = settings_content_base
		previousPanel = main_tool_bar
		
listItemMouseInteractions(general_rec,general_settings)
listItemMouseInteractions(text_rec)
listItemMouseInteractions(color_rec)

close_button.onClick ->
	main_tool_bar.animate("active")
	main_tool_bar.bringToFront()
	base_bg.animate("main")
	settings_panel.animate("inactive")
	settings_panel.active = false

back_button.onMouseOver ->
	document.body.style.cursor = "pointer"
back_button.onMouseOut ->
	document.body.style.cursor = "auto"
back_button.onClick ->
# 	print "previousPanel: "+ previousPanel.name + "||" + "currentPanel: " + currentPanel
	if previousPanel.name is "settings_content_base"
		base_bg.animate("settings_min")
		
# 		settings_panel.animate("active")
		settings_content_base.animate("active")
		main_tool_bar.animate("inactive")
		settings_content_base.bringToFront()
		
		settings_panel.active = true
# 		currentPanel = previousPanel
# 		previousPanel = main_tool_bar
	else if previousPanel.name is "main_tool_bar"
		base_bg.animate("main")
		
		settings_panel.animate("inactive")
		settings_content_base.animate("inactive")
		main_tool_bar.animate("active")
		main_tool_bar.bringToFront()
		settings_panel.active = false
			
# 	previousPanel.bringToFront()
# 	currentPanel.animate("inactive")
# 	previousPanel.animate("active")
	
	currentPanel = previousPanel
	previousPanel = main_tool_bar






	
	