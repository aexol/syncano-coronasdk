-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
API_KEY = "e759b4d75b394372ddb00a5a1a8ffd5cc35b79d1"
INSTANCE_NAME = "still-fire-4660"

Syncano = require "syncano"
syn = Syncano(API_KEY,INSTANCE_NAME)

-- syn:createUser("czemiello","222bbb",function ( e )
-- 	print(e)
-- end)


syn:login("czemiello","222bbb",function ( e )
	print(e)
end)
