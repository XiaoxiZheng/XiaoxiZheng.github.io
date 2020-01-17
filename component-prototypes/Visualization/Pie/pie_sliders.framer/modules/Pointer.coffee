class exports.Pointer

	@coords = (event, layer) ->
		
		@argumentError() if !event? or !layer? # Make sure we have everything we need
		
		touch = Events.touchEvent event
		
		# Mouse Events
		if event.offsetX and event.offsetY # <- We don't get these for touch events
		
			frame = layer.screenFrame
			return x: frame.x + touch.offsetX, y: frame.y + touch.offsetY
			
		else
		
			# Touch Event
			return  x: touch.clientX, y: touch.clientY
			
	@argumentError = ->
		error null
		console.error """
			Pointer.coords() Error: You must pass event & layer arguments. \n
			Example: layer.on Events.TouchStart,(event,layer) -> Pointer.coords(event, layer)"""
		return