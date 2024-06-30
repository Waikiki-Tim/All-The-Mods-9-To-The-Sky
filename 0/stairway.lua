placeIt = {}

function DoWork(path)
    for ii, icommand in pairs(path) do
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
        elseif icommand == "checkUp" then
            CheckBlock("up")
        elseif icommand == "checkDown" then
            CheckBlock("down")
        elseif icommand == "checkForward" then
            CheckBlock("forward")
        elseif icommand == "place" then
            turtle.place()
        elseif icommand == "placeDown" then
            turtle.placeDown()
        elseif icommand == "dig" then
            turtle.dig()
        elseif icommand == "digDown" then
            turtle.digDown()
        elseif icommand == "refuel" then
            Refuel()
        elseif icommand == "unload" then
            Unload()
        elseif icommand == "return" then
            -- maybe later
        end
    end
end

placeIt = {"down","forward","place"}
takeIt = {"dig","forward","up"}
take2 = {"dig","forward"}
bedrock = {"forward","digDown","placeDown"}
--for ii = 1,5 do
--    turtle.select(ii)

    for jj = 1,64 do
        DoWork(takeIt)
        sleep(0.25)
    end
--end