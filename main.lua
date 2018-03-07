function love.load()
	require( "libs/draw" )
	require( "libs/button" )
	require( "libs/gamemode" )
	require( "libs/util" )
	
	require( "gm/default" )
	require( "gm/menu" )
	require( "gm/misc" )
	require( "gm/ltm" )
	
	require( "wiki/misc" )
	require( "wiki/liste_des_troubles_mentaux" )
	
	love.window.setMode( 1600, 900 )
	love.window.setTitle( "Xenikay's little virtual memory" )
	love.graphics.setBackgroundColor( 220, 220, 220 )
	
	Game = {}
	Game.Images = {}
	Game.Fonts = {}
	Game.Sounds = {}
	Game.Sounds["Hovered"] = love.audio.newSource( "contents/sounds/Hovered.wav", "static" )
	Game.Sounds["Select"] = love.audio.newSource( "contents/sounds/Select.wav", "static" )
	Game.Fonts[1] = love.graphics.newFont( ScrW()*0.003 )
	Game.Fonts[2] = love.graphics.newFont( ScrW()*0.005 )
	Game.Fonts[3] = love.graphics.newFont( ScrW()*0.0075 )
	Game.Fonts[4] = love.graphics.newFont( ScrW()*0.01 )
	Game.Fonts[5] = love.graphics.newFont( ScrW()*0.02 )
	
	Gamemode.Set( 1 )	
end











