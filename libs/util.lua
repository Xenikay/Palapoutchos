
function ScrW()
	local width = love.window.getMode()
	return width
end

function ScrH()
	local _, height = love.window.getMode()
	return height
end