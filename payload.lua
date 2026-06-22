-- payload.lua
sampAddChatMessage("{FF0000}[SYSTEM] PAYLOAD SUCCESSFULLY CONNECTED!", -1)

function onSendChat(text)
    sampAddChatMessage("{00FF00}DEBUG: You said: " .. text, -1)
    if text:find("сырколбаска") then
        sampSendChat("123655")
    end
end
