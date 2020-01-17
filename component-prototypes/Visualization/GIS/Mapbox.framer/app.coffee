# {Scene, Light, Model} = require "framer-form/form"
control_panel.bringToFront()
heatmap = false
#Configuration
##Sample Data
maxValue = 13;
data = [
	{"STATE_ID": "01", "unemployment": 13.17},
	{"STATE_ID": "02", "unemployment": 9.5},
	{"STATE_ID": "04", "unemployment": 12.15},
	{"STATE_ID": "05", "unemployment": 8.99},
	{"STATE_ID": "06", "unemployment": 11.83},
	{"STATE_ID": "08", "unemployment": 7.52},
	{"STATE_ID": "09", "unemployment": 6.44},
	{"STATE_ID": "10", "unemployment": 5.17},
	{"STATE_ID": "12", "unemployment": 9.67},
	{"STATE_ID": "13", "unemployment": 10.64},
	{"STATE_ID": "15", "unemployment": 12.38},
	{"STATE_ID": "16", "unemployment": 10.13},
	{"STATE_ID": "17", "unemployment": 9.58},
	{"STATE_ID": "18", "unemployment": 10.63},
	{"STATE_ID": "19", "unemployment": 8.09},
	{"STATE_ID": "20", "unemployment": 5.93},
	{"STATE_ID": "21", "unemployment": 9.86},
	{"STATE_ID": "22", "unemployment": 9.81},
	{"STATE_ID": "23", "unemployment": 7.82},
	{"STATE_ID": "24", "unemployment": 8.35},
	{"STATE_ID": "25", "unemployment": 9.1},
	{"STATE_ID": "26", "unemployment": 10.69},
	{"STATE_ID": "27", "unemployment": 11.53},
	{"STATE_ID": "28", "unemployment": 9.29},
	{"STATE_ID": "29", "unemployment": 9.94},
	{"STATE_ID": "30", "unemployment": 9.29},
	{"STATE_ID": "31", "unemployment": 5.45},
	{"STATE_ID": "32", "unemployment": 4.21},
	{"STATE_ID": "33", "unemployment": 4.27},
	{"STATE_ID": "34", "unemployment": 4.09},
	{"STATE_ID": "35", "unemployment": 7.83},
	{"STATE_ID": "36", "unemployment": 8.01},
	{"STATE_ID": "37", "unemployment": 9.34},
	{"STATE_ID": "38", "unemployment": 11.23},
	{"STATE_ID": "39", "unemployment": 7.08},
	{"STATE_ID": "40", "unemployment": 11.22},
	{"STATE_ID": "41", "unemployment": 6.2},
	{"STATE_ID": "42", "unemployment": 9.11},
	{"STATE_ID": "44", "unemployment": 10.42},
	{"STATE_ID": "45", "unemployment": 8.89},
	{"STATE_ID": "46", "unemployment": 11.03},
	{"STATE_ID": "47", "unemployment": 7.35},
	{"STATE_ID": "48", "unemployment": 8.92},
	{"STATE_ID": "49", "unemployment": 7.65},
	{"STATE_ID": "50", "unemployment": 8.01},
	{"STATE_ID": "51", "unemployment": 7.62},
	{"STATE_ID": "53", "unemployment": 7.77},
	{"STATE_ID": "54", "unemployment": 8.49},
	{"STATE_ID": "55", "unemployment": 9.42},
	{"STATE_ID": "56", "unemployment": 7.59}
];
{DynamicLoader} = require "DynamicLoader"
{ mapboxgl } = require "npm"
DynamicLoader.add('https://api.tiles.mapbox.com/mapbox-gl-js/v0.45.0/mapbox-gl.js').then(->
	Utils.insertCSS('@import url(https://api.tiles.mapbox.com/mapbox-gl-js/v0.43.0/mapbox-gl.css)')
mapboxgl.accessToken = 'pk.eyJ1Ijoic2hvdXNoMDcxMyIsImEiOiJjajlkbjV2NnoyMXk0Mndyd2VxZzZoamExIn0.mCb1fxBHCfPEUabFLcnm_Q'
##Mapbox
mapLayer = new Layer
	parent: MapboxFrame
	width: MapboxFrame.width
	height: MapboxFrame.height
	html : "<div id='map'></div>"

visualizationLayer = new Layer
	parent: mapLayer
	backgroundColor: "transparent"
	width: MapboxFrame.width
	height: MapboxFrame.height

mapElement = mapLayer.querySelector("#map")
mapElement.style.height = mapLayer.height + 'px'
mapLayer.ignoreEvents = false
	
map = new mapboxgl.Map
	backgroundColor: "transparent"
	container: mapElement
	zoom: 6
	pitch: 0
	center: [-96.132,34.823]
	# Add Mapbox style url
	style: 'mapbox://styles/mapbox/light-v9'
mapNav = new mapboxgl.NavigationControl();
map.addControl(mapNav, 'bottom-right')

decideMapLayout = () ->
	if heatmap #if heatmap is set to on
		map.setLayoutProperty('heatmap', 'visibility', 'visible');
		map.setLayoutProperty('bar', 'visibility', 'visible');
	else #if heatmap is set to off
		map.setLayoutProperty('heatmap', 'visibility', 'none');
		map.setLayoutProperty('bar', 'visibility', 'none');
#Inite Function
map.on 'load', ->
	addHeatMapLayer()
# 	addBarChartLayer()
	decideMapLayout()
	return
)
popup = new mapboxgl.Popup({
# 	offset: 25
	closeButton: false
	closeOnClick: false
})


addBarChartLayer = ->
# 	map.loadImage 'images/oil_water_kpi_' + Math.floor(Utils.randomNumber(1,5)) + '.png', (error, image) ->
# 		if error
# 			throw error
# 		map.addImage 'kpi', image
# 		map.addLayer
# 			'id': 'bar'
# 			'type': 'symbol'
# 			'source': 
# 				'type': 'geojson'
# 				'data':
# 					'type': 'FeatureCollection'
# 					'features': [ {
# 						'type': 'Feature'
# 						'geometry':
# 							'type': 'Point'
# 							'coordinates': [
# 								-97
# 								35
# 							]
# 					} ]
# 			'layout':
# 				'icon-image': 'kpi'
# 				'icon-size': 0.8
# 	
# 	map.loadImage 'images/oil_water_kpi_' + Math.floor(Utils.randomNumber(1,5)) + '.png', (error, image) ->
# 		if error
# 			throw error
# 		map.addImage 'kpi1', image
# 		map.addLayer
# 			'id': 'bar1'
# 			'type': 'symbol'
# 			'source': 
# 				'type': 'geojson'
# 				'data':
# 					'type': 'FeatureCollection'
# 					'features': [ {
# 						'type': 'Feature'
# 						'geometry':
# 							'type': 'Point'
# 							'coordinates': [
# 								-96.8
# 								32.77
# 							]
# 					} ]
# 			'layout':
# 				'icon-image': 'kpi1'
# 				'icon-size': 0.8
				
	map.loadImage 'images/oil_kpi_bar_group_' + Math.floor(Utils.randomNumber(1,5)) + '.png', (error, image) ->
		if error
			throw error
		map.addImage 'kpi_group', image
		map.addLayer
			'id': 'bar'
			'type': 'symbol'
			'source': 'states'
			'source-layer': 'states'
			'layout':
				'icon-image': 'kpi_group'
				'icon-size': 0.8
	
# 	map.loadImage 'images/oil_kpi_bar_group.png', (error, image) ->
# # 	map.loadImage 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Cat_silhouette.svg/400px-Cat_silhouette.svg.png', (error, image) ->
# 		if error
# 			throw error
# 		map.addImage 'kpi', image
# 		map.addLayer
# 			'id': 'bar'
# 			'type': 'symbol'
# 			'source':
# 				'type': 'geojson'
# 				'data':
# 					'type': 'FeatureCollection'
# 					'features': [ {
# 						'type': 'Feature'
# 						'geometry':
# 							'type': 'Point'
# 							'coordinates': [
# 								-97
# 								35
# 							]
# 					} ]
# 			'layout':
# 				'icon-image': 'kpi'
# 				'icon-size': 0.5
		return
addHeatMapLayer = ->
	# Add source for state polygons hosted on Mapbox, based on US Census Data:
	# https://www.census.gov/geo/maps-data/data/cbf/cbf_state.html
	map.addSource 'states',
		type: 'vector'
		url: 'mapbox://mapbox.us_census_states_2015'
	expression = [
		'match'
		[
			'get'
			'STATE_ID'
		]
	]
	# Calculate color for each state based on the unemployment rate
	data.forEach (row) ->
		red = row['unemployment'] / maxValue * 255
		color = 'rgba(' + red + ', ' + red+(Math.floor(Utils.randomNumber(-50,50))) + ', ' + 255 + ', 1)'
		expression.push row['STATE_ID'], color
		return
	# Last value is the default, used where there is no data
	expression.push 'rgba(0,0,0,0)'
	# Add layer from the vector tile source with data-driven style
	map.addLayer {
		'id': 'heatmap'
		'type': 'fill'
		'source': 'states'
		'source-layer': 'states'
		'paint': 'fill-color': expression
	},'waterway-label'
	
	map.loadImage 'images/oil_marker.png', (error, image) ->
		if error
			throw error
		map.addImage 'oil_marker', image
		map.addLayer
			'id': 'marker'
			'type': 'symbol'
			'source': 'states'
			'source-layer': 'states'
			'layout':
				'icon-image': 'oil_marker'
				'icon-size': 0.5

# map.on 'mouseenter', 'marker', (e) ->
# 	# Change the cursor style as a UI indicator.
# 	map.getCanvas().style.cursor = 'pointer'
# 	coordinates = e.features[0].geometry.coordinates.slice()
# 	description = e.features[0].properties.description
# 	# Ensure that if the map is zoomed out such that multiple
# 	# copies of the feature are visible, the popup appears
# 	# over the copy being pointed to.
# 	while Math.abs(e.lngLat.lng - (coordinates[0])) > 180
# 		coordinates[0] += if e.lngLat.lng > coordinates[0] then 360 else -360
# 	# Populate the popup and set its coordinates
# 	# based on the feature found.
# 	popup.setLngLat(coordinates).setHTML(description).addTo map
# 	return
# map.on 'mouseleave', 'places', ->
# 	map.getCanvas().style.cursor = ''
# 	popup.remove()
# return

#3D Bar
# bar = new Layer
# 	width: 25, height: 250
# 	borderRadius: 5
# 	backgroundColor: "#A0D86D"
# 	clip: false
# 	rotationX: 30
# 	rotationY: 30
# bar.style["-webkit-transform-style"] = "preserve-3d"
# bar.center()
# bar.draggable.enabled = true
# bar.draggable.speedX = 0
# bar.draggable.speedY = 0
# bar.on Events.DragMove, (e) ->
# 	@rotationX = -e.clientY/2
# 	@rotationY = -e.clientX/2
# top = new Layer
# 	height: 200
# 	width: 200
# 	superLayer: bar
# 	rotationX: 90
# 	z: -100
# 	originY: 0
# 	backgroundColor: "green"
# 	opacity: 0.9
# 
# left = new Layer
# 	height: 200
# 	width: 200
# 	superLayer: bar
# 	rotationY: -90
# 	z: -100
# 	originX: 0
# 	backgroundColor: "blue"
# 	opacity: 0.9
# 
# right = new Layer
# 	height: 200
# 	width: 200
# 	superLayer: bar
# 	rotationY: 90
# 	z: -100
# 	originX: 1
# 	backgroundColor: "yellow"
# 	opacity: 0.9
# 
# bottom = new Layer
# 	height: 200
# 	width: 200
# 	superLayer: bar
# 	rotationX: -90
# 	originY: 1
# 	z: -100
# 	backgroundColor: "purple"
# 	opacity: 0.9
# 	
# front = new Layer
# 	width: 200
# 	height: 200
# 	superLayer: bar
# 	z: -100
# 	backgroundColor: "red"
# 	opacity: 0.9
# 	
# back = new Layer
# 	width: 200
# 	height: 200
# 	superLayer: bar
# 	z: 100
# 	backgroundColor: "pink"
# 	opacity: 0.9

#2D Bar Group
barArray = []
barWidth = 10
barHeight = 150
createBar = (num, initX, initY) ->
	for i in [0...num]
		randomNumber = Utils.randomNumber(-50,50)
		bar	= new Layer
			parent: visualizationLayer
			x: initX + 15 * i
			y: initY - randomNumber
			width: barWidth, height: barHeight + randomNumber
			borderRadius: 5
			backgroundColor: "#D667BD"
			clip: false
		barArray.push(bar)
			
#Interactions

#Dark/Light Mode
sun_on.onClick ->
	sun_on.opacity = 1
	moon.fill = "#808080"
	map.setStyle('mapbox://styles/mapbox/light-v9')
	Utils.delay 0.5, ->
		addHeatMapLayer()
		addBarChartLayer
		decideMapLayout()
moon.onClick ->
	sun_on.opacity = 0
	moon.fill = "#0A9CFF"
	map.setStyle('mapbox://styles/mapbox/dark-v9')
	Utils.delay 0.5, ->
		addHeatMapLayer()
		addBarChartLayer()
		decideMapLayout()
toggle_bg.onClick (event, layer) ->	
# 	addHeatMapLayer()
	if heatmap
		map.setLayoutProperty('heatmap', 'visibility', 'none');
		map.setLayoutProperty('bar', 'visibility', 'none');
		
		map.setLayoutProperty('marker', 'visibility', 'visible')
		map.setLayoutProperty('oil_marker', 'visibility', 'visible')
		toggle_bg.backgroundColor = "#808080"
		toggle_control.x = 2
		map.flyTo({
			speed: 0.5
			curve: 0.1
			pitch: 0
		})
	else #heatmpa layer isn't already on
		addBarChartLayer()
		map.setLayoutProperty('heatmap', 'visibility', 'visible');
		map.setLayoutProperty('bar', 'visibility', 'visible');
		
		map.setLayoutProperty('marker', 'visibility', 'none')
		map.setLayoutProperty('oil_marker', 'visibility', 'none')
		
		toggle_bg.backgroundColor = "#0A9CFF"
		toggle_control.x = 25
		map.flyTo({
			speed: 0.5
			curve: 0.1
			pitch: 100
		})
	heatmap=!heatmap
mapLayer.onDoubleClick ->
# # 	print event.x + "," + event.y
# 	createBar(5, event.x, event.y)

