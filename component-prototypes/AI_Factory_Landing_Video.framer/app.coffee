#SETTINGS
FontAwesome = require 'FontAwesome'
Framer.Extras.Preloader.disable()
# Framer.Extras.Preloader.setLogo("images/bhge.eps")

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
		x: card_sub.x - 30
		y: card_sub.y + card_sub.height + 6
		backgroundColor: "transparent"
		width: Screen.width
		height: 280
		scrollVertical: false
		scrollHorizontal: true
		mouseWheelEnabled: true
		speedX: 0.5
		mouseWheelSpeedMultiplier: 0.5

	cardPageCompe_blur_left = new Layer
		parent: parent_frame
		x: card_sub.x - 45
		y: card_sub.y + card_sub.height + 6
		backgroundColor: "#5D5E60"
		opacity: 0.8
		borderRadius: 4
		blur: 15
		width: 35
		height: 300
	
	cardPageCompe_blur_right = new Layer
		parent: parent_frame
		x: Screen.width - 120
		y: card_sub.y + card_sub.height + 6
		backgroundColor: "#5D5E60"
		opacity: 0.8
		borderRadius: 4
		blur: 20
		width: 35
		height: 300
		
			
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
	
	cardPageComp.onScrollEnd ->
		if cardPageComp.scrollX > 150
			left_arrow.opacity = 1
			right_arrow.opacity = 1
			
		else if cardPageComp.scrollX > rightEdge
			right_arrow.opacity = 0.5
			left_arrow.opacity =  1
			
		else if cardPageComp.scrollX < rightEdge && cardPageComp.scrollX > 150			
			left_arrow.opacity =  1
			right_arrow.opacity = 1
			
		else
			left_arrow.opacity =  0.5
			right_arrow.opacity = 1
							
	for i in [0...cardContentJson.length]
		cardContainer = new Layer
			parent: cardPageComp.content
			x: i * (280 + 15) + 30
			width: 280
			height: 280
			backgroundColor: "white"
			borderRadius: 4
			name: cardContentJson[i].Title
			clip: true
			
		cardContainer.link = cardContentJson[i].Link
										
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
				
		if i is 0
			videoContainer = new Layer
				parent: cardContainer
				width: 280
				height: 140
				clip: true
			
			cardContainer.vidPlaceHolder = new VideoLayer
				parent: videoContainer
				width: 336
				height: 168
				video: imgSrc  + i + ".mp4"
				backgroundColor: "black"
# 				video: "https://www.youtube.com/watch?v=3mpniZf93GM"
			cardContainer.vidPlaceHolder.centerX()
			cardContainer.vidPlaceHolder.centerY(-15)
			
			cardContainer.vidPlaceHolder.player.muted = true 
			cardContainer.onMouseOver ->
				this.vidPlaceHolder.player.play()
				this.cardTitle.textDecoration = "underline"	
			cardContainer.onMouseOut ->
				this.vidPlaceHolder.player.pause()
				this.cardTitle.textDecoration = "none"	
		
		cardContainer.onMouseOver ->
			this.imgPlaceHolder.animate
				scale: 1.05
				options: 
					curve: Bezier.easeOut
					time: 1
			this.cardTitle.textDecoration = "underline"
		cardContainer.onMouseOut ->
			this.imgPlaceHolder.animate
				scale: 1
				options: 
					curve: Bezier.easeOut
					time: 0.3
			this.cardTitle.textDecoration = "none"
		cardContainer.onMouseDown ->
			window.location = this.link
		
		cards.push(cardContainer)
			

createHorizontalCards("AI APPLICATIONS", ai_applications_json)
createHorizontalCards("HYBRID APPLICATIONS", hybrid_applications_json)

logo_group.bringToFront()
