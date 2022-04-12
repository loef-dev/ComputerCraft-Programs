function checkfuel()
    if turtle.getFuelLevel() == 0 then
        return turtle.refuel(1)
    end
    print(turtle.getFuelLevel())
    return true
end
 
local position = 2
 
function checkstone()
    print("checking up" .. tostring(turtle.inspectUp()))
    local success, data = turtle.inspectUp()
    print(data.name)
    print(data.metadata)
    if turtle.inspectUp() ~= 1 then
        return 4
    end
    if turtle.inspectDown() ~= 1 then
        return 5
    end
    if inspectPosition(1) ~= 1 then
        return 1
    end
    if inspectPosition(2) ~= 1 then
        return 2
    end
    if inspectPosition(3) ~= 1 then
        return 3
    end    
    return -1            
end
 
function inspectPosition(pos)
    rotateTo(pos)
    return turtle.inspect()
end
 
function rotateTo(pos)
    if position == pos then
        return
    end
    if position < pos then
        turtle.turnRight()
        position=position+1
        rotateTo(pos)
        return
    end
    if position > pos then
        turtle.turnLeft()
        position=position-1
        rotateTo(pos)
        return
    end
end

function mineShaft(length)
    
    -- Checking if we have torches in the 16th slot
    local torchslot = 16
    local data = turtle.getItemDetail(torchslot)
    if data then
        if data.name == "minecraft:torch" then
            print("I have " .. data.count " torches")
        else
            print("I don't have torches")
            error()
        end
    end

    -- Digging the Tunnel
    for l = 1, length do
        turtle.dig()
        turtle.forward()
        turtle.digUp()

        -- Placing Torches every 5 blocks
        if length % 5 == 0 and data.count > 0 then
            turtle.placeUp(torchslot)
        else
            print("No torches, stopping")
            error()
        end
        l = l + 1
    end
end