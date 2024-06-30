local modem = peripheral.find("modem") or error("No modem attached", 0)

function sendMessage(modemId, message)
    modem.transmit(modemId, modemId + 50000, message)
end

sendMessage(3, "execute at WaikikiTim run tp @e[type=minecraft:sheep,distance=..64] 4235 -45 26")
