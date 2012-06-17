require("./common")
require("../lib/random")

baseUrl = "http://localhost:8080"

apikey = null
testGroup "Client",
	init: ->
		{init} = require("../index")
		driver = init baseUrl
		assert typeof driver.getDecisions is "function"
	apikey: ->
		driver = require("../index").init baseUrl
		driver.createApikey "jesse@conductrics.com", $.random.string(16), (err, body) ->
			console.log "key body: #{body}"
		
	
