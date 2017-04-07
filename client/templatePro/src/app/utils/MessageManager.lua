

MessageType = {
	ENUM_MSGTYPE_TEST = 1, -- 测试消息

	

	ENUM_MSGTYPE_MSGEND = 100000 -- 结束消息
}

-- 消息单元
local Message = class("Message")

function Message:ctor()
	self.msgType = 1
	self.msgData = {}
end

function Message:destory()
	self.msgType = 1
	self.msgData = {}
end



-- 通知工具类
MessageManager = class("MessageManager")

function MessageManager:ctor()
	self.m_regedit = {} -- 消息注册表
	self.m_msgCash = {}
end

function MessageManager:destory()
	self.m_regedit = {}
end

function MessageManager:getInstance()
	if nil == MessageManager.singleTon then
		MessageManager.singleTon = MessageManager:new()
	end
	return MessageManager.singleTon
end

-- 注册消息监听
function MessageManager:registMsg(msgType, msgHandle)
	if nil == self.m_regedit[msgType] then
		self.m_regedit[msgType] = {}
	end
	table.insert(self.m_regedit[msgType], msgHandle)
end

-- 取消消息监听
function MessageManager:unRegistMsg(msgType, msgHandle)
	if nil ~= self.m_regedit[msgType] then
		for i,v in ipairs(self.m_regedit[msgType]) do
			if v == msgHandle then
				table.remove(self.m_regedit[msgType], i)
				return
			end
		end
	end
end

-- 发送消息
function MessageManager:sendMsg(message)
	if nil ~= self.m_regedit[message.msgType] then
		
		cclog("table.getn(m_regedit[message.msgType]):" .. table.getn(self.m_regedit[message.msgType]))
		for i,v in ipairs(self.m_regedit[message.msgType]) do
			v(message)
		end
		message:destory()
		table.insert(self.m_msgCash, message)
	end
end

-- 获取一条消息
function MessageManager:getMsg()
	if table.getn(self.m_msgCash) > 0 then
		return table.remove(self.m_msgCash)
	else
		return Message:new()
	end
end

