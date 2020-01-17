#Global Configuration
control_panel.bringToFront()
production_opt = true
tooltip_bol = true
heatmap_bol = false
detail_3d_bol = false

data_config_panel = false
settings_panel = false
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
#Packages and Access Tokens
{DynamicLoader} = require "DynamicLoader"
{ mapboxgl } = require "npm"

# print mapboxgl.version 

DynamicLoader.add('https://api.tiles.mapbox.com/mapbox-gl-js/v0.45.0/mapbox-gl.js').then(->
	Utils.insertCSS('@import url(https://api.tiles.mapbox.com/mapbox-gl-js/v0.43.0/mapbox-gl.css)')
mapboxgl.accessToken = 'pk.eyJ1Ijoic2hvdXNoMDcxMyIsImEiOiJjajlkbjV2NnoyMXk0Mndyd2VxZzZoamExIn0.mCb1fxBHCfPEUabFLcnm_Q'

##Mapbox
mapLayer = new Layer
	parent: MapboxFrame
	width: MapboxFrame.width
	height: MapboxFrame.height
	html : "<div id='map'></div>"

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

decideMapLayout = (production_opt_) ->
	if production_opt
# 		map.setLayoutProperty('marker', 'visibility', 'visible')
# 		map.setLayoutProperty('oil_marker', 'visibility', 'visible')
		
		if heatmap_bol #if heatmap is set to on
			map.setLayoutProperty('heatmap', 'visibility', 'visible');
		else if heatmap_bol is false #if heatmap is set to off
			map.setLayoutProperty('heatmap', 'visibility', 'none');
		else if tooltip_bol #if heatmap is set to on
		else if tooltip_bol is false #if heatmap is set to off
		else if detail_3d_bol #if heatmap is set to on
			map.setLayoutProperty('bar', 'visibility', 'visible');
		else if detail_3d_bol is false #if heatmap is set to off
			map.setLayoutProperty('bar', 'visibility', 'none');
	else # production_opt is false
		map.setLayoutProperty('bar', 'visibility', 'none');
		map.setLayoutProperty('marker', 'visibility', 'none')
		map.setLayoutProperty('oil_marker', 'visibility', 'none')
		map.setLayoutProperty('heatmap', 'visibility', 'none');
#Inite Function
map.on 'load', ->
	addHeatMapLayer()
# 	addBarChartLayer()
	decideMapLayout()
	return
)

Utils.insertCSS ("
	.mapboxgl-popup {max-width:200px; font:15px 'GE Inspira Sans'; color: #3D5867;}
")
popup = new mapboxgl.Popup({
# 	offset: 25
	closeButton: false
	closeOnClick: false
})


addBarChartLayer = ->
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

#Map Interactions
map.on 'dblclick', (e) ->
	if detail_3d_bol
		map.doubleClickZoom.disable();
		map.flyTo({
			speed: 1
			curve: 0.5
			zoom: Math.floor(map.getZoom()) + 1
			pitch: 100
			center: [e.lngLat.lng, e.lngLat.lat]
		})
		Utils.delay 0.5, ->
			addBarChartLayer()
			map.setLayoutProperty('bar', 'visibility', 'visible');
			map.setLayoutProperty('marker', 'visibility', 'none')
			map.setLayoutProperty('oil_marker', 'visibility', 'none')
	else
		map.doubleClickZoom.enable();			
map.on 'mouseenter', 'marker', (e) ->
	# Change the cursor style as a UI indicator.
	if tooltip_bol
		map.getCanvas().style.cursor = 'pointer'
		popup.setLngLat(e.lngLat)
			.setHTML('<strong> Optimization Index: </strong>' + Math.floor(Utils.randomNumber(80,100)) + '</br><strong> Group Oil Production: </strong>' + Math.floor(Utils.randomNumber(150, 350)) + ' bbl/day'
			)
			.addTo(map)
	return
map.on 'mouseleave', 'marker', ->
	if tooltip_bol
		map.getCanvas().style.cursor = ''
		popup.remove()
	return

map.on 'mouseenter', 'bar', (e) ->
	# Change the cursor style as a UI indicator.
	if tooltip_bol
		map.getCanvas().style.cursor = 'pointer'
		popup.setLngLat(e.lngLat)
			.setHTML('<strong> Optimization Index: </strong>' + Math.floor(Utils.randomNumber(80,100)) + '</br><strong> Group Oil Production: </strong>' + Math.floor(Utils.randomNumber(150, 350)) + ' bbl/day'
			)
			.addTo(map)
	return
map.on 'mouseleave', 'bar', ->
	if tooltip_bol
		map.getCanvas().style.cursor = ''
		popup.remove()
	return

#Control Panel Interactions
##Main panel
additional_config_panel_bg.states = 
	default:
		height: 0
		options:
			curve: Bezier.easeOut
			time: 0.1
	data_config_panel:
		height: 230
		options:
			curve: Bezier.easeOut
			time: 0.1
	settings_panel:
		height: 128
		options:
			curve: Bezier.easeOut
			time: 0.1
updateTitleBar = (title) ->
	if title == "Data Configuration" || title == "Settings"
		#Toggle back icon
		back_icon.opacity = 1
		Search_icon.opacity = 0
		
		panel_title.text = title
		#Toggle close icon
		panel_toggle_icons.opacity = 0
		close_icon.opacity = 1
	else #Reset to main title bar only
		#Toggle back icon
		back_icon.opacity = 0
		Search_icon.opacity = 1
		
		panel_title.text = "Search Map"
		#Toggle close icon
		panel_toggle_icons.opacity = 1
		close_icon.opacity = 0
		
resetControlPanel = ->
	settings_panel = false
	data_config_panel = false
	
	updateTitleBar("Reset")
	GIS_on.opacity = 0
	gear_icon.fill = "#FFFFFF"
	
	additional_config_panel_bg.animate("default")
	data_config_content.opacity = 0
	settings_config_content.opacity = 0
	
close_icon.onMouseOver ->
	document.body.style.cursor = 'pointer'
close_icon.onMouseOut ->
	document.body.style.cursor = 'auto'		
close_icon.onClick ->
	resetControlPanel()
close_icon.onMouseOver ->
	document.body.style.cursor = 'pointer'
close_icon.onMouseOut ->
	document.body.style.cursor = 'auto'	
back_icon.onClick ->
	resetControlPanel()
#Data Configuration Interactions
GIS_on.onMouseOut ->
# 	if data_config_panel is false
	document.body.style.cursor = 'auto'
	GIS_on.animate
		opacity: 0
		options: 
			time: 0.1
GIS_on.onMouseOver ->
	document.body.style.cursor = 'pointer'
	GIS_on.animate
		opacity: 1
		options: 
			time: 0.1
GIS_on.onClick ->	
	if data_config_panel is false
		updateTitleBar("Data Configuration")
		
		settings_panel=!settings_panel
		
		gear_icon.fill = "#FFFFFF"
		GIS_on.animate
			opacity: 1
			options: 
				time: 0.1
		additional_config_panel_bg.animate("data_config_panel")
		data_config_content.opacity = 1
		settings_config_content.opacity = 0
	else
		updateTitleBar("Reset")
		
		GIS_on.animate
			opacity: 0
			options: 
				time: 0.1
		additional_config_panel_bg.animate("default")
		data_config_content.opacity = 0
		settings_config_content.opacity = 0
	
	data_config_panel=!data_config_panel

resetView.onMouseOut ->
	document.body.style.cursor = 'auto'
	resetView.style.color = "#FFFFFF"
resetView.onMouseOver ->
	document.body.style.cursor = 'pointer'
	resetView.style.color = "#0A9CFF"
resetView.onClick ->
	resetView.style.color = "808080"
	map.setLayoutProperty('marker', 'visibility', 'visible')
	map.setLayoutProperty('oil_marker', 'visibility', 'visible')
	
	map.setLayoutProperty('bar', 'visibility', 'none');
	map.flyTo({
		speed: 0.5
		curve: 0.1
		pitch: 0
	})
	
production_opt_toggle.onClick ->
	production_opt=!production_opt
	
	map.flyTo({
		speed: 0.5
		curve: 0.1
		pitch: 0
	})
	
	decideMapLayout(production_opt)
	
	if production_opt #if it's on
		production_opt_control.x = 25
		production_opt_bg.fill = "#0A9CFF"
		#Turn every sub sections off
		sub_menu.animate
			opacity: 1
			options: 
				time: 0.1
				curve: Bezier.easeOut
	else
		production_opt_control.x = 2
		production_opt_bg.fill = "#808080"
		sub_menu.animate
			opacity: 0.3
			options: 
				time: 0.1
				curve: Bezier.easeOut
				
tooltip_group_layer.onClick ->
	tooltip_bol=!tooltip_bol
	if tooltip_bol
		tooltip_check.opacity = 1
		tooltip_toggle_box.fill = "#0A9CFF"
		tooltip_toggle_box.stroke = "#0A9CFF"
	else
		tooltip_check.opacity = 0
		tooltip_toggle_box.fill = "#transparent"
		tooltip_toggle_box.stroke = "#B8B8B8"
		
heatmap_group_layer.onClick ->
	heatmap_bol=!heatmap_bol
	
	if heatmap_bol
		map.setLayoutProperty('heatmap', 'visibility', 'visible');
		heatmap_check.opacity  = 1
		heatmap_toggle_box.fill = "#0A9CFF"
		heatmap_toggle_box.stroke = "#0A9CFF"
	else	
		map.setLayoutProperty('heatmap', 'visibility', 'none');
		heatmap_check.opacity  = 0
		heatmap_toggle_box.fill = "transparent"
		heatmap_toggle_box.stroke = "#B8B8B8"
# 		map.setLayoutProperty('marker', 'visibility', 'none')
# 		map.setLayoutProperty('oil_marker', 'visibility', 'none')
detail_3d_group_layer.onClick (e) ->
	detail_3d_bol=!detail_3d_bol
	
	if detail_3d_bol
		detail_3d_check.opacity  = 1
		detail_3d_toggle_box.fill = "#0A9CFF"
		detail_3d_toggle_box.stroke = "#0A9CFF"
		map.flyTo({
			speed: 0.1
			curve: 0.5
			zoom: map.getZoom()
			pitch: 100
		})
# 		Utils.delay 0.5, ->
# 			addBarChartLayer()
# 			map.setLayoutProperty('bar', 'visibility', 'visible');
# 			map.setLayoutProperty('marker', 'visibility', 'none')
# 			map.setLayoutProperty('oil_marker', 'visibility', 'none')
	else
		map.flyTo({
			speed: 1
			curve: 0.5
			pitch: 0
		})
		map.setLayoutProperty('marker', 'visibility', 'visible')
		map.setLayoutProperty('oil_marker', 'visibility', 'visible')
		map.setLayoutProperty('bar', 'visibility', 'none');
		
		detail_3d_check.opacity  = 0
		detail_3d_toggle_box.fill = "#transparent"
		detail_3d_toggle_box.stroke = "#B8B8B8"
#Settings Interactions
gear_icon_container.onMouseOut ->
# 	if settings_panel is false
	document.body.style.cursor = 'auto'
	gear_icon.fill = "#FFFFFF"
gear_icon_container.onMouseOver ->
	document.body.style.cursor = 'pointer'
	gear_icon.fill = "#0A9CFF"
gear_icon_container.onClick ->	
	if settings_panel is false
		updateTitleBar("Settings")
		
		data_config_panel=!data_config_panel
			
		GIS_on.animate
			opacity: 0
			options: 
				time: 0.1
		additional_config_panel_bg.animate("settings_panel")
		data_config_content.opacity = 0
		settings_config_content.opacity = 1

	else
		updateTitleBar("Reset")
		
		gear_icon.fill = "#FFFFFF"
		additional_config_panel_bg.animate("default")
		settings_config_content.opacity = 0
		data_config_content.opacity = 0
		
	settings_panel=!settings_panel

sun_on.onMouseOver ->
	document.body.style.cursor = 'pointer'
sun_on.onMouseOut ->
	document.body.style.cursor = 'auto'
sun_on.onClick ->
	sun_on.opacity = 1
	moon.fill = "#808080"
	map.setStyle('mapbox://styles/mapbox/light-v9') #light,dark
	Utils.delay 0.5, ->
		addHeatMapLayer()
# 		addBarChartLayer
		decideMapLayout()
moon_container.onMouseOver ->
	document.body.style.cursor = 'pointer'
moon_container.onMouseOut ->
	document.body.style.cursor = 'auto'
moon_container.onClick ->
	sun_on.opacity = 0
	moon.fill = "#0A9CFF"
	map.setStyle('mapbox://styles/mapbox/dark-v9')
	Utils.delay 0.5, ->
		addHeatMapLayer()
# 		addBarChartLayer()
		decideMapLayout()



