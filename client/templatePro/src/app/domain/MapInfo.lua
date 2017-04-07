--
-- Author: Your Name
-- Date: 2017-03-31 11:09:17
--

local MapInfo = class("MapInfo")

function MapInfo.ctor()
	self.m_map_width = 0 	-- 地图格子数-宽
	self.m_map_height = 0	-- 地图格子数-高

	self.m_pos_x = 0 		-- 角色当前格子位置-x
	self.m_pos_y = 0		-- 角色当前格子位置-y
end

function MapInfo:setWidth(width)
	self.m_map_width = width
end

function MapInfo:getWidth()
	return self.m_map_width
end

function MapInfo:setHeigth(height)
	self.m_map_height = height
end

function MapInfo:getHeight()
	return self.m_map_height
end

return MapInfo
