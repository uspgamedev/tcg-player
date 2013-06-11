
module ('ui.board', package.seeall)

require 'control.board'
require 'model.board'
require 'ui.slot'
require 'ui.card'
require 'ui.common'
require 'data.cards'

local slots     = {}
local selection = {}
local show      = nil
local stats     = false

function load ()
  for i=1,8 do
    slots[i] = {}
    for j=1,8 do
      slots[i][j] = ui.Slot:new{
        reference = model.board.getSlot(i,j)
      }
    end
  end
end

function defineZone (i1, j1, i2, j2, color, hidden)
  for i=i1,i2 do
    for j=j1,j2 do
      slots[i][j]:setColor(color)
      slots[i][j]:setHidden(hidden)
    end
  end
end

local function toBoardPosition (x, y)
  return math.floor((y)/128)+1, math.floor((x)/128)+1
end

function click (x, y, button)
  if button == 'l' then
    local i, j = toBoardPosition(x,y)
    local new_selection = love.keyboard.isDown 'lshift' and selection or {}
    slots[i][j]:click(new_selection, {i,j})
    selection = new_selection
  end
end

function hover (x, y)
  local i, j = toBoardPosition(x, y)
  local slot = slots[i][j]
  slot:hover()
  if love.mouse.isDown 'r' and not slot.hidden then
    show = slot
  end
end

function keyAction (x, y, key)
  local i, j = toBoardPosition(x, y, selection)
  if key == 'escape' then
    selection = {}
  elseif key == ' ' then -- move card
    control.board.moveSelectedCards(selection, i, j)
    selection = {}
  elseif  key == 'd' then -- draw card(s)
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
      ui.Card.keyAction(key, element)
    end
  end
end

function showStats ()
  stats = true
end

function draw (graphics)
  for i=1,8 do
    for j=1,8 do
      local slot = slots[i][j]
      if slot then
        graphics.push()
        graphics.translate(64+(j-1)*128, 64+(i-1)*128)
        graphics.setColor(slot:getColor())
        graphics.rectangle('fill', -64, -64, 128, 128)
        slot:draw(graphics, selection)
        graphics.pop()
      end
    end
  end
  if stats then
    ui.common.infoBox(graphics, 512-96, 384-48, 96*2, 96, {
      {'center', "Player 1's Wreckage:"},
      {'center', model.board.getSlot(5, 1):totalSize().."/20"},
      {'center', "Player 2's Wreckage:"},
      {'center', model.board.getSlot(2, 8):totalSize().."/20"}
    })
    stats = false
  elseif show then
    local w = 96
    local n = show.reference:getQuantity()
    local x0 = 512+n*(w)
    for i,card in show.reference:cards() do
      ui.common.infoBox(
        graphics,
        x0-2*w-(i-1)*2*(w+1)-1, 384-128,
        w*2, 256,
        card:getInfo()
      )
    end
    show = nil
  end
end
