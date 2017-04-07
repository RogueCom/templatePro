
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
	local layer = display.newLayer()
	layer:setPosition(0, 0)
	self:addChild(layer)

	self.map = display.newSprite("map/res/test01.jpg")
	layer:addChild(self.map)
	
	local widget = ccs.GUIReader:getInstance():widgetFromJsonFile("ui/view_test.json")
	layer:addChild(widget)

	self.btn_l_u = ccui.Helper:seekWidgetByName(widget, "btn_l_u")
	self.btn_l_u:addTouchEventListener(handler(self, self.mapMove))
	self.btn_l_d = ccui.Helper:seekWidgetByName(widget, "btn_l_d")
	self.btn_l_d:addTouchEventListener(handler(self, self.mapMove))
	self.btn_r_u = ccui.Helper:seekWidgetByName(widget, "btn_r_u")
	self.btn_r_u:addTouchEventListener(handler(self, self.mapMove))
	self.btn_r_d = ccui.Helper:seekWidgetByName(widget, "btn_r_d")
	self.btn_r_d:addTouchEventListener(handler(self, self.mapMove))
end

function MainScene:mapMove(target, eventType)
	if eventType == ccui.TouchEventType.ended then
		local mapPos_x, mapPos_y = self.map:getPosition()
		local distanceX = GameConfig.mapScale * GameConfig.stepWith
		local distanceY = GameConfig.mapScale * GameConfig.stepHight
		if target == self.btn_l_u then
			distanceX = distanceX
			distanceY = -distanceY
		elseif target == self.btn_l_d then
			distanceX = distanceX
			distanceY = distanceY
		elseif target == self.btn_r_u then
			distanceX = -distanceX
			distanceY = -distanceY
		elseif target == self.btn_r_d then
			distanceX = -distanceX
			distanceY = distanceY
		end
		self.map:setPosition(mapPos_x + distanceX, mapPos_y + distanceY)
	end
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
