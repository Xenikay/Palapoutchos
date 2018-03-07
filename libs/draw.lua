draw = {}

function draw.RectOutLine( x, y, sizex, sizey, size, color_r, color_g, color_b, color_alpha )
	love.graphics.setColor( (color_r or 255), (color_g or 255), (color_b or 255), (color_alpha or 255) )
	love.graphics.rectangle("fill", x, y, sizex, size )
	love.graphics.rectangle("fill", x, y, size, sizey )
	love.graphics.rectangle("fill", x, y + sizey - size, sizex, size )
	love.graphics.rectangle("fill", x + sizex - size, y, size, sizey )
	love.graphics.setColor( 255, 255, 255, 255 )
end 