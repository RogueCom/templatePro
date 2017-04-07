--
-- Author: Your Name
-- Date: 2017-03-31 11:29:35
--

ENUM_DIRECTION = {
	ENUM_DIR_LEFT_UP = 1, -- 左上
	ENUM_DIR_LEFT_DOWN = 2, -- 左下
	ENUM_DIR_RIGHT_UP = 3, -- 右上
	ENUM_DIR_RIGHT_DOWN = 4 -- 右下
}


local GameMapView = class("GameMapView", function()
	return display.newLayer("GameMapView")
end)


function GameMapView:ctor()
	self.viewScale = 1
	self:replaceMap("test04", cc.p(-60, -30)) -- , cc.vec2(-60, -30))
end

-- 切换地图
function GameMapView:replaceMap(mapName,pos)
	self.map = cc.TMXTiledMap:create("map/" .. mapName .. ".tmx")
	self.map:setPosition(pos.x, pos.y)
	self:addChild(self.map)
	self.map:addTouchEventListener(handler(self, self.move))
end

-- 移动
function GameMapView:move(direction)
	local distanceX = GameConfig.mapScale * GameConfig.stepWith * self.viewScale
	local distanceY = GameConfig.mapScale * GameConfig.stepWith * self.viewScale
	if direction == ENUM_DIRECTION.ENUM_DIR_LEFT_UP then
		distanceX = -distanceX
		distanceY = distanceY
	elseif direction == ENUM_DIRECTION.ENUM_DIR_LEFT_DOWN then
		distanceX = -distanceX
		distanceY = -distanceY
	elseif direction == ENUM_DIRECTION.ENUM_DIR_RIGHT_UP then
		distanceX = distanceX
		distanceY = distanceY
	elseif direction == ENUM_DIRECTION.ENUM_DIR_RIGHT_DOWN then
		distanceX = distanceX
		distanceY = -distanceY
	end
	local selfPos = self:getPosition()
	self:setPosition(selfPos.x + distanceX, selfPos.y + distanceY)
end

function GameMapView:click(target, eventType)
	if eventType then
		--todo
	end
end

return GameMapView