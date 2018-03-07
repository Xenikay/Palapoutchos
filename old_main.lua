function love.load()
	require( "status/menu" )
	require( "libs/draw" )
	require( "libs/button" )
	require( "libs/gamemode" )
	require( "libs/wiki" )
	require( "libs/util" )
	
	love.window.setMode( 1600, 900 )
	love.window.setTitle( "Xenikay's little virtual memory" )
	love.graphics.setBackgroundColor( 220, 220, 220 )
	
	Game = {}
	Game.Images = {}
	-- Game.Images["background"] = love.graphics.newImage( "contents/images/raven.jpg" )
	Game.Fonts = {}
	Game.Fonts[1] = love.graphics.newFont( ScrW()*0.003 )
	Game.Fonts[2] = love.graphics.newFont( ScrW()*0.005 )
	Game.Fonts[3] = love.graphics.newFont( ScrW()*0.0075 )
	Game.Fonts[4] = love.graphics.newFont( ScrW()*0.01 )
	Game.Fonts[5] = love.graphics.newFont( ScrW()*0.02 )
	Game.Gamemode = "menu"
	Game.Functions = {}
	Game.Functions["draw"] = function() end
	Game.Functions["update"] = function() end
	Game.Functions["mousepressed"] = function() end
	Game.Functions["wheelmoved"] = function() end
	Game.Functions["keypressed"] = function() end
	
	Gamemode_Menu.init()
	Game.Functions["draw"] = Gamemode_Menu.draw
	Game.Functions["update"] = Gamemode_Menu.update
	Game.Functions["mousepressed"] = Gamemode_Menu.mousepressed
	Game.Functions["wheelmoved"] = Gamemode_Menu.wheelmoved
	Game.Functions["keypressed"] = Gamemode_Menu.keypressed
	
end

function love.keypressed( key, scancode, isrepeat )
	Game.Functions["keypressed"](key, scancode)
end

function love.draw()
	Game.Functions["draw"]()
end

function love.update( dt )
	Game.Functions["update"]( dt )

end

function love.mousepressed( x, y, button, istouch )
	Game.Functions["mousepressed"]( x, y, button, istouch )
end

function love.wheelmoved(x, y)
	Game.Functions["wheelmoved"](x,y)
end










