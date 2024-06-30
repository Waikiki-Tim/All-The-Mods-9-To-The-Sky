local which = "mobs"
local where = "void"
local message = ""
local modem = peripheral.find("modem") or error("No modem attached", 0)
local modemId = os.getComputerID()
-- To get dimension: /data get entity @s Dimension
commands.gamerule("commandBlockOutput", false)

function GetDimension()
    local success, results, _ = commands.data.get.entity("@p Dimension")
    if success then
        local s, e = string.find(results[1],": \"",1)
        s = e + 1
        results = string.sub(results[1], s)
        local l = string.len(results)
        local dimension = string.sub(results, 1, l - 1)
      
        return(dimension)
    else
      error("Could not get dimension")
    end
  end
  
  function getMessage()
    while true do
        modem.open(modemId)
        local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
        modem.close(modemId)

        processMessage(message)
    end
end

function processMessage(message)
    local equalPos = string.find(message, "=")
    local var = string.sub(message, 1, equalPos - 1)
    local val = string.sub(message, equalPos + 1)

    if var == "which" then
        which = val
    elseif var == "where" then
        where = val
    elseif string.sub(message, 1, 6) == "reboot" then
        os.reboot()
    end
end

function WT_tp(x, y, z, dimension)
    if which == "mobs" then
        commands.exec("execute in " .. dimension .. " at WaikikiTim run tp @e[type=#minecraft:hostile,distance=0.01..64] "..x.." "..y.." "..z)
    elseif which == "all" then
        commands.exec("execute in " .. dimension .. " at WaikikiTim run tp @e[distance=0.01..64] "..x.." "..y.." "..z)
    elseif which == "kill" then
        commands.exec("execute in " .. dimension .. " as WaikikiTim at @s run kill @e[type=#minecraft:hostile,distance=0.01..64]")
    elseif which == "none" then
        which = "none" -- execute something.
    else
        error("Invalid which")
    end
end

function WT_tp2(mob, x, y, z)
    commands.exec("execute at WaikikiTim run tp @e[type="..mob..",distance=0.01..64] "..x.." "..y.." "..z)
end

yy = 0
function Banish()
    while true do
        local dimension = GetDimension()
        local target = {}
        local withertarget = {}

        if dimension == "minecraft:the_nether" then
            target = {605,58,24}
            withertarget = {0,100,0}
        elseif dimension == "minecraft:the_end" then
            target = {0,60,1}
            withertarget = {0,100,0}
            commands.exec("execute at WaikikiTim run tp @e[type=minecraft:ender_dragon] -1000 -1000 -1000")
        elseif dimension == "twilightforest:twilight_forest" then
            target = {517,5,1269}
            withertarget = {517,-100,1269}
        elseif dimension == "blue_skies:everbright" then
            target = {-10384,100,-7355}
            withertarget = {-10384,100,-7355}
        else
            if where == "cornfield" then
                target = {4235,-60,4}
            elseif where == "void" then
                target = {4235,-200,4}
            else
                target = {4235,-200,4}
            end
            withertarget = {4235,-200,4}
        end

        WT_tp(target[1],target[2],target[3], dimension)
        for hostile in io.lines("hostiles.txt") do
            WT_tp2(hostile,target[1],target[2],target[3])
        end

        sleep(0.25)
    end
end

parallel.waitForAll(Banish, getMessage)
