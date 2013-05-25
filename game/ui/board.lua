
module ('ui.board', package.seeall)

local slots     = {}
local selection

function load ()
  for i=1,8 do
    slots[i] = {}
    for j=1,8 do
      slots[i][j] = {}
    end
  end
end

function putCard (card, i, j)
  table.insert(slots[i][j], card)
end

function getCard (i, j)
  local slot = slots[i][j]
  return slot[#slot]
end

function popCard (i, j)
  return table.remove(slots[i][j])
end

function defineZone (i1, j1, i2, j2, color)
  for i=i1,i2 do
    for j=j1,j2 do
      slots[i][j].zone = {
        color = color
      }
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
      slots[i][j][#slots[i][j]]:toggleTap()
    elseif selection then
      local card = popCard(unpack(selection))
      putCard(card, i, j)
      slots[selection[1]][selection[2]].selected = false
      selection = nil
    else
      slots[i][j].selected = true
      selection = {i,j}
    end
  elseif button == 'r' then
    slots[selection[1]][selection[2]].selected = false
    selection = nil
  end
end

function draw (graphics)
  graphics.setBackgroundColor(40,40,40,255)
  graphics.clear()
  for i=1,8 do
    for j=1,8 do
      local slot = slots[i][j]
      if slot then
        graphics.push()
        graphics.translate(64+(j-1)*128, 64+(i-1)*128)
        if slot.zone then
          graphics.setColor(slot.zone.color)
          graphics.rectangle('fill', -64, -64, 128, 128)
        end
        if slot.selected then
          graphics.setColor(120,120,20,128)
          graphics.rectangle('fill', -64, -64, 128, 128)
        end
        for _,card in ipairs(slot) do
          graphics.push()
          card:draw(graphics)
          graphics.pop()
        end
        if #slot > 1 then
          graphics.printf(
            #slot,
            -48, 64-2*graphics.getFont():getHeight(),
            96,
            'right'
          )
        end
        graphics.pop()
      end
    end
  end
end
