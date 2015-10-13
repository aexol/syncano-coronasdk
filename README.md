# syncano-coronasdk

Syncano scales and syncs your data across devices in real-time. Get your data when you need it, where you need it, in the form you need it.

Syncano gives you the flexibility to run your code and define your data structures the way you want to - so you can focus on building powerful user experiences.

## user creation

```lua
syn:createUser("username_here","password_here",function ( e )
	-- RESPONSE HERE
	print(e)
end)
```

## user login

```lua
syn:login("username_here","password_here",function ( e )
	-- RESPONSE HERE
	print(e)
end)
```

## data object create

```lua
syn:createDataObject("class_name",{
	name="Arthur",
	country="Sealand"	
},function ( e )
	-- RESPONSE HERE
	print(e)
end)
```

## data object filter

```lua
syn:filterDataObjects("class_name",{
	system=499	
},function ( e )
	-- RESPONSE HERE
	print(e)
end)
```

## data object delete

```lua
-- PASS CLASS NAME AND OBJECT ID
syn:listDataObjects("class_name",12,function ( e )
	-- RESPONSE HERE
	print(e)
end)
```

## data object update

```lua
syn:updateDataObject("class_name",12,{
	country="Zimbabwe"	
},function ( e )
	-- RESPONSE HERE
	print(e)
end)
```

## data object get

```lua
-- PASS CLASS NAME AND OBJECT ID
syn:listDataObjects("class_name",12,function ( e )
	-- RESPONSE HERE
	print(e)
end)
```

## data object list

```lua
syn:listDataObjects("class_name",function ( e )
	-- RESPONSE HERE
	print(e)
end)
```