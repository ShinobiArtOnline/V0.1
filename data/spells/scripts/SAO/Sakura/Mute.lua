local condition = createConditionObject(CONDITION_MUTED)
setConditionParam(condition, CONDITION_PARAM_TICKS, 1500)


local chance = 60






function silence(tar, text)
    if(isCreature(tar) == true) then
        doSendAnimatedText(getCreaturePosition(tar), text, 215)
        doAddCondition(tar, condition)
    end
    return true
end


function onCastSpell(cid, var)
    local tar = getCreatureTarget(cid)
    if hasCondition(tar, CONDITION_MUTED) == true then
        return false
    else
        if isCreature(tar) == true then
if math.random(1,100) <= chance then
local text = "SILENCE"
                    silence(tar, text)     
else
local text = "MISS"
doSendAnimatedText(getCreaturePosition(tar), text, 215)
end
        else
            if isPlayer(cid) == true then
                doPlayerSendCancel(cid, "Silence can be cast only on other creatures.")
            end
            return false
        end
    end
    return true
end