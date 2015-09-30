-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
API_KEY = "0dabf69d50d82fe61d0b185355c712ea461921eb"
INSTANCE_NAME = "still-fire-4660"

Syncano = require "syncano"
syn = Syncano(API_KEY,INSTANCE_NAME)

syn:filterDataObjects("planet",{ system=496, },function (e)
	print(e)
end)