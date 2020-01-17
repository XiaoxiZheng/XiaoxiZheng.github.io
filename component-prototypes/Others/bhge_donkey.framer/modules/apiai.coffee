# module connecting framerJS and api.ai
# written by Sergiy Voronov twitter.com/mamezito

exports.send =(text, callback, token, session)->
	xhr = new XMLHttpRequest
	xhr.open 'POST', "http://0.0.0.0:5005/app/webhook"
	xhr.setRequestHeader 'Content-type', 'application/json'
	xhr.onreadystatechange = ->
		if xhr.readyState == 4 and xhr.status == 200
			# callback xhr.responseText;
			console.log("xhr.response: " + xhr.response)

# 			console.log(JSON.parse(xhr.responseText).result.fulfillment.speech);
			console.log(JSON.parse(xhr.responseText).message);

			callback JSON.parse(xhr.responseText)

		return

	data = JSON.stringify(
		query: text
		lang: 'en'
		sessionId: session)

	xhr.send data

	return
