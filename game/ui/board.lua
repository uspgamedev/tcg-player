
module ('ui.board', package.seeall)

require 'control.board'
require 'model.board'
require 'ui.slot'
require 'ui.card'
require 'ui.stats'
require 'ui.common'
require 'data.cards'

local slots     = {}
local selection = {}
local hoverpos  = {1,1}

local function toBoardPosition (x, y)
  return math.floor((y)/128)+1, math.floor((x)/128)+1
end

function click (x, y, button)
  if button == 'l' then
    local i, j = toBoardPosition(x,y)
    local new_selection = love.keyboard.isDown 'lshift' and selection or {}
    ui.slot.click(new_selection, {i,j}, slots[i][j]:topCard())
    selection = new_selection
  end
end

function hover (x, y)
  local i, j = toBoardPosition(x, y)
  hoverpos = {i,j}
  if love.mouse.isDown 'r' then
    control.board.displayStack(hoverpos)
  end
end

function keyAction (x, y, key)
  local i, j = toBoardPosition(x, y, selection)
  if key == 'escape' then
    selection = {}
  elseif key == ' ' then -- move card
    control.board.moveSelectedCards(selection, i, j)
    selection = {}
  elseif key == 'd' then -- draw card(s)
    if love.keyboard.isDown'lshift' then
      control.board.drawHand()
    else
      control.board.drawCard()
    end
  elseif key == 'x' then
    control.board.destroySelectedCards(selection)
    selection = {}
  elseif key == 'c' then
    control.board.consumeSelectedCards(selection)
    selection = {}
  else
    for element,_ in pairs(selection) do
      ui.card.keyAction(key, element)
    end
  end
end

function update (new_slots)
  slots = new_slots
end

function render (graphics)
  for i,row in ipairs(slots) do
    for j, slot in ipairs(row) do
      if slot then
        graphics.push()
        graphics.translate(64+(j-1)*128, 64+(i-1)*128)
        graphics.setColor(slot:getColor())
        graphics.rectangle('fill', -64, -64, 128, 128)
        ui.slot.render(
          graphics,
          selection,
          slot,
          hoverpos[1] == i and hoverpos[2] == j
        )
        graphics.pop()
      end
    end
  end
end
