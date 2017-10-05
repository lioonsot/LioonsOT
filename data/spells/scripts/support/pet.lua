--Script By Igor Labanca
function onCastSpell(creature, variant)
		
	local STORAGE_PET = 60045
		
	    vocationid = creature:getVocation():getId()
	        if  vocationid == 5 then
				pet = "Thundergiant"
			
			elseif vocationid == 6 then
				pet = "Grovebeast"
			
			elseif vocationid == 7 then
				pet = "Emberwing"

			elseif vocationid == 8 then
				pet = "Skullfrost"
		end
		
		
            
	local monsterType = MonsterType(pet)
	
	if monsterType == nil then
		creature:sendCancelMessage("You vocation cannot use this spell.")
		return false
		end
	
	
--if not monsterType:isPet() then       ###########NEED FIX##########
--	creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
--	creature:getPosition():sendMagicEffect(CONST_ME_POFF)
--	return false
---end


			
		if #creature:getSummons() >= 1 then
			creature:sendCancelMessage("You cannot summon more creatures.")
			creature:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false
			
end
	
	local position = creature:getPosition()
	local summonpet = Game.createMonster(pet,position)
	if not summonpet then
		creature:sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	creature:addSummon(summonpet)
	position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	
	local timestorage = 900 --15 minutes
	creature:setStorageValue(STORAGE_PET,0)
	creature:setStorageValue(STORAGE_PET,os.time()+timestorage)
	return true
	
end
