# #Script Loading
# {DynamicLoader} = require "DynamicLoader"
# ##Getting the D3 Script
# DynamicLoader.add('https://d3js.org/d3.v4.min.js')

#CSS STYLES
highlightBlue = "#4291CA"
defaultGrey = "#BCC3CB"

Utils.insertCSS ("
	.node { cursor: pointer;}
	.node circle {
		fill: #fff;
		stroke: #4291CA;
		stroke-width: 1.5px;
	}
	.node text {
		fill: #fff
		font: 10px sans-serif;
	}
	.link {
		fill: none;
		stroke: #BCC3CB;
		stroke-width: 1.5px;
	}
")	
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
#DATA
# pubs = JSON.parse Utils.domLoadDataSync "pubs.json"
pubs = 
  'name': 'AUT-1'
  'children': [
    {
      'name': 'PUB-1'
      'children': [
        {
          'name': 'AUT-11'
          'children': [
            { 'name': 'AFF-111' }
            { 'name': 'AFF-112' }
          ]
        }
        {
          'name': 'AUT-12'
          'children': [ { 'name': 'AFF-121' } ]
        }
        {
          'name': 'AUT-13'
          'children': [
            { 'name': 'AFF-131' }
            { 'name': 'AFF-132' }
          ]
        }
        {
          'name': 'AUT-14'
          'children': [ { 'name': 'AFF-141' } ]
        }
      ]
    }
    {
      'name': 'PUB-2'
      'children': [
        { 'name': 'AUT-21' }
        { 'name': 'AUT-22' }
        { 'name': 'AUT-23' }
        { 'name': 'AUT-24' }
        { 'name': 'AUT-25' }
        { 'name': 'AUT-26' }
        { 'name': 'AUT-27' }
        {
          'name': 'AUT-28'
          'children': [
            { 'name': 'AFF-281' }
            { 'name': 'AFF-282' }
            { 'name': 'AFF-283' }
            { 'name': 'AFF-284' }
            { 'name': 'AFF-285' }
            { 'name': 'AFF-286' }
          ]
        }
      ]
    }
    { 'name': 'PUB-3' }
    {
      'name': 'PUB-4'
      'children': [
        { 'name': 'AUT-41' }
        { 'name': 'AUT-42' }
        {
          'name': 'AUT-43'
          'children': [
            { 'name': 'AFF-431' }
            { 'name': 'AFF-432' }
            { 'name': 'AFF-433' }
            {
              'name': 'AFF-434'
              'children': [
                { 'name': 'ADD-4341' }
                { 'name': 'ADD-4342' }
              ]
            }
          ]
        }
        { 'name': 'AUT-44' }
      ]
    }
    {
      'name': 'PUB-5'
      'children': [
        {
          'name': 'AUT-51'
          'children': [
            { 'name': 'AFF-511' }
            { 'name': 'AFF-512' }
            { 'name': 'AFF-513' }
            { 'name': 'AFF-514' }
            { 'name': 'AFF-515' }
            { 'name': 'AFF-516' }
          ]
        }
        { 'name': 'AUT-52' }
        { 'name': 'AUT-53' }
        { 'name': 'AUT-54' }
        {
          'name': 'AUT-55'
          'children': [
            { 'name': 'AFF-551' }
            { 'name': 'AFF-552' }
            { 'name': 'AFF-553' }
            { 'name': 'AFF-554' }
          ]
        }
        { 'name': 'AUT-56' }
        { 'name': 'AUT-57' }
        { 'name': 'AUT-58' }
        { 'name': 'AUT-59' }
        { 'name': 'AUT-591' }
        { 'name': 'AUT-592' }
        { 'name': 'AUT-593' }
        { 'name': 'AUT-594' }
        { 'name': 'AUT-595' }
        { 'name': 'AUT-596' }
      ]
    }
    {
      'name': 'PUB-6'
      'children': [
        {
          'name': 'AUT-61'
          'children': [
            { 'name': 'AFF-611' }
            { 'name': 'AFF-612' }
            { 'name': 'AFF-613' }
            {
              'name': 'AFF-614'
              'children': [
                { 'name': 'ADD-6141' }
                { 'name': 'ADD-6142' }
              ]
            }
          ]
        }
        { 'name': 'AUT-62' }
        { 'name': 'AUT-63' }
        { 'name': 'AUT-64' }
        { 'name': 'AUT-65' }
        { 'name': 'AUT-66' }
        { 'name': 'AUT-67' }
        { 'name': 'AUT-68' }
        { 'name': 'AUT-69' }
      ]
    }
  ]

diameter = VisualizationFrame.width
w = VisualizationFrame.width
h = VisualizationFrame.height
# w = diameter
# h = diameter

i = 0
duration = 350
root = undefined

svg = d3.select(Framer.Device.content._element).append('svg')
	.attr('width', w)
	.attr('height', h)
	.append('g')
	.attr('transform', 'translate(' + diameter / 2 + ',' + diameter / 2 + ')')
	
tree = d3.layout.tree()
	.size([360,diameter / 2 - 80])
	.separation((a, b) ->
		(if a.parent == b.parent then 1 else 10) / a.depth
)
diagonal = d3.svg.diagonal.radial()
	.projection((d) ->
		[d.y, d.x / 180 * Math.PI]
	)

update = (source) ->
  # Compute the new tree layout.
  nodes = tree.nodes(root)
  links = tree.links(nodes)
  # Normalize for fixed-depth.
  nodes.forEach (d) ->
    d.y = d.depth * 80
    return
  # Update the nodes…
  node = svg.selectAll('g.node').data(nodes, (d) ->
    d.id or (d.id = ++i)
  )
  # Enter any new nodes at the parent's previous position.
  nodeEnter = node.enter().append('g').attr('class', 'node').on('click', click)
  nodeEnter.append('circle').attr('r', 1e-6).style 'fill', (d) ->
   if d._children then 'lightsteelblue' else '#fff'
  nodeEnter.append('text').attr('x', 10)
   .attr('dy', '.35em')
   .attr('text-anchor', 'start')
   .text((d) -> d.name)
   .style 'fill-opacity', 1e-6
  # Transition nodes to their new position.
  nodeUpdate = node.transition().duration(duration).attr('transform', (d) ->
    'rotate(' + d.x - 90 + ')translate(' + d.y + ')'
  )
  nodeUpdate.select('circle').attr('r', 4.5).style 'fill', (d) ->
    if d._children then 'lightsteelblue' else '#fff'
  nodeUpdate.select('text').style('fill-opacity', 1).attr 'transform', (d) ->
    if d.x < 180 then 'translate(0)' else 'rotate(180)translate(-' + d.name.length + 50 + ')'
  # TODO: appropriate transform
  nodeExit = node.exit().transition().duration(duration).remove()
  nodeExit.select('circle').attr 'r', 1e-6
  nodeExit.select('text').style 'fill-opacity', 1e-6
  # Update the links…
  link = svg.selectAll('path.link').data(links, (d) ->
    d.target.id
  )
  # Enter any new links at the parent's previous position.
  link.enter().insert('path', 'g').attr('class', 'link').attr 'd', (d) ->
    o = 
      x: source.x0
      y: source.y0
    diagonal
      source: o
      target: o
  # Transition links to their new position.
  link.transition().duration(duration).attr 'd', diagonal
  # Transition exiting nodes to the parent's new position.
  link.exit().transition().duration(duration).attr('d', (d) ->
    o = 
      x: source.x
      y: source.y
    diagonal
      source: o
      target: o
  ).remove()
  
# update = (source) ->
# 	# Compute the new tree layout.
# 	nodes = tree.nodes(root)
# 	links = tree.links(nodes)
# 	
# 	# Normalize for fixed-depth.
# 	nodes.forEach (d) ->
# 		d.y = d.depth * 80
# 		return
# 		
# 	# Update the nodes…
# 	node = svg.selectAll('g.node').data(nodes, (d) ->
# 		d.id or (d.id = ++i)
# 	)
# 	# Enter any new nodes at the parent's previous position.
# 	nodeEnter = node.enter().append('g').attr('class', 'node').on('click', click)
# 	nodeEnter.append('circle')
# 		.attr('r', 1e-6)
# 		.style 'fill', (d) -> if d._children then 'highlightBlue' else '#fff'
# 	
# 	nodeEnter.append('text')
# 		.attr('x', 10)
# 		.attr('dy', '.35em')
# 		.attr('text-anchor', 'start')
# 		.text((d) -> d.name)
# 		.style 'fill-opacity', 1e-6
# 	
# 	# Transition nodes to their new position.
# 	nodeUpdate = node.transition().duration(duration).attr('transform', (d) ->
# 		'rotate(' + d.x - 90 + ')translate(' + d.y + ')'
# 	)
# 	nodeUpdate.select('circle')
# 		.attr('r', 4.5)
# 		.style 'fill', (d) -> if d._children then 'highlightBlue' else '#fff'
# 	nodeUpdate.select('text')
# 		.style('fill-opacity', 1)
# 		.attr 'transform', (d) -> 
# 			if d.x < 180 then 'translate(0)' 
# 			else 'rotate(180)translate(-' + d.name.length + 50 + ')'
# 	# TODO: appropriate transform
# 	nodeExit = node.exit().transition()
# 		.duration(duration).remove()
# 		
# 	nodeExit.select('circle')
# 		.attr 'r', 1e-6
# 	nodeExit.select('text')
# 		.style 'fill-opacity', 1e-6
# 	# Update the links…
# 	link = svg.selectAll('path.link')
# 		.data(links, (d) ->diagonal.target.id )
# 	# Enter any new links at the parent's previous position.
# 	link.enter().insert('path', 'g')
# 		.attr('class', 'link')
# 		.attr 'd', (d) ->
# 			o = 
# 				x: source.x0
# 				y: source.y0
# 			diagonal
# 				source: o
# 				target: o
# 	# Transition links to their new position.
# 	link.transition().duration(duration)
# 		.attr 'd', diagonal
# 	# Transition exiting nodes to the parent's new position.
# 	link.exit().transition()
# 		.duration(duration)
# 		.attr('d', (d) ->
# 			o = 
# 				x: source.x
# 				y: source.y
# 			diagonal
# 				source: o
# 				target: o
# 	).remove()
# 	# Stash the old positions for transition.
# 	nodes.forEach (d) ->
# 		d.x0 = d.x
# 		d.y0 = d.y
# 		return
# 	return

# Toggle children on click.

click = (d) ->
  if d.children
    d._children = d.children
    d.children = null
  else
    d.children = d._children
    d._children = null
  update d
  return

# Collapse nodes

collapse = (d) ->
  if d.children
    d._children = d.children
    d._children.forEach collapse
    d.children = null
  return

root = pubs
root.x0 = h / 2
root.y0 = 0
# root.children.forEach(collapse); // start with all children collapsed
update root
d3.select(self.frameElement).style 'height', 'width'

Utils.domComplete ->
	forceDirectedGraphLayer.custom.svg = document.getElementById "svg" if forceDirectedGraphLayer.custom.svg is null

	forceDirectedGraphLayer.custom.element = svg[0][0]
	
	forceDirectedGraphLayer.custom.svg.appendChild forceDirectedGraphLayer.custom.element

# adding some crazy Framer-stuff just because I can ;)
forceDirectedGraphLayer.on Events.TouchStart, ->
# 	circleSelection.style("fill", Utils.randomColor(0.5))
# 	forceDirectedGraphLayer.animate
# 		properties:
# # 			scale: Utils.randomNumber(0.5,1)
# 			backgroundColor: Utils.randomColor(0.5)
# 			borderRadius: 4
# 		curve: Bezier.easeOut
	