local Syncano = {}
local json = require "json"
Syncano.prototype = { apiKey = ""}
Syncano.__index = Syncano
setmetatable(Syncano,{
	__call = function(cls,...)
		return cls.new(...)
	end,
	})
local function toUnicode(a)
	a1,a2,a3,a4 = a:byte(1, -1)
	ans = string.format ("%%%02X", a1)
	n = a2
	if (n)
	then
	ans = ans .. string.format ("%%%02X", n)
	end
	n = a3
	if (n)
	then
	ans = ans .. string.format ("%%%02X", n)
	end
	n = a4
	if (n)
	then
	ans = ans .. string.format ("%%%02X", n)
	end
	return ans
end

local function urlencode(str)
	if (str) then
	str = string.gsub (str, "\n", "\r\n")
	str = string.gsub (str, "([^%w ])", toUnicode)
	str = string.gsub (str, " ", "+")
	end
	return str
end



function Syncano.new(apiKey,instance_name)
	local self = setmetatable({},Syncano)
	self.apiKey = apiKey
	self.instance_name = instance_name
	return self
end
function Syncano:createDataObject(class,obj,callback)
	local function networkListener( event )
	    if ( event.isError ) then
	    	callback("error")
	    else
	       callback(event.response)
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	headers["Content-Type"]="application/json"
	local params = {}
	params.headers = headers
	params.body = json.encode(obj)
	network.request( "https://api.syncano.io/v1/instances/"..self.instance_name.."/classes/"..class.."/objects/", "POST", networkListener, params )
end

function Syncano:getDataObject(class,id,callback)
	local function networkListener( event )
	    if ( event.isError ) then
	    	callback("error")
	    else
	       callback(event.response)
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	headers["Content-Type"]="application/json"
	local params = {}
	params.headers = headers
	network.request( "https://api.syncano.io/v1/instances/"..self.instance_name.."/classes/"..class.."/objects/"..id.."/", "GET", networkListener, params )
end
function Syncano:deleteDataObject(class,id,callback)
	local function networkListener( event )
	    if ( event.isError ) then
	    	callback("error")
	    else
	       callback(event.response)
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	headers["Content-Type"]="application/json"
	local params = {}
	params.headers = headers
	network.request( "https://api.syncano.io/v1/instances/"..self.instance_name.."/classes/"..class.."/objects/"..id.."/", "DELETE", networkListener, params )
end
function Syncano:updateDataObject(class,id,filter,callback)
	local function networkListener( event )
	    if ( event.isError ) then
	    	callback("error")
	    else
	       callback(event.response)
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	headers["Content-Type"]="application/json"
	local params = {}
	params.headers = headers
	params.body = json.encode(filter)
	network.request( "https://api.syncano.io/v1/instances/"..self.instance_name.."/classes/"..class.."/objects/"..id.."/", "POST", networkListener, params )
end
function Syncano:createUser(username,password,callback)
	local function networkListener( event )
	    if ( event.isError ) then
	    	callback("error")
	    else
	       callback(event.response)
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	headers["Content-Type"]="application/json"
	local params = {}
	params.headers = headers
	params.body = json.encode({
		username = username,
		password = password
	})
	network.request( "https://api.syncano.io/v1/instances/"..self.instance_name.."/users/", "POST", networkListener, params )
end
function Syncano:login(username,password,callback)
	local function networkListener( event )
	    if ( event.isError ) then
	    	callback("error")
	    else
	       callback(event.response)
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	headers["Content-Type"]="application/json"
	local params = {}
	params.headers = headers
	params.body = json.encode({
		username = username,
		password = password
	})
	network.request( "https://api.syncano.io/v1/instances/"..self.instance_name.."/user/auth/", "POST", networkListener, params )
end

function Syncano:listDataObjects(class,callback)
	local function networkListener( event )
	    if ( event.isError ) then
	    	callback("error")
	    else
	       callback(event.response)
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	headers["Content-Type"]="application/json"
	local params = {}
	params.headers = headers
	network.request( "https://api.syncano.io/v1/instances/"..self.instance_name.."/classes/"..class.."/objects/", "GET", networkListener, params )
end
function Syncano:filterDataObjects(class,filter,callback)
	local function networkListener( event )
	    if ( event.isError ) then
	    	callback("error")
	    else
	       callback(event.response)
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	headers["Content-Type"] = "application/x-www-form-urlencoded" 
	local params = {}
	params.headers = headers
	newQ = {}
	for k,v in pairs(filter) do
		if type(v) == "table" then
			newQ[k] = {_in=v}
		else
			newQ[k] = {_eq=v}
		end
	end
	ext = urlencode(json.encode(newQ))
	network.request( "https://api.syncano.io/v1/instances/"..self.instance_name.."/classes/"..class.."/objects/?query="..ext, "GET", networkListener, params )
end


function Syncano:test()
	local function networkListener( event )
	    if ( event.isError ) then
	    	callback("error")
	    else
	        print ( "RESPONSE: " .. event.response )
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	local params = {}
	params.headers = headers
	network.request( "https://api.syncano.io/v1/instances/", "GET", networkListener, params )
end
function Syncano:runWebhook(name,obj,callback)
	local function networkListener( event )
	    if ( event.isError ) then
	    	callback("error")
	    else
	       callback(event.response)
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	headers["Content-Type"]="application/json"
	local params = {}
	params.headers = headers
	params.body = json.encode(obj)
	network.request( "https://api.syncano.io/v1/instances/"..self.instance_name.."/webhooks/"..name.."/run/", "POST", networkListener, params )
end
return Syncano