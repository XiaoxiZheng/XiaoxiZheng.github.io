
### Credits:
	author: "Sergey Voronov"
	twitter: "mamezito"
###
Framer.Info =
	title: "BHGE Bot"
	description: "Dialog module, ios kit module, fb messenger bot module"

#modules
chatBot = require "chatBot"
api_ai = require 'apiai'

#change token to your token here
token = "0.1"
# session=Utils.randomNumber(0, 100000)
session = 123

#Donkey: ae14f7769b05430eaddc4d4b3e7201ce
#Default: e0da974e397747a58fbd7683013cbf8f

#initial settings

botName="BHGE Donkey"
botImage = "images/ge_logo.png"
likes="Failure Type Prediction"
botCategory="Oi & Gas"
user="Paul Edison"

chatBot.createMessenger(botName,botImage,likes,botCategory,user)


 #callback function that uses response from api.ai
sendfunc=(data)->
	msg=new chatBot.Message
			type:"botMsg"
			#data is whole JSON response from apiai, but we are just using the text string which sits in result.speech
			#more on the json response in api.ai here- https://docs.api.ai/docs/query#response
			text: "something"
# 			else
# 				text: data.fulfillment.speech
			print data
# 			print data.result.valueOf()
# 			print output

#bot logic
#function checking for user input
window["userInput"]=(input)->
	#we are sending users input as string to api.ai
	#using sendfunc as callback when response with data is ready
	api_ai.send input, sendfunc, token, session
