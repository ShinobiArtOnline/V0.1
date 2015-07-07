Guard = {
	config = {			  
		attackspeed = 100,
	},
	combat = {type = COMBAT_PHYSICALDAMAGE, min = 1500, max = 2000}
}

function Guard:new()
		local ret = {}
		setmetatable({}, {__index = self.combat})
		setmetatable(ret, {__index = self})
		return ret
end

function Guard:reset()
	self.config = Guard.config
	self.target = 0
	selfFollow(0)
	doTeleportThing(self.id, self.position)
end


function Guard:updateTarget()
	if self.target ~= 0 then
		return
	end

	local creatures = getSpectators(getThingPosition(self.id), self.range, self.range, false)
	for i = 1, #creatures do
		local target = creatures[i]
		if isCreature(target) and not isNpc(target) and getCreatureSkull(target) >= 3 then
			if not getTilePzInfo(getThingPosition(target)) then
				if selfFollow(target) then
					selfSay("I don't tolerate people like you, ".. getCreatureName(target))
					self.target = target
					self:attack()
					break
				end
			end
		else
			self:reset()
		end
	end
end

function Guard:attack()
	if self.target == 0 then
		self:reset()
		return
	end

	self.time = self.time or os.clock()
	if self.time < os.clock() then
		if getDistanceBetween(getThingPosition(self.id), getThingPosition(self.target)) == 1 then
			doTargetCombatHealth(self.id, self.target, self.combat.type, -self.combat.min, -self.combat.max, CONST_ME_DRAWBLOOD)
		end
		self.time = self.time + (self.config.attackspeed/100)
	end
end