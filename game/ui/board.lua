
module ('ui.board', package.seeall)

require 'ui.slot'

local slots     = {}
local selection

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

function mousePressed (x, y, button)
  if button == 'l' then
    if x < 16 or x > 1024-16 or y < 8 or y > 768-8 then
      return
    end
    i = math.floor((y)/128)+1
    j = math.floor((x)/128)+1
    if love.keyboard.isDown 'lctrl' then
      getCard(i,j):toggleTap()
    elseif selection then
      local card = popCard(unpack(selection))
      putCard(card, i, j)
      selection = nil
    else
      selection = {i,j}
    end
  elseif button == 'r' then
    selection = nil
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
        if selection and i == selection[1] and j == selection[2] then
          graphics.setColor(120,120,20,128)
          graphics.rectangle('fill', -64, -64, 128, 128)
        end
        slot:draw(graphics)
        graphics.pop()
      end
    end
  end
end