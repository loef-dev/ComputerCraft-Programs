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
