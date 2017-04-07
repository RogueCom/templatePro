
require("config")
require("cocos.init")
require("framework.init")
require("lfs")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
    if device.platform == "windows" then
        cc.Director:getInstance():getOpenGLView():setFrameZoomFactor(1.0)
    else
        cc.Director:getInstance():getOpenGLView():setFrameZoomFactor(1.0)
    end
end

function MyApp:run()
    self:loadSerchPath()
    self:loadScripts()

    cclog = Logger.debug
    Logger.setLevel(Logger.kDebug)

    GameService:getInstance():gameStart()

    
end

-- 加载文件路径
function MyApp:loadSerchPath()
    cc.FileUtils:getInstance():addSearchPath("res/")
    cc.FileUtils:getInstance():addSearchPath("res/ui/")
    cc.FileUtils:getInstance():addSearchPath("src/")

    if device.platform == "windows" then

    else
        self:createDir()

        local serchPaths = cc.FileUtils:getInstance():getSearchPaths()
        local changePath = {}
        
        table.insert(changePath, device.writablePath .. "upd")
        table.insert(changePath, device.writablePath .. "upd/res/")
        table.insert(changePath, device.writablePath .. "upd/res/ui/")

        for i,v in ipairs(serchPaths) do
            table.insert(changePath, v)
        end
        cc.FileUtils:getInstance():setSearchPaths(changePath)
    end
end

function MyApp:createDir()
    if not io.exists(device.writablePath .. "upd") then
        lfs.mkdir(device.writablePath .. "upd")
    end
    if not io.exists(device.writablePath .. "upd/res") then
        lfs.mkdir(device.writablePath .. "upd/res")
    end
    if not io.exists(device.writablePath .. "upd/res/ui") then
        lfs.mkdir(device.writablePath .. "upd/res/ui")
    end
end

-- 加载脚本
function MyApp:loadScripts()
    utils = require("framework.cc.utils.init")
    cc.utils.ByteArray = cc.utils.ByteArray or utils.ByteArray
    require("app.utils.logger")
    require("app.utils.MessageManager")
    
    require("app.service.GameService")
    require("app.service.ViewMgr")
    require("app.service.TileMapService")

    require("app.config.GameConfig")
end

return MyApp
