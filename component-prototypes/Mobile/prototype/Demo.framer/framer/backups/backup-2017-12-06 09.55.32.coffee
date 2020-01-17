# Import file "UI Design Mobile"
sketch = Framer.Importer.load("imported/UI%20Design%20Mobile@1x")
#Document Color Definitions
pureWhite = "#FFFFFF"
greenBlue = "#103D4C"
darkBlue = "#012939"
blackBlue = "#0D1A21"

grey15 = "#2C404C"

alertRed = "#E53838"
alertOrange = "#DD6B1F"
alertYellow = "FEC600"
alertBlue = "4999E9"
###
Material Design Component KIT
https://github.com/k-vyn/framer-material-kit#colors
###
m = require "material-kit"
data = require("demo_data").json

bg = new BackgroundLayer 
	color: blackBlue

#System Components
#Android Nav Bar
# nav = new m.NavBar
# nav.back.on Events.TouchEnd, ->
# 	for c in cards
# 		c.ignoreEvents = false
# 	bar.ignoreEvents = false
# Status bar
status = new m.StatusBar
	color:"white"
	backgroundColor: blackBlue
# App Bar
bar = new m.AppBar
	backgroundColor:darkBlue
	title:"IntelliStream Demo"
	menu:"menu"
	actions:["more_vert","search"] #more_vert
	actionColor:"white"
	tabs:["IntelliStream","notifications","account"]
	tabIcons:["dashboard","notifications_none","person"]
	tabsInk:{color:blackBlue, scale:3}
	tabsBarColor:"white"
	tabsColor:"white"
	tabsAlt:{color:pureWhite, opacity:0.35}

search_icon = bar.children[0].subLayers[3] #A hack to trigger search, bc for some reason bar.actions["search"] is undefined. *BUG*
#Menu Nav View
fullScreen_black = new Layer
	opacity: 0
	width: Screen.width
	height: Screen.height
	backgroundColor: "black"
	
menu_nav = new ScrollComponent
	opacity: 0
	backgroundColor: blackBlue
	scrollHorizontal: false
	width: m.device.width/2 + m.dp(50) #dynamic sizing 1dp = 1px * scale 
	height: m.device.height
	x: -(m.device.width/2 + m.dp(50)) 		
menu_nav_content = new Layer
	parent: menu_nav.content
	image: "images/mobile-main-nav.png"
	width: m.device.width/2 + m.dp(50)
	height: (m.device.width/2 + m.dp(50))/726 * 2820
menuOpened = false 

toggleMenuOn = (state) ->
	if(state is true)	
		fullScreen_black.bringToFront()
		menu_nav.bringToFront()
		
		fullScreen_black.animate
			properties:
				opacity: 0.5
			curve: 'east-in'
			time: 0.2
		menu_nav.animate
			properties:
				opacity: 100
				x: 0
			curve: 'east-in'
			time: 0.2
		
		menuOpened = true
	else
		#Hide the menu layers
		menuOpened = false
		menu_nav.animate
			properties:
				opacity: 0
				x: -(m.device.width/2 + m.dp(50))
			curve: 'east-out'
			time: 0.2
			
		Utils.delay 2,
			fullScreen_black.sendToBack()
# 			fullScreen_black.destroy()
# 			menu_nav.destroy()

#Tap anywhere outside of the menu to close it
fullScreen_black.on Events.TouchEnd,->
	toggleMenuOn(false)
#Notification Banners
# banner = m.Banner
#   title:"Time to do something"
#   message:"Don't miss out"
#   animated:true
#Toast Messages
showSnackBar = false
# snack = new m.SnackBar text:"Search"
# showSnackBar = true
# Utils.delay 1, -> showSnackBar = false

 
#Page Contents 
#Search View
searchView = new PageComponent
	width: m.device.width
	height: m.device.height
	backgroundColor: blackBlue
	superLayer:bar.views["search"]
	scrollHorizontal: false

searchHeader = new Layer
	parent: searchView

searchScroll =	new ScrollComponent
	parent: searchView.content
	scrollHorizontal: false
	width: Framer.Device.screen.width
	height: Framer.Device.screen.height
	
searchContent = new Layer
	parent: searchView.content
# 	image: "images/notifications_history.png"
	width: Framer.Device.screen.width
	height: Framer.Device.screen.height

searchView.sendToBack()

# # HEADER
# headerBar = new Layer
# 	width: Framer.Device.screen.width, height: 70
# 	backgroundColor: darkBlue
# 	
# headerBar.bringToFront()


#Home Dashboard View
home = new ScrollComponent 
	scrollHorizontal: false, 
	backgroundColor: blackBlue
	superLayer:bar.views["IntelliStream"]
	width: m.device.width
	height: m.device.height
# home.constraints = {top:0, leading:0, trailing:0, bottom:nav}
home_content = new Layer
	parent: home.content
	image: "images/dash.png"
	width: Framer.Device.screen.width
	height: Framer.Device.screen.width/750 * 1214
#Notifications View
notificationsView = new ScrollComponent
	scrollHorizontal: false
	superLayer: bar.views["notifications"]
	width: m.device.width
	height: m.device.height
	backgroundColor: blackBlue
notification_history = new Layer
	parent: notificationsView.content
	image: "images/notifications_history.png"
	width: Framer.Device.screen.width
	height: Framer.Device.screen.width/1125 * 1590
#Account View
accountView = new ScrollComponent
	scrollHorizontal: false
	superLayer: bar.views["account"]
	backgroundColor: blackBlue
	width: m.device.width
	height: m.device.height
acountContent = new Layer
	parent: accountView.content
	image: "images/account.png"
	width: Framer.Device.screen.width
	height: Framer.Device.screen.width/1035 * 1503

## Home(Card) Content
cards = []
loadTable = (table, superLayer) ->

	# Card 
	card = () ->
		if cards[cards.length - 1]
			if cards[cards.length - 1].table != table
				cards = []
		layer = new Layer 
			superLayer: superLayer.content
			backgroundColor:blackBlue
			clip:true
			shadowY: m.px(1)
			shadowColor: pureWhite#m.color("grey200")
			opacity: 0
			
		layer.table = table
		cards.push layer
		layer.data = data[table][cards.indexOf(layer)]
		layer.constraints = {height:300}
		
		thumbnail = new Layer superLayer: layer, image:layer.data.thumbnail
		thumbnail.constraints =
			leading:10
			trailing:10
			bottom:60
			top:10
			
		profilePhoto = new Layer 
			superLayer: layer, 
			borderRadius: m.px(50), 
			image:layer.data.profile_pic
		profilePhoto.constraints =
			top:[thumbnail, 5]
			leading:10
			height:48
			width:48
			
		m.layout.set
			target:[layer, thumbnail, profilePhoto]
			
		titleLabel = new m.Text
			text:layer.data.title
			superLayer:layer
			constraints:{top:[thumbnail, 10], leading:80, trailing:10}

			
		userLabel = new m.Text
			text:"#{layer.data.author} • #{layer.data.short_views} views • #{layer.data.rel_date}"
			superLayer:layer
			fontSize:14
			color:pureWhite
			constraints:{top:[thumbnail, 30], leading:80, trailing:10}
			

		Utils.delay .3 * (layer.index - 1), ->
			layer.animate
				properties:(opacity:1)
				time:.5	
		
		layer.on Events.Click, ->
			for c in cards
				c.ignoreEvents = true
			bar.ignoreEvents = true
			
			view = new Layer backgroundColor:blackBlue
			view.constraints = {top:0, bottom:nav, leading:0, trailing:0}
			view.y = m.device.height
			view.animate
				properties:(y:0)
				time:.5
			m.layout.set(view)

			video = new m.Video 
				max:true
				video:layer.data.video
				progressColor:"red600"
				showPlayStop: false
				superLayer:view
				backgroundColor:"black"
				image: layer.data.thumbnail
				
			m.addToStack(view)
			
			details = new Layer backgroundColor:blackBlue, superLayer:view
			details.constraints = {top:video, leading:0, trailing:0, bottom:0}
			
			hideDetails = ->
				details.visible = false
			showDetails = ->
				Utils.delay .5, -> details.visible = true
				
			video.onFullScreen = hideDetails
			video.onFullScreenExit = showDetails

			videoTitle = new m.Text
				constraints:{top:20, leading:17}
				text:layer.data.title
				fontSize:18
				superLayer:details
			videoViewCount = new m.Text
				constraints:{top:[videoTitle, 20], leading:17}
				text:layer.data.views + " views"
				fontSize:14
				color:"grey"
				superLayer:details
			thumbsUpIcon = new m.Icon
				name:"thumb_up"
				superLayer:details
				color:"grey700"
				constraints: {top:[videoViewCount, 20], leading:17}
			thumbsUpCount = new m.Text
				color:"grey700"
				text:layer.data.thumbs_up
				constraints:{verticalCenter:thumbsUpIcon, leading:[thumbsUpIcon, 10]}
				fontSize:14
				superLayer:details
			thumbsDownIcon = new m.Icon
				name:"thumb_down"
				superLayer:details
				color:"grey700"
				constraints: {verticalCenter:thumbsUpIcon, leading:[thumbsUpCount, 20]}
			thumbsDownCount = new m.Text
				color:"grey700"
				text:layer.data.thumbs_down
				constraints:{verticalCenter:thumbsDownIcon, leading:[thumbsDownIcon, 10]}
				fontSize:14
				superLayer:details
			shareIcon = new m.Icon
				name:"reply"
				superLayer:details
				color:"grey700"
				constraints: {verticalCenter:thumbsUpIcon, leading:[thumbsDownCount, 20]}
				
			topDivider = new Layer superLayer:details, backgroundColor:m.color("grey200")
			topDivider.constraints = {top:[thumbsUpIcon, 20], leading:0, trailing:0, height:1}
			bottomDivider = new Layer superLayer:details, backgroundColor:m.color("grey200")
			bottomDivider.constraints = {top:[topDivider, 70], leading:0, trailing:0, height:1}
			
			m.layout.set()			
			profileIcon = new Layer 
				superLayer:details
				image:layer.data.profile_pic
				borderRadius:m.px(50)
			profileIcon.constraints = {top:[topDivider, 15], leading:17, height:40, width:40}
			
			m.layout.set()		
			
			authorTitle = new m.Text
				constraints:{topEdges:profileIcon, leading:[profileIcon, 10]}
				text:layer.data.author	
				superLayer:details
			subs = new m.Text
				constraints:{top:[authorTitle, 5], leading:[profileIcon, 10]}
				text:layer.data.subs + " subscribers"
				superLayer:details
				fontSize:14
				color:"grey"
		return layer
	
# 	button = new m.Button 
# 		constraints:{align:"center"}
# 		type:"floating"
# 		icon:"videocam"
# 		color:"white"
# 		text:"download"
# 		backgroundColor:"red600"
# 		clip:true
	
	for i in [0...4]
		post = new card
		if cards.indexOf(post) == 0
			post.constraints.top = 0
		else
			post.constraints.top = [cards[cards.indexOf(post) - 1], 1]
		post.constraints.leading = 0
		post.constraints.trailing = 0
			
		m.layout.set(post)
	m.layout.set()
	home.contentInset = {top: 0, right: 0, bottom: m.px(150), left: 0}
	home.updateContent()

# m.layout.set()
# loadTable("home", home)

#Main()
bar.menu.on Events.TouchEnd, ->
	toggleMenuOn(!menuOpened)

search_icon.on Events.TouchEnd, ->
	searchView.bringToFront()

bar.tabs["notifications"].on Events.TouchEnd, ->
	notificationsView.bringToFront()
	
bar.tabs["account"].on Events.TouchEnd, ->
	accountView.bringToFront()