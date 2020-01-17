#Color Definitions
orange = [255,121,0,1] #Gas
blue = [0,204,255] #Water
green = [37,215,10] #Oil
red = [255,69,69,1] #Oil when Gas is present lol

addColor = (color1,color2) -> #array type
	newColor = []
	for i in [0...color1.length]
		newColor[i] = color1[i] + color2[i]
	return newColor
colorTostring = (r,g,b,a) ->
	return "rgba(" + r + "," + g + "," + b + "," + a + ")"

addedColor = addColor(addColor(addColor(orange,blue), green),red)
	
carbon_hydrogen = new BackgroundLayer
	width: 1024
	height: 1024
# 	backgroundColor: "#FFFFFF"
	x: Align.center
	y: Align.center
carbon_hydrogen.states = 
	default_rotation:
		rotation: 0
	rotation360:
		rotation: 360
carboHydro = []

carbon = new Layer
# 	parent: carbon_hydrogen
	x: Align.center
	y: Align.center
	width: 35
	height: 35
	borderRadius: 100
	backgroundColor: addedColor
	opacity: .8

carboHydro.push(carbon)

hydrogen_1 = new Layer
	parent: carbon_hydrogen
	x: Align.center
	y: carbon.y - 108.8
	width: 15
	height: 15
	borderRadius: 100
# 	backgroundColor: "#8BD6FF"
	backgroundColor: "rgb(37,215,10,100)"
	rotation: 0
carboHydro.push(hydrogen_1)
hydrogen_1.states = 
	inward: 
		x: Align.center
		y: Align.center
		opacity: 0
	outward:
		x: Align.center
		y: carbon.y - 108.8
		opacity: 1
	default:
		rotation: 0
	rotate:
		rotation: 360
		
hydrogen_2 = new Layer
	parent: carbon_hydrogen
	x: carbon.x - 50.4
	y: carbon.y + carbon.height + 50.4
	width: 15
	height: 15
	borderRadius: 100
# 	backgroundColor: "#8BD6FF"
	backgroundColor: "rgb(0,204,255)"
	rotation: 0
carboHydro.push(hydrogen_2)

hydrogen_2.states = 
	inward: 
		x: Align.center
		y: Align.center
		opacity: 0
	outward:
		x: carbon.x - 50.4
		y: carbon.y + carbon.height + 50.4
		opacity: 1
	default:
		rotation: 0
	rotate:
		rotation: 360
	
hydrogen_3 = new Layer
	parent: carbon_hydrogen
	x: hydrogen_2.x + 109.5
	y: hydrogen_2.y + 20.4
	width: 15
	height: 15
	borderRadius: 100
	backgroundColor: "rgb(255,121,0)"
	rotation: 0
carboHydro.push(hydrogen_3)
hydrogen_3.states = 
	inward: 
		x: Align.center
		y: Align.center
		opacity: 0
	outward:
		x: hydrogen_2.x + 109.5
		y: hydrogen_2.y + 20.4
		opacity: 1
	default:
		rotation: 0
	rotate:
		rotation: 360
hydrogen_4 = new Layer
	parent: carbon_hydrogen
	x: hydrogen_3.x + 50.4
	y: hydrogen_3.y - 50.4
	width: 15
	height: 15
	borderRadius: 100
	backgroundColor: colorTostring(red)
	rotation: 0
carboHydro.push(hydrogen_4)
hydrogen_4.states = 
	inward: 
		x: carbon.x
		y: carbon.y
		opacity: 0
	outward:
		x: hydrogen_3.x + 50.4
		y: hydrogen_3.y - 50.4
		opacity: 1
	default:
		rotation: 0
	rotate:
		rotation: 360

for i in [1...carboHydro.length]
# 	carboHydro[0].animate
# 		scale: 1 + (i * 0.1)
# 		opacity: 0.7 + (i*0.1)
	carboHydro[i].states.next()
	carboHydro[i].onAnimationEnd ->
		this.stateCycle("inward","outward")
	carbon_hydrogen.states.next()
	carbon_hydrogen.onAnimationEnd ->
		this.stateCycle("default_rotation", "rotation360")
# 		this.stateCycle("rotate","default")
	
# 	carboHydro[0].onAnimationEnd ->
# 		carboHydro[0].animate
# 			scale: 1
# 			opacity: 0.7
		