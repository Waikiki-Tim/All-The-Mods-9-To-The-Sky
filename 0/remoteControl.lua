local modem = peripheral.find("modem") or error("No modem attached", 0)

function getMessage()
    while true do
        modem.open(0)
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
        modem.close(0)

        DoWork(message)
    end
end

function DoWork(icommand)
    if icommand == "turnLeft" then
        assert(turtle.turnLeft())
    elseif icommand == "turnRight" then
        assert(turtle.turnRight())
    elseif icommand == "forward" then
        assert(turtle.forward())
    elseif icommand == "up" then
        assert(turtle.up())
    elseif icommand == "down" then
        assert(turtle.down())
    elseif icommand == "back" then
        assert(turtle.back())
    elseif icommand == "place" then
        turtle.place()
    elseif icommand == "placeUp" then
        turtle.placeUp()
    elseif icommand == "placeDown" then
        turtle.placeDown()
    elseif icommand == "dig" then
        turtle.dig()
    elseif icommand == "digUp" then
        turtle.digUp()
    elseif icommand == "digDown" then
        turtle.digDown()
    else
        shell.execute(icommand)
    end
end

getMessage()
