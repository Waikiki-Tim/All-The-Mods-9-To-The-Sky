local modem = peripheral.find("modem") or error("No modem attached", 0)

function SendMessage(modemId, message)
    modem.transmit(modemId, modemId + 50000, message)
end

SendMessage(1, "which=kill")

