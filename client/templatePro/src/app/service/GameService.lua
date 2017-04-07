--
-- Author: qinxiaopeng
-- Date: 2017-03-26 20:15:20
--

GameService = class("GameService")

function GameService:ctor()
	
end

function GameService:getInstance()
 	if nil == GameService.singleTon then
 		GameService.singleTon = GameService.new()
 	end
 	return GameService.singleTon
end

function GameService:gameStart()
	self.mainScene = require("app.scenes.MainScene").new()
	display.replaceScene(self.mainScene)

	


	-- local mapView = ViewMgr:getInstance():openView("GameMapView")
	-- self.mainScene:addChild(mapView)
end

-- 加载存储文件
function GameService:loadStorage()

end


