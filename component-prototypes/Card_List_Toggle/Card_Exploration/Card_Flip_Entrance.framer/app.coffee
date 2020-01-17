# AppFrame.z = 0
AppFrame.perspective= 1100
AppFrame.originX = 1
AppFrame.originY = 0 
# 
active_card.originX = 1
active_card.originY = 0

#offSet Row2 to animate in 
row3.x = -100

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
	active_card.animate
		rotationY: 180
		options: 
			time: 0.2
# 			curve: 'ease-in'
	active_card.onAnimationEnd ->
		row1.children[1].animate
			opacity: 1
			rotationY: 180
			options: 
				time: 0.2
# 				curve: 'ease-out'
		row1.children[1].onAnimationEnd ->	
			row1.children[2].animate
				opacity: 1
				rotationY: 180
				options: 
					time: 0.2
# 					curve: 'ease-out'
		row1.children[2].onAnimationEnd ->	
			row1.children[3].animate
				opacity: 1
				rotationY: 180
				options: 
					time: 0.2
# 					curve: 'ease-out'
# 		row1.children[3].onAnimationEnd ->	
# 			row1.children[4].animate
# 				opacity: 1
# 				rotationX: 180
# 				options: 
# 					time: 0.3
# 					curve: 'ease-out'

		for i in [0...row2.children.length]
			row2.children[i].animate
				opacity: 1
				x: row3.children[i].x
				options: 
					delay: 0.05 * i
					time: 0.5
		row3.animate
			x: 0
			opacity: 1
		for i in [0...row3.children.length]
			row3.children[i].animate
				opacity: 1
				options: 
					delay: 0.02 * i

# active_card.onClick ->
# 	this.states.next(["back", "front"])
# 	flipAllCards()