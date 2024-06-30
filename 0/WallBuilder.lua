function CheckForSupplies()
    hasSupplies = false
    for ii = 2,16 do
        if turtle.getItemCount(ii) > 0 then
            turtle.select(ii)
            hasSupplies = true
            break
        end
    end
    if hasSupplies == false then
        error("No supplies")
    end
end

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
            CheckForSupplies()
            turtle.place()
        elseif icommand == "placeDown" then
            CheckForSupplies()
            turtle.placeDown()
        elseif icommand == "dig" then
            turtle.dig()
        elseif icommand == "digUp" then
            turtle.digUp()
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

--start = {"turnLeft","up"}
placeIt = {"back","place"}
turnLeft = {"turnLeft"}
up = {"up","placeDown","back","turnLeft"}

for kk = 1,4 do
--    DoWork(start)

    for jj = 1,3 do
        for ii = 1,33 do
            DoWork(placeIt)
        end

        if jj < 4 then
            DoWork(turnLeft)
        end
    end

    for ii = 1,32 do
        DoWork(placeIt)
    end
    DoWork(up)
end
