Button = {}
Button.__index = Button
Button.Reference = {}

function Button.UpdateButtons( dt )
	if not ( dt ) then print( "[Error] NO DELTA TIME" ) end
	for k , v in pairs ( Button.Reference ) do
		v:Update( dt )
	end
end

function Button.RemoveAll()
	Button.Reference = {}
end

function Button.UpdateMouseOver( x, y )
	for k , v in pairs ( Button.Reference ) do
		if ( v:CheckCollision( x, y ) ) then
			print( 1, 1 )
			if ( not v.hovered ) then
				print( 2, 1 )
				v:OnCursorEntered()
				v.hovered = true
			end
		else
			if ( v.hovered ) then
				v:OnCursorExited()
				v.hovered = false
			end
		end
	end
end

function Button.Create( pos_x, pos_y, size_x, size_y, text, font, align )
	local data = {
		pos = { x = pos_x, y = pos_y },
		size = { x = size_x, y = size_y },
		text = ( text or "" ),
		hovered = false,
		align = ( align or "center" ),
		font = ( font or 4 )
	}
	local Class = setmetatable( data, Button )
	local key = #Button.Reference + 1
	Class.Key = key
	Button.Reference[key] = Class
	return Class
end

function Button:GetPosX()
	return self.pos.x
end

function Button:GetPosY()
	return self.pos.y
end

function Button:SetPos( x, y )
	self.pos.x = ( x or self.pos.x )
	self.pos.y = ( y or self.pos.y )
end

function Button:Paint()
	love.graphics.setColor( 55, 60, 65, 240 )
	love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.x, self.size.y )
	draw.RectOutLine( self.pos.x, self.pos.y, self.size.x, self.size.y, 2 )
	love.graphics.setFont( Game.Fonts[self.font] )
	love.graphics.printf( self.text, self.pos.x, self.pos.y, self.size.x, self.align )
end

function Button:OnCursorEntered()

end

function Button:OnCursorExited()

end

function Button:DoClick( key )
	print( "Clicked on : " .. tostring( self ) )
end

function Button:Update( dt )

end

function Button:CheckCollision( x, y )
  return x > self.pos.x and x < self.pos.x + self.size.x and y > self.pos.y + Game.PosY and y < self.pos.y + self.size.y + Game.PosY
end

function Button:Remove()
	Button.Reference[self.Key] = nil
end