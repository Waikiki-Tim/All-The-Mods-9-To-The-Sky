function CheckBlock(placeDirection)
    local has_block, data
    local blockName
    local hasSupplies

    if placeDirection == "up" then
        has_block, data = turtle.inspectUp()
    elseif placeDirection == "down" then
        has_block, data = turtle.inspectDown()
    end
  
    if has_block then
        blockName = data.name
        print(blockName)
    else
        hasSupplies = false
        for ii = 2,16 do
            if turtle.getItemCount(ii) > 0 then
                turtle.select(ii)
                hasSupplies = true
                print("I have supplies")
                break
            end
        end
        if hasSupplies == false then
            error("No supplies")
        end
        print("Placing from slot "..turtle.getSelectedSlot())
        if placeDirection == "up" then
            turtle.placeUp()
        elseif placeDirection == "down" then
            print(turtle.placeDown())
        end
  
      --print(textutils.pagedPrint(blockName))
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
        elseif icommand == "checkUp" then
            CheckBlock("up")
        elseif icommand == "checkDown" then
            CheckBlock("down")
        elseif icommand == "refuel" then
            Refuel()
        elseif icommand == "unload" then
            Unload()
        elseif icommand == "return" then
            -- maybe later
        end
    end
end

function Refuel()
    if turtle.getSelectedSlot ~= 1 then
        turtle.select(1)
    end

    while turtle.getFuelLevel() < 250 do
        turtle.refuel(1)
    end

    if turtle.getItemCount() < 64 then
        turtle.suck(64 - turtle.getItemCount())
    end
end

function Unload()
    if turtle.getItemCount(2) > 0 then
        turtle.select(2)
        turtle.drop()
    end

    if turtle.getItemCount(3) > 0 then
        turtle.select(3)
        turtle.drop()
    end
end

for jj = 1,5 do
    CheckBlock("down")
    turtle.forward()
end
