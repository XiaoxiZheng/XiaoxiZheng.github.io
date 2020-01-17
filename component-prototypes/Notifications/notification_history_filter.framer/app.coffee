# SETTINGS
{DynamicLoader} = require "DynamicLoader"
InputModule = require "input"
# exports.mapboxgl = require "mapbox-gl"
# {mapboxgl} = require "npm"
document.body.style.cursor = "auto"
Framer.Defaults.Layer.force2d = true
# Framer.Extras.Hints.enable()

highCharts = ['//code.highcharts.com/highcharts.js','//code.highcharts.com/modules/data.js','//code.highcharts.com/modules/exporting.js','//code.highcharts.com/highcharts-more.js']

# mapboxgl.accessToken = 'pk.eyJ1IjoiZW1vbnRlcnJ1YmlvIiwiYSI6ImNqMmhzbndwNzAwbzYyd3J4OGp1MGx3cTcifQ.bnnjH6UalCsXKym6IUKukw'
	
dashboardWidth = 1280

tableData = JSON.parse Utils.domLoadDataSync "tableData.json"
searchResultsData = JSON.parse Utils.domLoadDataSync "searchResultsData.json"
notificationsData = JSON.parse Utils.domLoadDataSync "notificationsData.json"

# COUNTER OPTIONS
options =
	useEasing : true, 
	useGrouping : true, 
	separator : '', 
	decimal : '.', 
	prefix : '', 
	suffix : ''

# ANIMATION CURVES
animateIn = "spring(750,60,50)"
animateOut = "spring(750,65,30)"

# BLUE SHADES
blue01 = "#0D1418" # background dark
blue02 = "#012939" # header
blue03 = "#065769"
blue04 = "#09819C"
blue05 = "#8BD6FF"

blue06 = "#006F87" # Global overlay color
# BASE COLORS
blue = '#00CCFF'
green = '#33FF00'
lemon = "#C5FF00"
yellow = '#FFC107'
red = "#ED2B2A"
orange = "#FF7900"
gray = "#555555"

blueGrey = "#E2E8ED"
highlightColor = blue04 

white = "#FFFFFF"
black = "#0D1A21"


# Dark/Light mode tracking
darkMode = false 
bgColor = white
defaultFontColor = blue04


Screen.backgroundColor = bgColor
# CSS STYLES
Utils.insertCSS ("
	section {border-top:1px solid #000; margin:15px 15px 0 15px; width:210px; padding:0; font-size:14px;}
	section.selectTag {border-top:1px solid #000; margin-top: 1rem;}
	hr {
		display: block;
		height: 1px;
		border: 0;
		border-top: 1px solid #000;
		margin: 1em 0;
		padding: 0; 
	}
	h2 {font-size:14px; margin:5px 12px 0 12px; padding-top:10px;}
	h2 > span, li > span {float:right;}
	.pill {color: #FFF; font-size: 12px; line-height: 2.2; padding: 0 10px 0 12px; background-color: #09819C; border-radius: 20px; height: 25px; display:inline-block;}
	.close {background: url('images/close-icon.svg') right center no-repeat; background-size:cover; display:inline-block; width:10px; float:right; margin:8px 0 0 10px; height:10px;}
	.check-wrapper {position:relative; background-color:#fff; color:#09819C; border-bottom:1px solid #8BD6FF; padding: 5px 0;}
	.check-wrapper input {position:absolute; z-index: 2; top:12px; left:12px;}
	label {padding-left:35px;}
	.more-btn {display:block; float:right; color:#09819C; margin:0 12px 0 0;}
	.blueQuote {color:#6BC0D3;}
	.rowBody {color: #2477b2; font-size:13px; line-height:15px; font-weight:400; font-family:GE Inspira Sans;}
	a {text-decoration: none; color:#2477b2;}
	.rowContent {color:#343A40; font-size: 13px; line-height:15px; font-weight:400; font-family:GE Inspira Sans; text-align:right; float:right;}
	.rowHeader {color:#343A40; font-size:14px; line-height:16px; font-weight:500; font-family:GE Inspira Sans;}
	.rowEntry {font-size: 15px; font-family:GE Inspira Sans; line-height: 2.8; padding: 5px 0px 0px 0px;}
	.analysisLabel {font-size: 12px; font-family:GE Inspira Sans; line-height: 2.5; padding: 0px 0px 0px 45px;}
	.rowCircle{font-size: 18px; padding: 4px 0 0 0;}
	.columnHeader {font-size:12px; line-height: 2.8; text-transform: uppercase; padding: 0px 0px 0px 10px;}
	.headerBorder {border: 1px solid #09819C;}
	.alignRight {text-align:right; float:right;}
	.alignLeft {text-align:left;}
	.metric {color:#868E96; line-height:20px;}
	.row {width:160px; display:block; margin-bottom:3px;}
	.rowWide{width: 220px; display:block; margin-bottom:3px;}
	.label {z-index: 1;}
	.greenLegend {color:white; font: 12px GE Inspira Sans; line-height:1.5rem; padding: 0 0.5rem; background-color:#2F373C; border-left:4px solid #33FF00;}
	.waterLegend {color:white; font: 12px GE Inspira Sans; line-height:1.5rem; padding: 0 0.5rem; background-color:#2F373C; border-left:4px solid #00CCFF;}
	.gasLegend {color:white; font: 12px GE Inspira Sans; line-height:1.5rem; padding: 0 0.5rem; background-color:#2F373C; border-left:4px solid #FF7900;}
	.marker{cursor:pointer; width:17px; height:21px;}
	.mapboxgl-popup {max-width:200px; font:15px 'GE Inspira Sans'; color:black;}
	ul {list-style:none;}
	li {font-size: 15px; font-family:GE Inspira Sans; color:#09819C; padding:5px 12px; border:none;}
	
	ul.selectMenu {margin-top:4px; height: 30px; width: 120px; color:#fff; font:15px GE Inspira Sans; background-color: #065769;}
	ul.selectMenu li {padding:5px 15px; z-index: 2; list-style:none;}
	ul.selectMenu li:not(.init) {float: left; width:90px; display:none; background-color:#666; }
	ul.selectMenu li:not(.init):hover, ul li.selected:not(.init) { background: #09f; }
	ul.selectMenu li.init {cursor:pointer;}
	.dots {padding: 5px 10px; list-style:none;}
	.dots li { position:relative;}
	.dots li > span {color:#fff;  margin-left:5px; font-size:14px; position:absolute; top:2px; left:25px;}
")
#FACETED PANEL
facetWidth = 240

notificationFacetContainer = new Layer
	parent: facetFrame
	y: 10
# 	size: facetFrame
	width: facetFrame.width 
	height: Screen.height
	backgroundColor: null
	opacity: 1
	
drawNotificationFacetedPanel = () ->
	notificationFacetContainer.selectedTags = new Layer
		parent: notificationFacetContainer
		color: black
		backgroundColor: null
	notificationFacetContainer.selectedTags.html = '<section class="selectTag">
		<p>SELECTED TAGS</p>
		<p class="pill">ESP<span class="close"></span></p>
		<p class="pill">Total Liquid<span class="close"></span></p>
		<p class="pill">Oil Production<span class="close"></span></p>
		<p class="pill">BBL/Day<span class="close"></span></p>
		</section>'
			
	notificationFacetContainer.type = new Layer
		parent: notificationFacetContainer
		color: black		
		backgroundColor: null
		y: 140
	notificationFacetContainer.type.html = '<section>
		<p>NOTIFICATION TYPE</p>
		<ul>
			<div class="check-wrapper">
				<input type="checkbox"><label>ALL</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Alerts</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Cases</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Recommendations</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Others</label>
			</div>
		</ul>
		<a class="more-btn">more</a>
		</section>'
		
			
	notificationFacetContainer.kpis = new Layer
		parent: notificationFacetContainer
		color: black
		backgroundColor: null
		y: 400
	notificationFacetContainer.kpis.html = '<section>
		<p>KPIS</p>
		<form>
			<div class="check-wrapper">
				<input type="checkbox"><label>Total Liquid</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Oil Prodction</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Water Prodcution</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Gas Produciton</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Uptime</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Water Cut</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Operational Expenditure</label>
			</div>
		</form>
		<a class="more-btn">more</a>
		</section>'
	
	notificationFacetContainer.applyBtn = new Layer
		parent: notificationFacetContainer
		x: 15
		y: notificationFacetContainer.height - 150
		width: 215
		height: 40
		backgroundColor: blue04
		opacity: 0.5
	applyBtnText = new TextLayer
		parent: notificationFacetContainer.applyBtn
		text: "APPLY"
		width: 215
		y: 12
		color: white
		textAlign: "center"
		font: "400 15px/1 -apple-system, GE Isnpira Sans"
	
	notificationFacetContainer.applyBtn.onClick ->
		trimDataRandomly()
		
	notificationFacetContainer.applyBtn.onMouseOver ->
		document.body.style.cursor = "pointer"
	notificationFacetContainer.applyBtn.onMouseOut ->
		document.body.style.cursor = "auto"
			
notificationFacetContainer.onClick ->
	notificationFacetContainer.applyBtn.animate
		opacity: 1

#------------------------------#
#      LIST VIEW         	   #
#------------------------------#
listViewScroll = new ScrollComponent
	parent: notification_contentFrame
	width: notification_contentFrame 
	height: Screen.height
	opacity: 0
	visible: false
	
listViewScroll.scrollHorizontal = false
listViewScroll.contentInset = bottom: 100
listViewScroll.mouseWheelEnabled = true

#------------------------------#	
#          SCROLL BAR          #
#------------------------------#
scrollBar = new SliderComponent 
	parent: listViewScroll.content
	width: 10, height: listViewScroll.height - 10
	x: listViewScroll.width - 10
	min: 0, max: 100, value: 0
	backgroundColor: null
	clip: true
	visible: false
scrollBar.centerY()
scrollBar.fill.backgroundColor = null

# Style the knob of the slider
scrollBar.knob.props = 
	width: 10, height: 80, y: 10
	backgroundColor: "rgba(255,255,255,0.5)"
	borderRadius: 50
	clip: false
	
# Connect the slider to the scroll event
listViewScroll.on Events.Move, ->	
	scrollBar.value = Utils.modulate(listViewScroll.scrollY, [0, listViewScroll.content.height - listViewScroll.height], [0, 100], true)
	
updatePosition = -> 	
	scrollValue = Utils.modulate(scrollBar.value, [0, 100], [0, listViewScroll.content.height - listViewScroll.height], true)
	listViewScroll.scrollY = scrollValue

scrollBar.onMouseDown ->
	@on "change:value", updatePosition
			
scrollBar.onMouseUp -> 
	@off "change:value", updatePosition
	
#------------------------------#	
#          DATA TABLE          #
#------------------------------#
resultsLabel = new TextLayer
	parent: listViewScroll.content
	x: 20
	text: "ALL RESULTS"
	fontSize: 12
	fontFamily: "GE Inspira Sans"
	color: defaultFontColor
	opacity: 0
	
resultsTableContainer = new Layer
	parent: listViewScroll.content
	color: defaultFontColor
	width: contentFrame.width, height: contentFrame.height
	x: 20
	backgroundColor: white
	
rowContent = []
			
drawListView = (b_index, end_index) ->
# 	for i in [0...rowContent.length]
# 		rowContent[i].destroy()
	for i in [b_index...end_index]
# 	for row, i in notificationsData
		rowContent[i] = new Layer
			width: contentFrame.width, height: 60
			y: 20 + (62 * i + 1) 
			backgroundColor: null #"transparent" #blue02
			parent: resultsTableContainer
			shadowColor: blue04 #?
			shadowY: 1
			opacity: 0
# 			animationOptions:
# 				curve: Bezier(0.3, 0, 0.3, 1)
# 				time: 0.1
		
		rowContent[i].assetName = notificationsData[i].notificationName
		rowContent[i].tags = notificationsData[i].notificationContent
		
# 		rowContent.push(tableData[i])
	# 	print rowContent.length
		iconEntry = new Layer
			parent: rowContent[i]
			x: 15
			y: 10
			width: 40, height: 40 
			image: "images/Notifications/icons/" + Math.floor(Utils.randomNumber(1,5)) + ".svg"
			
		assetNameEntry = new TextLayer
			parent: rowContent[i]
			x: iconEntry.x + iconEntry.width + 15, y: 10
			text: notificationsData[i].notificationName
			fontSize: 18
			fontFamily: "GE Inspira Sans"
			color: defaultFontColor
		
		assetTags = new Layer
			parent: rowContent[i]
			width: contentFrame.width - 50
			x: iconEntry.x + iconEntry.width + 15, y: 35
			backgroundColor: null
			color: black
			html: '<div style="font-size:12px; font-family:GE Inspira Sans; padding: 0 0; line-height: 1.3;"><span>' + notificationsData[i].notificationContent + '</span></div>'
			
		overflowIcon = new Layer
			parent: rowContent[i]
			width: 14, height: 13
			x: resultsTableContainer.width - 35, y: 18
			backgroundColor: null
		overflowIcon.html = """
		<svg width="4px" height="20px" viewBox="0 0 4 20">
		    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
		        <g id="search-results-dark" transform="translate(-725.000000, -480.000000)" fill="#09819C">
		            <g id="search-results" transform="translate(255.000000, 100.000000)">
		                <g id="featured-results" transform="translate(5.000000, 88.000000)">
		                    <g id="featured" transform="translate(0.000000, 32.000000)">
		                        <g id="esp" transform="translate(15.000000, 25.000000)">
		                            <g id="overflow-copy-2" transform="translate(450.000000, 235.000000)">
		                                <path d="M2,12 C3.1045695,12 4,11.1045695 4,10 C4,8.8954305 3.1045695,8 2,8 C0.8954305,8 0,8.8954305 0,10 C0,11.1045695 0.8954305,12 2,12 Z M2,4 C3.1045695,4 4,3.1045695 4,2 C4,0.8954305 3.1045695,0 2,0 C0.8954305,0 0,0.8954305 0,2 C0,3.1045695 0.8954305,4 2,4 Z M2,20 C3.1045695,20 4,19.1045695 4,18 C4,16.8954305 3.1045695,16 2,16 C0.8954305,16 0,16.8954305 0,18 C0,19.1045695 0.8954305,20 2,20 Z" id="overflow-icon"></path>
		                            </g>
		                        </g>
		                    </g>
		                </g>
		            </g>
		        </g>
		    </g>
		</svg>
		"""
		# RUN ANALYSIS BTN
		runAnalysisBtn = new Layer
			parent: rowContent[i]
			width: 100, height: 35
			x: resultsTableContainer.width - 170, y: 14
			backgroundColor: blue04
			html: "Run Analysis"
			borderColor: blue01 #?
			borderWidth: 1
			color: white
		runAnalysisBtn.style =
			fontSize: "14px"
			fontFamily: "GE Inspira Sans"
			padding: "3px 0 0 12px"
# 			color: "white"
		
		rowContent[i].states =
			display:
				opacity: 1
				y: 0 + (62 * i + 1)
				options:
					delay: 0.02 * i
					curve: Bezier.easeIn
					time: 0.2
			hide:
				opacity: 0
# 				y: 5 + (62 * i + 1)
				options:
					curve: Bezier.easeOut
					time: 0.3
					
		runAnalysisBtn.on Events.MouseOver, (event, layer) ->
			document.body.style.cursor = "pointer"
			this.backgroundColor = blue03
			
		runAnalysisBtn.on Events.MouseOut, (event, layer) ->
			document.body.style.cursor = "auto"
			this.backgroundColor = blue04
		
		#-------------------------------------#	
		#          ROW HOVER ACTIONS          #
		#-------------------------------------#
		rowContent[i].on Events.MouseOver, (event, layer) ->
			document.body.style.cursor = "pointer"
			this.backgroundColor = "#F3FAFF"
			
		rowContent[i].on Events.MouseOut, (event, layer) ->
			document.body.style.cursor = "auto"
			this.backgroundColor = bgColor
#Animation
animateListViewComponents = () ->
# 	facets.animate
# 		opacity: 1
# 		options: 
# 			curve: Bezier(0.3, 0, 0.3, 1)
# 			time: 1		
	notifications_subHeader.animate
		opacity: 1
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.5
			
	# Utils.delay 0.1, ->
	listViewScroll.visible = true
	listViewScroll.animate
		opacity: 1
		options: 
			curve: Bezier.easeInOut
			time: 0.2
							
	Utils.delay 0.1, ->
		# TABLE STACKING
		for j in [0...rowContent.length]
			rowContent[j].animate("display")
					 				
	# 	Utils.delay 0.1, ->
	# 	for k in [5..15]
	# 		rowContent[k].animate
	# 			opacity: 1
	# 			y: 0 + (62 * k + 1)
	# 	# 				options:
	# 	# 					delay: 0.02 * k
	# 			animationOptions:
	# 				curve: Bezier(0.3, 0, 0.3, 1)
	# 				time: 0.1		

animateSearchResultItems = (beg_index, end_index) ->
	for j in [beg_index...end_index]
		rowContent[j].animate("display")
#Methods
#Data Trim
trimDataRandomly = () ->
	indexToBeRemove = Math.floor(Utils.randomNumber(0,notificationsData.length))
	rangeTobeRemove = Math.floor(Utils.randomNumber(0, notificationsData.length/2))
	# 	print "indexToBeRemove: " + indexToBeRemove
	# 	print "rangeTobeRemove: " + rangeTobeRemove
		
	if indexToBeRemove+rangeTobeRemove < notificationsData.length
		for i in [indexToBeRemove...indexToBeRemove+rangeTobeRemove]
			rowContent[i].animate("hide")
	
		notificationsData.splice(indexToBeRemove,rangeTobeRemove)
		rowContent.splice(indexToBeRemove,rangeTobeRemove)
	
		#Animate the updated y position after splicing data
		Utils.delay 0.2, ->
			for i in [indexToBeRemove...rowContent.length]
				rowContent[i].animate
					y: (62 * i + 1)
					options:
						curve: Bezier.easeIn
						time: 0.2
# Main() #
drawNotificationFacetedPanel()
drawListView(0,notificationsData.length)
animateListViewComponents() 


