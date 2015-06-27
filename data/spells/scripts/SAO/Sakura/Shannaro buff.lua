local waittime = 240  -- czas
local storage = 115821
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 49)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionParam(condition, CONDITION_PARAM_SPEED, 20)
setConditionParam(condition, CONDITION_PARAM_SKILL_MELEE, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, 10)
setConditionParam(condition, CONDITION_PARAM_STAT_MAXHEALTH, 1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAXMANA, 1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 10)
setCombatCondition(combat, condition)
function onCastSpell(cid, var)
if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, 'Your have to wait ' .. exhaustion.get(cid, storage) ..' seconds to use again.)')
		return false
		end

	doCombat(cid, combat, var)
	exhaustion.set(cid, storage, waittime)
end