-- data/npc/allianceserver_donate.lua
-- NPC de informações de donate

local internalNpcName = "Alliance Server Donate"
local npcType = Game.createNpcType(internalNpcName)

local npcConfig = {}
npcConfig.name = internalNpcName
npcConfig.description = "Donation helper"

npcConfig.health = 100
npcConfig.maxHealth = 100
npcConfig.walkInterval = 1500
npcConfig.walkRadius = 2
npcConfig.flags = { floorchange = false }

-- Outfit full addon dourado. mount=546 (Cerberus) pode ser ignorado em NPCs.
npcConfig.outfit = {
  lookType = 1210,  -- golden outfit
  head = 114, body = 88, legs = 114, feet = 0,
  addons = 3,
  mount = 546
}

-- =====================================================================
-- Sistema de palavras-chave e mensagens
-- =====================================================================
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval) npcHandler:onThink(npc, interval) end
npcType.onAppear = function(npc, creature) npcHandler:onAppear(npc, creature) end
npcType.onDisappear = function(npc, creature) npcHandler:onDisappear(npc, creature) end
npcType.onMove = function(npc, creature, fromPos, toPos) npcHandler:onMove(npc, creature, fromPos, toPos) end
npcType.onSay = function(npc, creature, type, message) npcHandler:onSay(npc, creature, type, message) end
npcType.onCloseChannel = function(npc, creature) npcHandler:onCloseChannel(npc, creature) end

-- Mensagem do site
local donateMsg = "👋 Bem-vindo ao Alliance Server! Para doar e comprar Tibia Coins ou itens VIP, acesse: https://allianceservershop.sumupstore.com"

-- ✅ Quando o jogador diz 'hi', já aparece a mensagem do site
npcHandler:setMessage(MESSAGE_GREET, donateMsg)
npcHandler:setMessage(MESSAGE_FAREWELL, "Até mais, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Até mais, |PLAYERNAME|!")

-- ✅ Palavras adicionais que também mostram o link
local function creatureSayCallback(npc, creature, type, msg)
  if not npcHandler:checkInteraction(npc, creature) then
    return false
  end

  msg = msg:lower()
  if msg:find("donate") or msg:find("vip") or msg:find("coins") or msg:find("site") or msg:find("ajuda") then
    npcHandler:say(donateMsg, npc, creature)
    return true
  end

  return false
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
