request = require("request")

exports.init = (baseUrl) ->
	getDecisions: (apikey, sessionCode, ownerCode, agentCode, pointCode, callback) ->
		request(
			method: "GET"
			url: [baseUrl, ownerCode, agentCode, "decision", pointCode].join "/"
			headers:
				"x-mpath-apikey": apikey
				"x-mpath-session": sessionCode
		, (err, resp, body) ->
			callback( err, body )
		)
	sendReward: (apikey, sessionCode, ownerCode, agentCode, goalCode, callback) ->
		request(
			method: "POST"
			url: [baseUrl, ownerCode, agentCode, "goal", goalCode].join "/"
			headers:
				"x-mpath-apikey": apikey
				"x-mpath-session": sessionCode
		, (err, resp, body) ->
			callback( err, body )
		)
	expireSession: (apikey, ownerCode, sessionCode, callback) ->
		request(
			method: "GET"
			url: [baseUrl, ownerCode, agentCode, "expire"].join "/"
			headers:
				"x-mpath-apikey": apikey
				"x-mpath-session": sessionCode
		, (err, resp, body) ->
			callback(err, body)
		)
	createAgent: (apikey, ownerCode, agentCode, agentJson="""{
			"goals":[
				{"code":"goal-1"}
			],
			"points": [
				{
					"code":"point-1",
					"decisions":[
						{
							"code":"decision-1",
							"choices":[ 
								{"code":"a"},
								{"code":"b"}
							]
						}
					]
				}
			]
		}"""
	) ->
		request(
			method: "PUT"
			url: [baseUrl, ownerCode, agentCode].join "/"
			headers:
				"x-mpath-apikey": apikey
			json: agentJson
		, (err, resp, body) ->
			callback(err, body)
		)
	createApiKey: (email, ownerCode, callback) ->
		request(
			method: "PUT"
			url: [baseUrl,ownerCode,"create-key",email].join "/"
		, (err, resp, body) ->
			callback(err, body)
		)
