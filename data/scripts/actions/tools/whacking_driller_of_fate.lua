local toolGear = Action()

local function createWooden(position, removeId, createId, actionId)
	local woodPosition = Position(position)
	local woodenPlanks = Tile(woodPosition):getItemById(removeId)
	if woodenPlanks then
		woodenPlanks:remove()
		local woods = Game.createItem(createId, 1, position)
		if woods then
			woods:setActionId(actionId)
		end
	end
	return true
end

local settingTable = {
	[42501] = {
		position = Position(32647, 32216, 7),
		removeItem = 12183,
		createItem = 6474,
	},
	[42502] = {
		position = Position(32660, 32213, 7),
		removeItem = 12183,
		createItem = 6474,
	},
	[42503] = {
		position = Position(32644, 32183, 6),
		removeItem = 12185,
		createItem = 6473,
	},
	[42504] = {
		position = Position(32660, 32201, 7),
		removeItem = 12184,
		createItem = 6473,
	},
	[42505] = {
		position = Position(32652, 32200, 5),
		removeItem = 12185,
		createItem = 6473,
	},
}

local function onUseHammer(player, item, fromPosition, target, toPosition, isHotkey)
	if not target or type(target) ~= "userdata" or not target:isItem() then
		return false
	end

	-- Lay down the wood
	local targetActionId = target:getActionId()
	local position = Position(32571, 31508, 9)
	local tile = Tile(position)

	if targetActionId == 40021 and tile:getItemById(4597) then
		if player:getItemCount(5901) >= 3 and player:getItemCount(953) >= 3 then
			player:removeItem(5901, 3)
			player:removeItem(953, 3)
			player:say("KLING KLONG!", TALKTYPE_MONSTER_SAY)
			tile:getItemById(295):remove()
			tile:getItemById(291):remove()
			Game.createItem(5770, 1, position):setActionId(40021)
			return true
		end
		-- Lay down the rails
	elseif targetActionId == 40021 and tile:getItemById(5770) then
		if player:getItemCount(9114) >= 1 and player:getItemCount(9115) >= 2 and player:getItemCount(953) >= 3 then
			player:removeItem(9114, 1)
			player:removeItem(9115, 2)
			player:removeItem(953, 3)
			player:say("KLING KLONG!", TALKTYPE_MONSTER_SAY)
			Game.createItem(7122, 1, position)
			return true
		end
	end

	-- Rottin wood and married quest
	if player:getStorageValue(Storage.Quest.U8_7.RottinWoodAndTheMarriedMen.RottinStart) < 6 then
		local setting = settingTable[target:getActionId()]
		if setting then
			local woodenPosition = Position(setting.position)
			local woodenItem = Tile(woodenPosition):getItemById(setting.removeItem)
			if woodenItem then
				woodenItem:remove()
				Game.createItem(setting.createItem, 1, setting.position)
				addEvent(createWooden, 2 * 60 * 1000, setting.position, setting.removeItem, setting.createItem, target:getActionId())
				player:setStorageValue(Storage.Quest.U8_7.RottinWoodAndTheMarriedMen.RottinStart, player:getStorageValue(Storage.Quest.U8_7.RottinWoodAndTheMarriedMen.RottinStart) + 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You fixed this broken wall.")
				return true
			end
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already fixed many broken walls today.")
		return true
	end

	return false
end

local toolGear = Action()

function toolGear.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if math.random(1000) > 10 then
		if onUseCrowbar(player, item, fromPosition, target, toPosition, isHotkey) then
			return true
		elseif onUseKitchenKnife(player, item, fromPosition, target, toPosition, isHotkey) then
			return true
		elseif onUseHammer(player, item, fromPosition, target, toPosition, isHotkey) then
			return true
		elseif onUseRope(player, item, fromPosition, target, toPosition, isHotkey) then
			return true
		elseif onUseShovel(player, item, fromPosition, target, toPosition, isHotkey) then
			return true
		elseif onUsePick(player, item, fromPosition, target, toPosition, isHotkey) then
			return true
		elseif onUseMachete(player, item, fromPosition, target, toPosition, isHotkey) then
			return true
		end
	else
		player:say("Oh no! Your tool is jammed and can't be used for a minute.", TALKTYPE_MONSTER_SAY)
		player:addAchievementProgress("Bad Timing", 10)
		item:transform(item.itemid + 1)
		item:decay()
	end
	return true
end

toolGear:id(9598)
toolGear:register()
