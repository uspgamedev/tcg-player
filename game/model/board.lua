
module ('model.board', package.seeall)

require 'model.slot'
require 'data.cards'

local slots     = {}
local cardrefs  = {}

local function shuffleDeck (cards, i, j)
  local slot = slots[i][j]
  local cardpool = {}
  for _,entry in ipairs(cards) do
    for i=1,entry[1] do
      table.insert(cardpool, entry[2])
    end
  end
  for i=1,#cardpool do
    local card =
      data.cards.make(table.remove(cardpool, math.random(1,#cardpool)))
    slot:pushCard(card)
    cardrefs[card:getID()] = card
  end
end

function initialize ()
  for i=1,8 do
    slots[i] = {}
    for j=1,8 do
      slots[i][j] = model.Slot:new{}
    end
  end
end

function findCard (id)
  return cardrefs[id]
end

function defineZone (i1, j1, i2, j2, color, hidden)
  for i=i1,i2 do
    for j=j1,j2 do
      slots[i][j]:setColor(color)
      slots[i][j]:setHidden(hidden)
    end
  end
end

function preparePlayerDeck (deck)
  putCard(data.cards.make(deck.vessel), 4, 1)
  shuffleDeck(deck.cards, 6, 1)
end

function getSlot (i, j)
  return slots[i][j]
end

function getSlots ()
  return slots
end

function putCard (card, i, j)
  return slots[i][j]:pushCard(card)
end

function getCard (i, j)
  return slots[i][j]:topCard()
end

function popCard (i, j)
  return slots[i][j]:popCard()
end

function drawCard ()
  local deckslot  = slots[6][1]
  local drawncard = deckslot:popCard()
  if drawncard then
    for i=1,7 do
      local handslot = slots[6][1+i]
      if not handslot:topCard() then
        handslot:pushCard(drawncard)
        return
      end
    end
    deckslot:pushCard(drawncard)
  end
end

function moveSelectedCards (selection, i, j, pos)
  for element,info in pairs(selection) do
    if not pos then
      slots[i][j]:pushCard(slots[info[1]][info[2]]:removeCard(element))
    else
      slots[i][j]:insertCard(slots[info[1]][info[2]]:removeCard(element), pos)
    end
  end
end
