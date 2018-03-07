local GM = Gamemode.Create( "old_Menu", 99 )

GM:SetCallback( "initialize", function()

	local function CreateWikiButton( y, v )
		local Class = Button.Create( 50, y, 300, 50, v.Word, 4 )
		Class.BackColor = 55
		Class.DoClick = function()
			Game.Sounds["Select"]:play()
			Game.Sounds["Select"]:rewind()
			Game.Description:clear()
			Game.Description:addf( v.Description, ScrW()*0.7 - 10, "left" )
			Game.URL = v.WikiLink
			if ( v.Image ) then
				Game.Image.Class = love.graphics.newImage( "contents/images/" .. v.Image )
				Game.Image.Position.y = ScrH()*0.03 + 5 + Game.Description:getHeight()
			else
				Game.Image.Class = nil
			end
		end
		
		Class.OnCursorEntered = function()
			Game.Sounds["Hovered"]:play()
			Game.Sounds["Hovered"]:rewind()
		end
		
		Class.Paint = function( self )
			love.graphics.setColor( self.BackColor, self.BackColor, self.BackColor, 240 )
			love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.x, self.size.y )
			draw.RectOutLine( self.pos.x, self.pos.y, self.size.x, self.size.y, 1 )
			love.graphics.setFont( Game.Fonts[self.font] )
			love.graphics.printf( self.text, self.pos.x, self.pos.y, self.size.x, self.align )
		end
		
		Class.Update = function( self, dt )
			if ( self.hovered ) then
				if ( self.BackColor < 150 ) then
					self.BackColor = self.BackColor + ( 150 * dt )
				end
			else
				if ( self.BackColor > 55 ) then
					self.BackColor = self.BackColor - ( 150 * dt )
				end
			end
		end
		
	end

	Game.PosY = 0
	Game.Description = love.graphics.newText( Game.Fonts[4], "Vide" )
	Game.URL = ""
	Game.Image = {}
	Game.Image.Class = nil
	Game.Image.Position = { x = ScrW()*0.275 + 5, y = 5 }
	Game.Image.Size = { x = 5, y = 5 }
	
	local posy = 10
	for k , v in pairs ( Wiki.Art ) do
		CreateWikiButton( posy, v )
		posy = posy + 70
	end
	
end )

GM:SetCallback( "draw", function()
	love.graphics.origin()
	
	love.graphics.setColor( 55, 60, 65, 240 )
	love.graphics.rectangle( "fill", ScrW()*0.275, ScrH()*0.025, ScrW()*0.7, ScrH()*0.9 )

	love.graphics.setColor( 32, 40, 50, 240 )
	love.graphics.rectangle( "fill", 0, 0, ScrW()*0.25, ScrH() )

	love.graphics.setColor( 255, 255, 255, 240 )
	draw.RectOutLine( ScrW()*0.275, ScrH()*0.025, ScrW()*0.7, ScrH()*0.9, 1 )
	-- love.graphics.setFont( Game.Fonts[4] )
	-- love.graphics.printf( Game.Description, ScrW()*0.275 + 5, ScrH()*0.03 + 5, ScrW()*0.7 - 10, "left" )
	love.graphics.draw( Game.Description, ScrW()*0.275 + 5, ScrH()*0.03 + 5 )
	
	love.graphics.setFont( Game.Fonts[4] )
	love.graphics.printf( Game.PosY, 5, 5, 500, "left" )
	
	if ( Game.Image.Class ) then
		love.graphics.setColor( 255, 255, 255, 240 )
		love.graphics.draw( Game.Image.Class, Game.Image.Position.x, Game.Image.Position.y )
		draw.RectOutLine( Game.Image.Position.x, Game.Image.Position.y, Game.Image.Class:getWidth(), Game.Image.Class:getHeight(), 2 )
	end
	
	love.graphics.translate( 0, Game.PosY )
	for k, v in pairs ( Button.Reference ) do
		v:Paint()
	end
end )

GM:SetCallback( "update", function( dt )
	for k, v in pairs ( Button.Reference ) do
		v:Update( dt )
	end
end )

GM:SetCallback( "mousemoved", function( x, y, key )
	Button.UpdateMouseOver( x, y )
end )

GM:SetCallback( "mousepressed", function( x, y, key )
	for k, v in pairs ( Button.Reference ) do
		if ( v:CheckCollision( x, y ) ) then
			v:DoClick()
		end
	end
end )

GM:SetCallback( "wheelmoved", function( x, y )
	Game.PosY = Game.PosY + ( y * 30 )
	if ( Game.PosY > 0 ) then
		Game.PosY = 0
	end
end )

GM:SetCallback( "keypressed", function( key, scancode, isrepeat )
	if ( key == "space" ) then
		if ( Game.URL == "" ) then return end
		love.system.openURL( Game.URL or "www.google.com")
	end
end )


