local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 4)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 2)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 2.4, 2.1)

local poison = createConditionObject(CONDITION_PARALYZE)
setConditionParam(poison, CONDITION_PARAM_TICKS, 1000)
setConditionFormula(poison, -0.8, -1, -0.9, -1)
setCombatCondition(combat1, poison)
if math.random(1,50) <= 25 then
setCombatCondition(combat1, poison)
end

local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local pisos = {}

function onCastSpell(cid, var)
if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end

local config = {
tempo = 1
}


local pos = getThingPos(cid)
table.insert(pisos, getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid)
local list = tonumber(#pisos)


local position = {}


local id = {}


local msg = {
[1] = "Shuriken no jutsu",
[2] = "",
[3] = "",

}


function canEffect(pos, pz, proj) -- Night Wolf based on Nord
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
if getTilePzInfo(pos) and not pz then return false end
local n = not proj and 3 or 2
for i = 0, 255 do
pos.stackpos = i
local tile = getTileThingByPos(pos)
if tile.itemid ~= 0 and not isCreature(tile.uid) then
if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
return false
end
end
end
return true
end  





for i = 1, #id do
if canEffect(position[i]) then
doCreateItem(id[i], 1, position[i])
addEvent(RemoveItem, config.tempo*100, cid, i)
end
end


local parameters = {cid = cid, var = var, combat1 = combat1}


for k = 1, #msg do
addEvent(function()
if isPlayer(cid) then
addEvent(onCastSpell1, 3, parameters)
doCreatureSay(cid, msg[k], 20, false, 0, pos)
end
end, 1 + ((k-1) * 300))
end
exhaustion.set(cid, storage, waittime)
		 doCombat(cid,combat, var)

return true
end