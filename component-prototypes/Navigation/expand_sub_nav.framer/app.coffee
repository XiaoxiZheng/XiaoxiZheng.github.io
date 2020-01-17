# Import file "expand"
sketch = Framer.Importer.load("imported/expand@2x", scale: 1)

adjustTo = 200

sub_nav = new Layer
	x: 70
	y: 255
	width: 100
	height: 755
	backgroundColor: "#9E9E9E"
	
selected_item = new Layer
	parent: sub_nav
	width: 70, height: 70
	backgroundColor: "#D8D8D8"
	x: 0, y: 50
	width: 100

ratio = (sketch.Content_area.x + 100)/sketch.Content_area.x
	
sub_nav.onMouseOver ->
	sub_nav.animate
		width: adjustTo
	selected_item.animate
		width: adjustTo
# 			height: 809
	sketch.Content_area.animate
		x: sketch.Content_area.x + 100
		width: sketch.Content_area.width - 100
# 		scale: ratio
# 		width: sketch.Content_area.width - 200
# 		height: (sketch.Content_area.width - 200/sketch.Content_area.width) * sketch.Content_area.height

sub_nav.onMouseOut ->
	sub_nav.animate
		width: 100
	selected_item.animate
		width: 100
	sketch.Content_area.animate
		x: sketch.Content_area.x - 100
		width: sketch.Content_area.width + 100
				
# sketch.Content_area.onClick ->
# 	print "content area!"