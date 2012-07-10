MPath API - The Node.JS Client
--------------------------

# Installation

    npm install mpath-client

# Usage

    mpath = require("mpath-client").init("http://api.conductrics.net/")

# Quick Start
  
  To understand what all the options are, please see the [Quick Start Guide][quick-start].

  The driver is a simple REST client.
  
  [quick-start]: http://developers.conductrics.net/quick-start

# Client Methods

  1. __getDecisions(apikey, sessionCode, ownerCode, agentCode, pointCode, callback)__
  2. __sendReward(apikey, sessionCode, ownerCode, agentCode, goalCode, callback)__
  3. __expireSession(apikey, sessionCode, ownerCode, callback)__
  4. __createAgent(apikey, ownerCode, agentCode, agentJson, callback)__
  5. __createApiKey(email, ownerCode, callback)__
