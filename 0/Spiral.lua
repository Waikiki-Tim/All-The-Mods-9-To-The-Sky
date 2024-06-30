function CheckForSupplies()
    hasSupplies = false
    for ii = 1,16 do
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
            turtle.place()
        elseif icommand == "placeDown" then
            turtle.placeDown()
        elseif icommand == "dig" then
            turtle.dig()
        elseif icommand == "digDown" then
            turtle.digDown()
        elseif icommand == "checkForSupplies" then
            CheckForSupplies()
        elseif icommand == "refuel" then
            Refuel()
        elseif icommand == "unload" then
            Unload()
        elseif icommand == "return" then
            -- maybe later
        end
    end
end

moveDig = {"checkForSupplies","forward","placeDown"}
turn = {"turnLeft"}
next = {"back","turnRight","forward","turnLeft"}
kk = 3 -- number of blocks to place per side. 
rings = 15 -- (rings + rings + 1)^2 = the number of blocks you will need.

DoWork(next)

for ring = 1,rings do
    for ii = 1,4 do -- four sides to a square
        for jj = 1,kk do
            DoWork(moveDig)
        end

        DoWork(turn)

        if ii == 4 then
            DoWork(next)
            kk = kk + 2 -- the number of blocks to place goes up by two for each ring.
        end
    end
end