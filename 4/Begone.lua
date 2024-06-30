local modem = peripheral.find("modem") or error("No modem attached", 0)

function sendMessage(modemId, message)
    modem.transmit(modemId, modemId + 50000, message)
end

sendMessage(3, "execute in minecraft:overworld run tp @e[type=minecraft:wandering_trader] 4235 -60 4")
--sendMessage(3, "execute in minecraft:overworld run tp @e[type=minecraft:trader_llama] 242 153 -1467")
