local modem = peripheral.find("modem") or error("No modem attached", 0)
local message = ""

function processMessage()
    if string.sub(message, 1, 2) == "tp" then
        parms = string.sub(message, 4)
        commands.tp(parms)
    elseif string.sub(message, 1, 4) == "fill" then
        parms = string.sub(message, 6)
        commands.fill(parms)
    elseif string.sub(message, 1, 7) == "execute" then
        commands.exec(message)
    elseif string.sub(message, 1, 6) == "reboot" then
        os.reboot()
    else
        print(message)
    end
end

while true do
    modemId = os.getComputerID()
    modem.open(modemId)
    event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    modem.close(modemId)
    processMessage()
end
