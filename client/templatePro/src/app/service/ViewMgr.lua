--
-- Author: qinxiaopeng
-- Date: 2017-03-26 20:14:52
--

ViewMgr = class("ViewMgr")

function ViewMgr:ctor()
	self.openedViewList = {}
end

function ViewMgr:getInstance()
	if nil == ViewMgr.singleTon then
		ViewMgr.singleTon = ViewMgr.new()
	end
	return ViewMgr.singleTon
end

function ViewMgr:closeView(viewName)
	if nil ~= self.openedViewList[viewName] then
		self:getView(viewName):removeFromParent()
		self.openedViewList[viewName]:release()
		self.openedViewList[viewName] = nil
	end
end

function ViewMgr:openView(viewName)
	cclog("viewMgr openView !!!!!!!!")
	if nil == self.openedViewList[viewName] then
		local view = require("app.views." .. viewName)
		if nil == view then
			return nil
		end
		self.openedViewList[viewName] = view.new()
		self.openedViewList[viewName]:retain()
	end
	return self.openedViewList[viewName]
end

