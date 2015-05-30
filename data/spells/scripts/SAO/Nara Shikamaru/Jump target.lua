 local config = {
                jumps = 7,
                walktime = 220
}

combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 87)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -15, 5, 5, 1.8, 3, -20, -40)


function onCastSpell(cid)
    function move(cid, pos, n)
        local n = n or 0

        if (n < config.jumps) then
            if (isCreature(cid)) then
                local pos = pos or getCreaturePosition(cid)
                local target = getCreatureTarget(cid)

                local dir = (target ~= 0) and getDirectionTo(pos, getCreaturePosition(target)) or getCreatureLookDirection(cid)
                local tpos = (target ~= 0) and getCreaturePosition(target)

                local newPos

                if ((target ~= 0) and ((pos.x == tpos.x) and (pos.y == tpos.y))) then
                    newPos = tpos
                else
                    newPos = getPosByDir(pos, dir)
                end

                if ((getTopCreature(newPos).uid == 0) and doTileQueryAdd(cid, newPos) ~= 1) then return false end

                doCombat(cid, combat, {
                    pos = newPos,
                    type = 2
                })

                addEvent(move, config.walktime, cid, newPos, n + 1)
            end
        end
    end

    move(cid)

    return true
end  