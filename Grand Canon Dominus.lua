local config = {
    monsterName = 'Grand Canon Dominus',
    bossPosition = Position(958, 1008, 7),
    centerPosition = Position(958, 1008, 7),
    rangeX = 5,
    rangeY = 5
}

local function checkBoss(centerPosition, rangeX, rangeY, bossName)
    local spectators, spec = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
    for i = 1, #spectators do
        spec = spectators[i]
        if spec:isMonster() then
            if spec:getName() == bossName then
                return true
            end
        end
    end
    return false
end
local Global = GlobalEvent("Boss")
function Global.onThink(interval, lastExecution)
    if checkBoss(config.centerPosition, config.rangeX, config.rangeY, config.monsterName) then
        return true
    end
	
	addEvent(Game.broadcastMessage, 150, 'Ha Aparecido El Gran Boss.', MESSAGE_EVENT_ADVANCE)

    --local boss =
	Game.createMonster(config.monsterName, config.bossPosition, true, true)
    --boss:setReward(true)
    return true
end

Global:interval(2000)
--Global:register()
