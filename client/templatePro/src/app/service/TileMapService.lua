--
-- Author: Your Name
-- Date: 2017-03-31 09:36:08
--

TileMapService = class("TileMapService")

function TileMapService:ctor()
	
end

function TileMapService:getInstance()
	if nil == TileMapService.singleTon then
		TileMapService.singleTon = TileMapService.new()
	end
	return TileMapService.singleTon
end

function TileMapService:loadMap(path)
	local map = cc.TMXTiledMap:create("map/" .. path .. ".tmx")  
	return map
end




