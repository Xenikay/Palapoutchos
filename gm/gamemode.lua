Gamemode = {}
Gamemode.__index = Gamemode
Gamemode.DefaultCallbacks = {}
Gamemode.Callbacks = {}
Gamemode.List = {}

function Gamemode.Set( id )
	if ( Gamemode.List[ id ] ) then
		local GM = Gamemode.List[ id ]
		Gamemode.Callbacks = GM.Callbacks
		Gamemode.Callbacks.initialize()
		Gamemode.LoadCallbacks()
		print( "Gamemode " .. GM.Name .. " [".. GM.ID .. "] loaded" )
	else
		print( "Gamemode [" .. id .. "] don't exist" )
	end
end

function Gamemode.LoadCallbacks()
	local DefaultCallbacls = { "draw", "focus", "keypressed", "keyreleased", "load", "mousefocus", "mousemoved", "mousepressed", "mousereleased", "quit", "resize", "textedited", "textinput", "update", "visible", "wheelmoved" }  
	if not ( Gamemode.Callbacks ) then return end
	for k , v in pairs ( DefaultCallbacls ) do
		if ( Gamemode.Callbacks[v] ) then
			love[v] = Gamemode.Callbacks[v]
		elseif ( v == "quit" ) then
			love[v] = function() return false end
		else
			love[v] = function() end
		end
	end
end

function Gamemode.Create( name, id )
	if ( type( id ) ~= "number" ) then print( "The ID isn't a number > " .. id ) return 1 end
	if ( Gamemode.List[id] ) then print( "Overwrite Gamemode " .. name ) end
	local Class = setmetatable( {}, Gamemode )
	Class.Name = name
	Class.ID = id
	Class.Callbacks = {}
	Gamemode.List[id] = Class
	print( "Gamemode " .. Class.Name .. " [" .. Class.ID .. "] is created." )
	return Class
end

function Gamemode:SetCallback( index, func )
	self.Callbacks[index] = func
end

function Gamemode:GetCallback( index )
	if ( Gamemode.Callbaks[ index ] ) then
		return Gamemode.Callbaks[ index ]
	else
		print( "Callback [" .. index .. "] don't exist" )
	end
end
