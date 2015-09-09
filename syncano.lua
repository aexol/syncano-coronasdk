local Syncano = {}
Syncano.prototype = { apiKey = ""}
Syncano.__index = Syncano
setmetatable(Syncano,{
	__call = function(cls,...)
		return cls.new(...)
	end,
	})
function Syncano.new(apiKey,instance_name)
	local self = setmetatable({},Syncano)
	self.apiKey = apiKey
	self.instance_name = instance_name
	return self
end

-- not tested
function Syncano:createDataObject(class,obj,callback)
	local function networkListener( event )
	    if ( event.isError ) then
	    else
	       callback(event.response)
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	headers["Content-Type"]="application/json"
	local params = {}
	params.headers = headers
	local body = ""
	local cc = 0
	for k,v in pairs(obj) do
		if cc ~= 0 then
			body = body.."&"
		end
		body = body..k.."="..v
		cc = cc+1
	end
	params.body = body
	network.request( "https://api.syncano.io/v1/instances/"..self.instance_name.."/classes/"..class.."/objects/", "POST", networkListener, params )
end
function Syncano:login(username,password,callback)
	local function networkListener( event )
	    if ( event.isError ) then
	    else
	       callback(event.response)
	    end
	end
	local headers = {}
	headers["X-API-KEY"] = self.apiKey
	headers["Content-Type"]="application/json"
	local params = {}
	params.headers = headers
	params.body="username="..username.."&password="..password
	network.request( "https://api.syncano.io/v1/instances/"..self.instance_name.."/user/auth/", "GET", networkListener, params )
end
function Syncano:getDataObject(class,id,callback)
	local function networkListener( event )
	    if ( event.isError ) then
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
function Syncano:listDataObjects(class,callback)
	local function networkListener( event )
	    if ( event.isError ) then
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
function Syncano:test()
	local function networkListener( event )
	    if ( event.isError ) then
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
return Syncano