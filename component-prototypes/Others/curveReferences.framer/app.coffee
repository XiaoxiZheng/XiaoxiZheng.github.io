#Scene Set Up

easeInCubic = Bezier(0.55,0.055,0.675,0.19)
easeOutCubic = Bezier(0.215,0.61,0.355,1)
easeOutInCubic = Bezier(0.645, 0.045, 0.355, 1)
easeInOutQuad = Bezier(0.455, 0.03, 0.515, 0.955)
easeInExpo = Bezier(0.95, 0.05, 0.795, 0.035)

easeOutQuart = Bezier(0.165,0.84,0.44,1) #For Pillow Landing Entrances - Quickly enters and softly ends

# easeInCubic = [0.55,0.055,0.675,0.19]
# easeOutCubic = [0.215,0.61,0.355,1]
# easeOutInCubic = [0.645, 0.045, 0.355, 1]
# 
# easeInOutQuad = [0.455, 0.03, 0.515, 0.955]
# easeInExpo = [0.95, 0.05, 0.795, 0.035]

curveDefProperties = "cubic-bezier(0.55,0.055,0.675, 0.19)"
animationCurveOption = easeInCubic

obj_originX = drag_box.x
obj_originY = drag_box.y
drag_box.draggable.enabled = true
#Updating curve properties
updateCurveProperties = (curveTitle_) ->
	curveTitle.text = curveTitle_
		
	if curveTitle.text == "easeInCubic"
		curveDefProperties = "cubic-bezier(0.55,0.055,0.675, 0.19)"
		curve_name.text = "EaseIn"
		animationCurveOption = easeInCubic
		curveDescription.text = "The easeIn curve will start the animation slowly, and finish at full speed. This is the default animation curve for an object entering the page."
	if curveTitle.text == "easeOutCubic"
		curveDefProperties = "cubic-bezier(0.215,0.61,0.355,1)"
		curve_name.text = "EaseOut"
		animationCurveOption = easeOutCubic
		curveDescription.text = "The easeOut curve will start the animation at full speed, then finish slowly. This is the default animation curve for an object exiting the page."
	if curveTitle.text == "easeOutInCubic"
		curveDefProperties = "cubic-bezier(0.645, 0.045, 0.355, 1)"
		curve_name.text = "EaseInOut"
		animationCurveOption = easeOutInCubic
		curveDescription.text = "The easeInOut curve will start slowly, be fastest in the middle of the animation, then finish slowly. This is the smoother transition and used for large page transitions."
	if curveTitle.text == "easeOutQuart"
		curveDefProperties = "cubic-bezier(0.165, 0.84, 0.44, 1)"
		curve_name.text = "EaseOutQuart"
		animationCurveOption = easeOutQuart
		curveDescription.text = "The easeOutQuart curve will start the animation fast and then finish slower than the default easeIn curve. This is the animation curve to use for a dramatic entrance of an object with a 'soft pillow landing'."
		
	curveDef_web.text = curveDefProperties
	curveDef_transition.text = curveDefProperties

animateBox = () ->
	startInterval(0.001)
	
	easeInBox.animate
		x: obj_originX + 480
		options: 
			curve: easeInCubic
			
	drag_box.animate
		x: obj_originX + 480
		options: 
			curve: animationCurveOption
	
	easeInBox.onAnimationEnd ->
		Utils.delay 0.8, ->
			easeInBox.animate
				x: obj_originX
				options: 	
					curve: easeInCubic
					
	drag_box.onAnimationEnd ->
		stopInterval()
		Utils.delay 0.8, ->
			drag_box.animate
				x: obj_originX
				y: obj_originY
				options: 
					curve: animationCurveOption
			
			tick.text = 0

easeInCubic_curve.onClick ->
	updateCurveProperties("easeInCubic")
	animateBox()

easeOutCubic_curve.onClick ->
	updateCurveProperties("easeOutCubic")
	animateBox()
easeInOutCubic_curve.onClick ->
	updateCurveProperties("easeOutInCubic")
	animateBox()
easeOutQuart_curve.onClick ->
	updateCurveProperties("easeOutQuart")
	animateBox()

#Clock Stuff
interval = null 
clockTick = 0.0
startInterval = (pace)->
	interval = Utils.interval pace, ->
		clockTick += 1
		tick.text = clockTick
		
stopInterval = ->
	clearInterval(interval)
	clockTick = 0
