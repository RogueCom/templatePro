--
-- Author: Your Name
-- Date: 2017-03-31 10:46:47
--

GameMapMgr = class("GameMapMgr")

function GameMapMgr:ctor()
	self.mapLayer = nil
	self.currentMap = nil
end

function GameMapMgr:getInstance()
	if nil == GameMapMgr.singleTon then
		GameMapMgr.singleTon = GameMapMgr.new()
	end
	return GameMapMgr.singleTon
end

-- 切换地图
function GameMapMgr:replaceMap(mapName, direction)
	if nil ~= self.mapLayer then
		self.mapLayer:removeAllChildren()
		self.currentMap = cc.TMXTiledMap:create("map/" .. name .. ".tmx")
		self.mapLayer:addChild(self.currentMap)
	end
end



