#Script Loading
# {DynamicLoader} = require "DynamicLoader"
# ##Getting the D3 Script
# DynamicLoader.add('https://d3js.org/d3.v4.min.js')
	
#D3 LAYER
forceDirectedGraphLayer = new Layer
	parent: VisualizationFrame
	width: VisualizationFrame.width
	height: VisualizationFrame.height
	backgroundColor: null
	html: '<svg id="svg" style="position: absolute;" width="100%" height="100%" viewbox="0 0 #{VisualizationFrame.width} #{VisualizationFrame.height}"></svg>'
	custom:
		svg: null
		element: null
			
adjacencyMatrix = {
	1: [2,3,4,5,6]
	2: [1,3,4,5,6]
	3: [1,2,4,5,6]
	4: [1,2,3,5,6]
	5: [1,2,3,4,6]
	6: [1,2,3,4,5]
}

w = VisualizationFrame.width
h = VisualizationFrame.height

nodes = d3.values(adjacencyMatrix)

links = d3.merge(nodes.map((source) ->
	source.map (target) ->
		source: source
		target: adjacencyMatrix[target]
))

svg = d3.select(Framer.Device.content._element).append("svg")
	.attr('width', w)
	.attr('height', h)
	
# circleSelection = svg.append("circle")
# 	.attr("cx", w / 2)
# 	.attr("cy", h / 2)
# 	.attr("r", w / 4)
# 	.style("fill", "white")
		
force = d3.layout.force()
	.nodes(nodes)
	.links(links)
	.size([w,h])
	#Controls how interacting with the graph feels
	.linkStrength(.1)
	.linkDistance(190)
	.charge(-5)
	.gravity(.3)
	.start()

link = svg.selectAll('line.link')
	.data(links)
	.enter().append('svg:line')
 	#Fills with random color
	.style('stroke-width', ->
		1)
	.style('stroke', -> 
		d3.hsl Math.random() * 360, 1, .5)
		
node = svg.selectAll('circle.node')
	.data(nodes)
	.enter().append('svg:circle')
	#Controls radius of nodes
	.attr('r', 20)
	.call(force.drag)
	#Fills with random color
	.style('fill', -> 
		d3.hsl Math.random() * 360, 1, .5)

force.on 'tick', ->
	link.attr('x1', (d) -> d.source.x)
		.attr('y1', (d) -> d.source.y)
		.attr('x2', (d) -> d.target.x)
		.attr('y2', (d) -> d.target.y)
	node.attr('cx', (d) -> d.x)
		.attr( 'cy', (d) -> d.y)

Utils.domComplete ->
	forceDirectedGraphLayer.custom.svg = document.getElementById "svg" if 	forceDirectedGraphLayer.custom.svg is null

	forceDirectedGraphLayer.custom.element = svg[0][0]
	
	forceDirectedGraphLayer.custom.svg.appendChild forceDirectedGraphLayer.custom.element
# 	forceDirectedGraphLayer.backgroundColor = "black"

# adding some crazy Framer-stuff just because I can ;)
forceDirectedGraphLayer.on Events.TouchStart, ->
# 	circleSelection.style("fill", Utils.randomColor(0.5))
# 	forceDirectedGraphLayer.animate
# 		properties:
# # 			scale: Utils.randomNumber(0.5,1)
# 			backgroundColor: Utils.randomColor(0.5)
# 			borderRadius: 4
# 		curve: Bezier.easeOut
	