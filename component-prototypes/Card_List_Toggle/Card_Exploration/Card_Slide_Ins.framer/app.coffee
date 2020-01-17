# AppFrame.z = 0
AppFrame.perspective= 1100
AppFrame.originX = 1
AppFrame.originY = 0 
# 
active_card.originX = 1
active_card.originY = 0

#offSet Row2 to animate in 
row3.x = -200

# active_card.flat = true

active_card.states =
	front:
		rotationY: 0
	back:
		rotationY: 180
				
for i in [0...row1.children.length]
	
	row1.children[i].originX = 1
	row1.children[i].originY = 0
	row1.children[i].perspective = 1
	
	row2.children[i].originX = 1
	row2.children[i].originY = 0
	row2.children[i].perspective = 1
	
	row3.children[i].originX = 1
	row3.children[i].originY = 0
	row3.children[i].perspective = 1
	
flipAllCards = () ->
	for i in [0...row1.children.length]
		row1.animate
			opacity: 1
		row1.children[i].states.next(["back","front"])
		row2.animate
			opacity: 1
		row2.children[i].states.next(["back","front"])

active_card.onClick ->
	for i in [0...row1.children.length]
		row1.children[i].animate
			opacity: 1
			x: row3.children[i].x
			options: 
				delay: 0.05 * (row1.children.length - i)
				time: 0.2
				curve: Bezier.easeOut
				
	for i in [0...row2.children.length]
		row2.children[i].animate
			opacity: 1
			x: row3.children[i].x
			options: 
				delay: 0.05 * (row2.children.length - i)
				time: 0.2
				curve: Bezier.easeOut
		row3.animate
			x: 0
			opacity: 1
			options: 
				curve: Bezier.easeOut
				time: 0.5
		for i in [0...row3.children.length]
			row3.children[i].animate
				opacity: 1
				options: 
					delay: 0.05 * (row3.children.length - i)
					curve: Bezier.easeOut
					time: 0.2

# active_card.onClick ->
# 	this.states.next(["back", "front"])
# 	flipAllCards()