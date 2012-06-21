require "./common"
{config} = require("../../common")
baseUrl = config.get "MPATH_URL", "http://localhost:8080"

testGroup "Client",
	init: ->
		driver = require("../index").init baseUrl
		assert typeof driver.createApiKey is "function"
	api: ->
		driver = require("../index").init baseUrl
		assert typeof driver.createApiKey is "function"
		driver.createApiKey "jesse@conductrics.com", null, (err, json) ->
			throw err if err
			assert "key" of json
			assert "owner" of json
			apikey = json.key
			ownerCode = json.owner
			sessionCode = $.random.string(16)
			driver.getDecisions apikey, sessionCode, ownerCode, "agent-1", "point-1", (err, json) ->
				throw err if err
				console.log "decision body: #{JSON.stringify(json)}"
				
		
	
