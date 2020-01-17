sketch = Framer.Importer.load("imported/toggle_prototype@2x", scale: 1)

list_toggle = sketch.list
card_toggle = sketch.card1
notificationsData = JSON.parse Utils.domLoadDataSync "notificationsData.json"
FontAwesome = require 'FontAwesome'

#Card-List-View Class
class CardListView extends Layer 
	constructor: (@options={}) ->
		@options.xStart ?= 255
		@options.yStart ?= 190
		@options.cardWidth ?= 330
		@options.cardHeight ?= 330
		@options.gutterSize ?= 10
		@options.cardsPerRow ?= 3
		@options.cardLength ?= 8
		@options.fullWidth ?= 1000
		@options.fullHeight ?= 960
		@options.contentData ?= "contentData"
		@options.wireFrame ?= true
		
# 		super @options # Initialize these first parameters above as the default properties for our component
		@cards = []
		
		@scrollCompt = new ScrollComponent
			width: Screen.width
			height: @options.fullHeight - @options.yStart
			y: @options.yStart
			backgroundColor: "transparent"
			mouseWheelEnabled: true
			scrollHorizontal: false
			speedY: 0.8
	
	drawCards: () =>
		for i in [0...@options.cardLength]
			row = Math.floor(i/@options.cardsPerRow)
			if (row > 0)
				card = new Layer
					parent: @scrollCompt.content
					x: @options.xStart + ((i%%@options.cardsPerRow) * @options.cardWidth) + ((i%%@options.cardsPerRow) * @options.gutterSize)
					y: (@options.cardHeight * row ) + (row * @options.gutterSize) #@options.yStart + 
					width: @options.cardWidth
					height: @options.cardHeight
					backgroundColor: "#0D1A21"
					borderWidth: 1
					borderColor: "#09819C"
# 					html: i
					name: "card" + i
			else
				card = new Layer
					parent: @scrollCompt.content
					x: @options.xStart + (i * @options.cardWidth) + (i*@options.gutterSize)
					y: 0 #@options.yStart
					width: @options.cardWidth
					height: @options.cardHeight
					backgroundColor: "#0D1A21"
					borderWidth: 1
					borderColor: "#09819C"
# 					html: i
					name: "card" + i
			
			if @options.wireFrame
				#if need a wireframe version of this, don't add any content
			else
				wellName = new TextLayer
					parent: card
					fontFamily: "GE Inspira Sans"
					fontSize: 15
					color: "white"
					x: 15
					y: 20
					text: @options.contentData[i].assetName
				wellName.states = 
					cardView:
						fontFamily: "GE Inspira Sans"
						fontSize: 15
						color: "white"
						x: 15
						y: 20
						animationOptions:
							curve: 'ease-out'
							time: 0.1
					listView:
						y: 15
						animationOptions:
							curve: 'ease-out'
							time: 0.1
				time = new TextLayer
					parent: card
					fontFamily: "GE Inspira Sans"
					fontSize: 15
					color: "white"
					x: Align.right
					padding:
						right: 15
					y: wellName.y
					text: @options.contentData[i].time
				time.states =
					cardView:
						fontSize: 15
						x: Align.right
						padding:
							right: 15
						y: wellName.y
						animationOptions:
							curve: 'ease-out'
							time: 0.1
					listView:
						fontSize: 12
						x: 835
						y: 15
						animationOptions:
							curve: 'ease-out'
							time: 0.1
				status = new Layer
					parent: card
					width: 40, height: 40
					x: wellName.x, y: wellName.y + 40
					image: "images/status_icons/" + Math.floor(Utils.randomNumber(1,6)) + ".svg"
				status.states =
					cardView:
						x: wellName.x, y: wellName.y + 40
						animationOptions:
							curve: 'ease-out'
							time: 0.1
					listView:
						x: wellName.x, y: 45
						animationOptions:
							curve: 'ease-out'
							time: 0.1
				msgTitle = new TextLayer
					parent: card
					fontFamily: "GE Inspira Sans"
					fontSize: 18
					color: "white"
					x: status.x + status.width + 15
					y: status.y + 10
					width: 250
					height: 18 * 20 * 2
					text: @options.contentData[i].notificationName
				msgTitle.textOverflow = "ellipsis"
				
				msgTitle.states = 
					cardView:
						y: status.y + 10
						animationOptions:
							curve: 'ease-out'
							time: 0.1
					listView:
	# 					x: status.x + status.width + 15
						y: 45
						animationOptions:
							curve: 'ease-out'
							time: 0.1
				overflowIcon = new FontAwesome
					parent: card
					icon: 'ellipsis-v'
					fontSize: 18
					y: msgTitle.y - 3
					x: card.width - 15
					color: "white"
				overflowIcon.states = 
					cardView:
						x: card.width - 15
						animationOptions:
							curve: 'ease-out'
							time: 0.1
					listView:
						x: 1220
						animationOptions:
							curve: 'ease-out'
							time: 0.1
				msgContent = new TextLayer
					parent: card
					fontFamily: "GE Inspira Sans"
					fontSize: 15
					color: "white"
					y: status.y + status.height + 22
					x: status.x
					text: @options.contentData[i].notificationContent
					height: 100
					width: 295
				
				msgContent.states =
					cardView:
						y: status.y + status.height + 22
						x: status.x
						height: 100
						width: 295
						fontSize: 15
						animationOptions:
							curve: 'ease-out'
							time: 0.1
					listView:
						y: 70
						x: 70 
						height: 20
						width: 735
						fontSize: 12
						animationOptions:
							curve: 'ease-out'
							time: 0.1
				actionBtn = new Layer
					parent: card
					y: msgContent.y + msgContent.height + 45 
					x: Align.center
					height: 45
					width: 300
					backgroundColor: "#09819C"
				actionBtn.states =
					cardView:
	# 					y: msgContent.y + msgContent.height + 45 
						y: 260
						x: status.x
						height: 45
						width: 300
						animationOptions:
							curve: 'ease-out'
							time: 0.1
					listView:
						y: 45
						x: 840
						width: 110
						height: 40
						animationOptions:
							curve: 'ease-out'
							time: 0.1
				actionBtn.text = new TextLayer
					parent: actionBtn
					x: Align.center
					y: Align.center
					fontFamily: "GE Inspira Sans"
					fontSize: 18
					color: "white"
					text: "Optimize"
					width: 80
				actionBtn.text.states =
					cardView:
						x: 115
						fontSize: 18
						animationOptions:
							curve: 'ease-out'
							time: 0.1
					listView:	
						fontSize: 15
						x: 25
						animationOptions:
							curve: 'ease-out'
							time: 0.1
	
				actionBtn.icon = new FontAwesome
					parent: actionBtn
					icon: 'chevron-down'
					fontSize: 15
					y: actionBtn.text.y + 3
					x: actionBtn.text.x + actionBtn.text.width + 55
					color: "white"
					opacity: 1
				actionBtn.icon.states =
					cardView:
						opacity: 1
						animationOptions:
							curve: 'ease-out'
							time: 0.1
					listView: 
						opacity: 0	
						animationOptions:
							curve: 'ease-out'
							time: 0.1

			@cards.push(card)
						
			newRow = (i%%@options.cardsPerRow == 0)
			
			row = Math.floor(i/@options.cardsPerRow)
			#y: yStart + (cardHeight * row ) + (row * 10)
			@cards[i].states.add
				cardDefaultFirstRow:{
					x: @options.xStart + ((i%%@options.cardsPerRow) * @options.cardWidth) + ((i%%@options.cardsPerRow) * @options.gutterSize)
					width: @options.cardWidth
					animationOptions:
						curve: 'ease-out'
						time: 0.2
				}
				cardFirstRowTwo: {
					height: @options.cardHeight
					y: (@options.cardHeight * row ) + (row * @options.gutterSize) #@options.yStart +
					animationOptions:
						delay: 0.2
						curve: 'ease-out'
						time: 0.2
				}
				cardDefault:{
					x: @options.xStart + (i * @options.cardWidth) + (i*@options.gutterSize)
					width: @options.cardWidth
					animationOptions:
						curve: 'ease-out'
						time: 0.2
				}
				cardDefaultTwo: {
					height: @options.cardHeight
					y: 0 # @options.yStart
					animationOptions:
						delay: 0.3
						curve: 'ease-out'
						time: 0.1
				}
				listOne:{
					height : @cards[i].height/3
					y: (i * (@cards[i].height/3)) # + (i*@options.gutterSize) + @options.yStart
# 					animationOptions:
# 						curve: 'ease-out'
# 						time: 0.1
				}
				listTwo:{
					x: @options.xStart
					width: @options.fullWidth
# 					animationOptions:
# 						delay: 0.2
# 						curve: 'ease-out'
# 						time: 0.1	
				}
	
	listView:(animate) =>
		if animate
			for i in [0...@cards.length]					
				@cards[i].animate
					height : @cards[i].height/3
					y: (i * @cards[i].height/3) # + (i*@options.gutterSize) + @options.yStart  
					options: 
						curve: 'ease-out'
						time: 0.2
				@cards[i].animate
					x: @options.xStart
					width: @options.fullWidth
					options: 
						delay: 0.3
						curve: 'ease-out'
						time: 0.1
						
				for j in [0...@cards[i].children.length]
					@cards[i].children[j].animate("listView")
					@cards[i].children[6].children[0].animate("listView")
		else
			for i in [0...@cards.length]		
				@cards[i].stateSwitch("listOne")
				@cards[i].stateSwitch("listTwo")	
				
				for j in [0...@cards[i].children.length]
					@cards[i].children[j].stateSwitch("listView")
					@cards[i].children[6].children[0].stateSwitch("listView")
	cardView:(animate) =>
		if animate
			for i in[0...@cards.length]
				row = Math.floor(i/@options.cardsPerRow)
				if (row > 0)
					@cards[i].animate("cardDefaultFirstRow")
					@cards[i].animate("cardFirstRowTwo")
				else
					@cards[i].animate("cardDefault")
					@cards[i].animate("cardDefaultTwo")		
				for j in [0...@cards[i].children.length]
						@cards[i].children[j].animate("cardView")
						@cards[i].children[6].children[0].animate("cardView")
		else
			for i in[0...@cards.length]
				row = Math.floor(i/@options.cardsPerRow)
				if (row > 0)
					@cards[i].stateSwitch("cardDefaultFirstRow")
					@cards[i].stateSwitch("cardFirstRowTwo")
				else
					@cards[i].stateSwitch("cardDefault")
					@cards[i].stateSwitch("cardDefaultTwo")

				for j in [0...@cards[i].children.length]
						@cards[i].children[j].stateSwitch("cardView")
						@cards[i].children[6].children[0].stateSwitch("cardView")
	hideCardContent:()=>
		for i in [0...@cards.length]
			for j in [0...@cards[i].children.length]
				@cards[i].children[j].opacity = 0 
# 				@cards[i].children[j].animate
# 					opacity: 0 
# 					options:
# 						time: 0.1
# 						curve: 'ease-out'
	showCardContent:()=>
		for i in [0...@cards.length]
			for j in [0...@cards[i].children.length]
				@cards[i].children[j].animate
					opacity: 1
# 					options:
# 						time: 0.1
# 						curve: 'ease-out'
	
	hidecards:()=>
# 		@scrollCompt.opacity = 0
		for i in [0...@cards.length]
			@cards[i].animate
				opacity: 0
				options:
					time: 0.2
					curve: 'ease-out'
	showCards:()=>
# 		@scrollCompt.opacity = 1
		for i in [0...@cards.length]
			@cards[i].animate
				opacity: 1
				options:
					time: 0.2
					curve: 'ease-out'
#Instances of the CardList View
notification_cardListView = new CardListView
	xStart: 255
	yStart: 190
	cardWidth: 330
	cardHeight: 330
	gutterSize: 10
	cardsPerRow: 3
	cardLength: 10
	fullWidth: 1000
	fullHeight: 960
	contentData: notificationsData	
notification_cardListView.drawCards()

# listView = new CardListView
# 	xStart: 255
# 	yStart: 190
# 	cardWidth: 330
# 	cardHeight: 330
# 	gutterSize: 10
# 	cardsPerRow: 3
# 	cardLength: 10
# 	fullWidth: 1000
# 	fullHeight: 960
# 	contentData: notificationsData	
# listView.drawCards()
# listView.listView(false) #animate
# listView.hideCards()

list_toggle.on Events.MouseOver, ->
	list_toggle.scale = 1.3	
list_toggle.on Events.MouseOut, ->
	list_toggle.scale = 1
card_toggle.on Events.MouseOver, ->
		card_toggle.scale = 1.3
card_toggle.on Events.MouseOut, ->
	card_toggle.scale = 1
	
list_toggle.onClick ->
# 	cardView.hideCards()
# 	listView.listView(false)
# 	listView.bringToFront()
	
	notification_cardListView.hideCardContent()
	notification_cardListView.listView(true) #animate
	Utils.delay 0.3, ->
		notification_cardListView.showCardContent()

card_toggle.onClick ->
# 	listView.hideCards()
# 	cardView.cardView()
# 	cardView.bringToFront()
	
	notification_cardListView.hideCardContent()
	notification_cardListView.cardView(true)
	Utils.delay 0.3, ->
		notification_cardListView.showCardContent()

