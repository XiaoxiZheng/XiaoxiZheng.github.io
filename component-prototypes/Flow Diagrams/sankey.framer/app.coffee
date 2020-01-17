# {Highcharts} = require 'npm'
# {Sankey} = require 'npm'

# {Exporting} = require 'npm'
{DynamicLoader} = require "DynamicLoader"
# # 
DynamicLoader.add('https://code.highcharts.com/highcharts.js').then(->
	DynamicLoader.add('https://code.highcharts.com/modules/sankey.js').then(->
		DynamicLoader.add('https://code.highcharts.com/modules/exporting.js').then(->)
		)
)

# DynamicLoader.series(['https://code.highcharts.com/highcharts.js', 'https://code.highcharts.com/modules/sankey.js', 'https://code.highcharts.com/modules/exporting.js']).then(->).catch(->)

#              CHART CONTAINERS             #
groupProductionChartContainer = new Layer
	width: 1110, height: 355
	y: 0
	x: 0
	backgroundColor: null
groupProductionChartContainer.html = '<div id="groupProductionChartContainer" style="height:355px;"></div>'
groupProductionChartContainer.ignoreEvents = false

Utils.delay 1, ->
	dataViz = Highcharts.chart('groupProductionChartContainer',
		title: {text: 'Tag Correlation Sankey'},
		credits: {
			enabled: false
		},
		series: [{
			colors:[ '#5FBCF8', '#DA5661', '#E2DB6F', '#569103', '#AEDE85', '#945BEB', '#D54C89', '#AE3238', '#4F6AFF', '#BE7951', '#E2A2D8', '#676767', '#5584A9'],
			keys: ['from', 'to', 'weight'],
			data: [
# 				['inp_CDUBottomIBP', 'inp_CDUBottomIBP', 100],
# 				['inp_CDUBottomPressure', 'inp_CDUBottomIBP', 75.1499809],
				['inp_CDUDrumTemperature', 'inp_CDUBottomIBP', 45.9661114],
				['inp_CDUSSteam', 'inp_CDUBottomIBP', 8.5359198],
				['inp_CDUTopPressure', 'inp_CDUBottomIBP', 40.3659451],
	
# 				['inp_CDUBottomIBP', 'inp_CDUBottomPressure', 75.1499809],
				['inp_CDUDrumTemperature', 'inp_CDUBottomPressure', 54.7198538],
				['inp_CDUSSteam', 'inp_CDUBottomPressure', 47.9849401],
				['inp_CDUTopPressure', 'inp_CDUBottomPressure', 73.8431015],
	
# 				['Oil', 'Residential & Commercial', 17],
# 				['Natural Gas', 'Residential & Commercial', 76],
# 				['Coal', 'Residential & Commercial', 1],
# 				['Renewable', 'Residential & Commercial', 7],
# 				['Nuclear', 'Residential & Commercial', 0],
# 	
# 				['Oil', 'Electric Power', 1],
# 				['Natural Gas', 'Electric Power', 18],
# 				['Coal', 'Electric Power', 48],
# 				['Renewable', 'Electric Power', 11],
# 				['Nuclear', 'Electric Power', 22]		
			],
# 			nodes: [{
# 				id: 'Oil',
# 				color: '#666666'
# 			}, {
# 				id: 'Natural Gas',
# 				color: '#7cb5ec'
# 			}, {
# 				id: 'Coal',
# 				color: '#000000'
# 			}, {
# 				id: 'Renewable',
# 				color: '#90ed7d'
# 			}, {
# 				id: 'Nuclear',
# 				color: '#f7a35c'
# 			}],
			type: 'sankey',
			name: 'Sankey demo series'
		}]
	)

###
['inp_CDUBottomIBP', 'inp_CDUBottomIBP', 100 ],
['inp_CDUBottomPressure', 'inp_CDUBottomIBP', 75.1499809],
['inp_CDUDrumTemperature', 'inp_CDUBottomIBP', 45.9661114],
['inp_CDUSSteam', 'inp_CDUBottomIBP', 8.5359198],
['inp_CDUTopPressure', 'inp_CDUBottomIBP', 40.3659451 ],
['inp_CrudeAPercentage', 'inp_CDUBottomIBP', 7.2347528 ],
['inp_DesalterTemperature', 'inp_CDUBottomIBP', 62.7064922], 
['inp_DieselIBP', 'inp_CDUBottomIBP', 30.2533469 ],
###