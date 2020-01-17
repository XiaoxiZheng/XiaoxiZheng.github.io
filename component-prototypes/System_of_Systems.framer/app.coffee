
document.body.style.cursor = "auto"

twoD_view = true

# print Screen.height

Network_view_iframe = "<iframe width = '100%' height = '740px' src='http://xiaoxizheng.com/3d-force-graph/example/custom-node-geometry/' frameborder='0' allowfullscreen></iframe>"

Network_view = new Layer
	parent: main_content
	width: main_content.width
	height: main_content.height
# 	html: Network_view_iframe
	backgroundColor: "white"
	mouseWheelEnabled: true
	ignoreEvents: false
	opacity: 0
	
viewfinder.onClick ->	
	if twoD_view is true
		twoD_view = false
		twoD_network.animate
			opacity: 0
			time: 0.1
		Network_view.html = Network_view_iframe
		Network_view.opacity = 1
# 		Network_view.enabled = true
		
	else #currently in 3d viewfinder
		twoD_view = true
		twoD_network.animate
			opacity: 1
			time: 0.1
		Network_view.opacity = 0
# 		Network_view.enabled = false
# 		Network_view.destroy()
	
expand.onClick ->
	full_page_panel.animate
		x: 0
		opacity: 1
		options:
			time: 0.1
			curve: Bezier.easeOut
# 	side_panel.animate
# 		opacity: 0
# 		options:
# 			time: 0.1
# 			curve: Bezier.easeOut				
shrink.onClick -> #shrink button
# 	side_panel.animate
# 		opacity: 1
# 		options:
# 			time: 0.1
# 			curve: Bezier.easeOut
	full_page_panel.animate
		opacity: 0
		x: 50
		options:
			time: 0.1
			curve: Bezier.easeOut
	
close_full_panel.onClick ->
	full_page_panel.animate
		opacity: 0
		options:
			time: 0.1
			curve: Bezier.easeOut
	side_panel.animate
		x: Screen.width + 50
		opacity: 0
		options:
			time: 0.1
			curve: Bezier.easeOut
			
close_1.onClick ->
	side_panel.animate
		x: Screen.width + 50
		opacity: 0
		options:
			time: 0.1
			curve: Bezier.easeOut

			curve: Bezier.easeOut
click_area.onClick ->
	side_panel.animate
		x: Screen.width - side_panel.width
		opacity: 1
		options: 
			time: 0.1
			curve: Bezier.easeOut

# full_page_scrollCompt = new ScrollComponent
# 	x: full_page_panel.x
# 	y: full_page_panel.y
# 	width: full_page_panel.width
# 	height: full_page_panel.height
# 	parent: IntelliStream_App
# 	
# full_page_panel.parent = full_page_scrollCompt.content
