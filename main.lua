-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
API_KEY = "90ca3b77844ecc8a592535679c7e70194808aad7"
INSTANCE_NAME = "rough-snow-3508"

Syncano = require "syncano"
syn = Syncano(API_KEY,INSTANCE_NAME)
syn:getDataObject("recipe",6,function (e)
	print(e)
end)