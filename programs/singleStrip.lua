os.loadAPI("utils.lua")

function start()
    pacesSet = 0
    for i = 1, 100 do
        if !utils.checkFuel() or utils.isFull() then
            break
        end
        mineablePosition = utils.checkStone()
        while mineablePosition > -1 do
            utils.mine(mineablePosition)
            mineablePosition = utils.checkStone()
        end

        if moveForward() then
            break
        end

        pacesSet = i
    end

    utils.returnPaces(pacesSet)
    

end
start()