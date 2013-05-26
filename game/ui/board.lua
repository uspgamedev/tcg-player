
module ('ui.board', package.seeall)

require 'ui.slot'

local slots     = {}
local selection = {}

function load ()
  for i=1,8 do
    slots[i] = {}
    for j=1,8 do
      slots[i][j] = ui.Slot:new{}
    end
  end
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

function defineZone (i1, j1, i2, j2, color)
  for i=i1,i2 do
    for j=j1,j2 do
      slots[i][j]:setColor(color)
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
    slots[i][j]:click(x, y, new_selection, {i,j})
    selection = new_selection
  end
end

function keyAction (x, y, key)
  local i, j = toBoardPosition(x,y)
  if key == 'escape' then
    selection = {}
  elseif key == ' ' then
    for element,info in pairs(selection) do
      slots[i][j]:pushCard(slots[info[1]][info[2]]:removeCard(element))
      selection[element] = {i,j}
    end
    selection = {}
  else
    for element,_ in pairs(selection) do
      element:keyAction(i, j, key)
    end
  end
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
end
