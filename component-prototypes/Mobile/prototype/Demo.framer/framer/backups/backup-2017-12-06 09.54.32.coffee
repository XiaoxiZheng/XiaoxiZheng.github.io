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