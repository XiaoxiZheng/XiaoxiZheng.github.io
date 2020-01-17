#SETTINGS
FontAwesome = require 'FontAwesome'

#Card Content JSONS
ai_applications_json = JSON.parse Utils.domLoadDataSync "data/AI_Applications_List.json"
hybrid_applications_json = JSON.parse Utils.domLoadDataSync "data/Hybrid_Applications_List.json"

link_blue = "#008EEC"

cards = []

createHorizontalCards = (cardTitleName, cardContentJson) ->
	if cardTitleName is "AI APPLICATIONS"
		parent_frame = AI_Applications_Frame
		imgSrc = "images/ai/"
		rightEdge = 1000 
	else # Create Hybrid Application panel
		parent_frame = Hybrid_Applications_Frame
		imgSrc = "images/hybrid/"
		rightEdge = 700
	cardTitle = new TextLayer
		parent: parent_frame
		color: "white"
		fontSize: 20
		text: cardTitleName
		font: "GE Inspira Sans"
	card_sub = new TextLayer
		parent: parent_frame
		x: 20
		y: cardTitle.y + cardTitle.height + 24
		color: "white"
		fontSize: 12
		font: "GE Inspira Sans"
		text: "(" + cardContentJson.length + ")" + " APPLICATIONS"
	arrowsContainer = new Layer
		parent: parent_frame
		y: card_sub.y
		x: Screen.width - 70 - 130	#Width of this container - Margin
		width: 70
		height: 15
		backgroundColor: "transparent"
		
	left_arrow = new FontAwesome
		parent: arrowsContainer
		color: "white"
		fontSize: 13
		icon: 'chevron-left'
		x: 0 
		opacity: 0.5
	right_arrow = new FontAwesome
		parent: arrowsContainer
		color: "white"
		fontSize: 13
		icon: 'chevron-right'
		x: left_arrow.x + left_arrow.width + 40 
	
		
	
	#Create Page Component for Cards 
	cardPageComp = new PageComponent
		parent: parent_frame
		x: card_sub.x
		y: card_sub.y + card_sub.height + 6
		backgroundColor: "transparent"
		width: Screen.width - 135
		height: 280
		scrollVertical: false
		scrollHorizontal: true
		mouseWheelEnabled: true
		speedX: 0.5
		mouseWheelSpeedMultiplier: 0.5
	
	left_arrow.onMouseDown ->
		cardPageComp.animate
			scrollX: cardPageComp.scrollX - 150
			options:
				curve: Bezier.easeOut
				time: 0.3
		if cardPageComp.scrollX > 150
			left_arrow.opacity = 1
			right_arrow.opacity = 1
		else if cardPageComp.scrollX < rightEdge && cardPageComp.scrollX > 150			
			left_arrow.opacity =  1
			right_arrow.opacity = 1
		else
			left_arrow.opacity =  0.5
			right_arrow.opacity = 1
					
	right_arrow.onMouseDown ->
		cardPageComp.animate
			scrollX: cardPageComp.scrollX + 150
			options:
				curve: Bezier.easeOut
				time: 0.3		
		if cardPageComp.scrollX > rightEdge
			right_arrow.opacity = 0.5
			left_arrow.opacity =  1
		else if cardPageComp.scrollX < rightEdge && cardPageComp.scrollX > 150
			left_arrow.opacity =  1
			right_arrow.opacity = 1
		else
			left_arrow.opacity =  1
			right_arrow.opacity = 1
					
	for i in [0...cardContentJson.length]
		cardContainer = new Layer
			parent: cardPageComp.content
			x: i * (280 + 15)
			width: 280
			height: 280
			backgroundColor: "white"
			borderRadius: 4
			name: cardContentJson[i].Title
			clip: true
		cardContainer.imgPlaceHolder = new Layer
			parent: cardContainer
			width: 280
			height: 140
			image: imgSrc + i + ".png"
		
		cardContainer.cardTitle = new TextLayer
			parent: cardContainer
			x: 20
			y: cardContainer.imgPlaceHolder.y + cardContainer.imgPlaceHolder.height + 15
			width: 240
			color: link_blue
			fontSize: 15
			textTransform: "uppercase"
# 			textDecoration: "Underline"
			text: cardContentJson[i].Title
		cardDescription = new TextLayer
			parent: cardContainer
			x: 20
			y: cardContainer.cardTitle.y + cardContainer.cardTitle.height + 15
			width: 235
			color: "#575E66"
			fontSize: 15
			text: cardContentJson[i].Description
			
		cardContainer.onMouseOver ->
			this.imgPlaceHolder.animate
				scale: 1.1
				options: 
					curve: Bezier.easeOut
					time: 0.5
			this.cardTitle.textDecoration = "underline"
		cardContainer.onMouseOut ->
			this.imgPlaceHolder.animate
				scale: 1
				options: 
					curve: Bezier.easeOut
					time: 0.2
			this.cardTitle.textDecoration = "none"
		
		cards.push(cardContainer)
			

createHorizontalCards("AI APPLICATIONS", ai_applications_json)
createHorizontalCards("HYBRID APPLICATIONS", hybrid_applications_json)
