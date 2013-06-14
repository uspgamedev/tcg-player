
module ('control.board', package.seeall)

require 'model.board'

-- "Session" variables
local displaystack = nil
local displaystats = false

function defineBoardZones ()
  model.board.defineZone(1,1,1,7, {50,50,110,255})
  model.board.defineZone(6,2,6,8, {50,50,110,255})
  model.board.defineZone(2,1,3,7, {90,55,40,255})
  model.board.defineZone(4,2,5,8, {40,80,55,255})
  model.board.defineZone(4,1,5,1, {20,40,27,255})
  model.board.defineZone(2,8,3,8, {45,27,20,255})
  model.board.defineZone(1,8,1,8, {40,40,55,255}, true)
  model.board.defineZone(6,1,6,1, {40,40,55,255}, true)
end

function moveSelectedCards (selection, i, j)
  model.board.moveSelectedCards(selection, i, j)
end

function drawCard ()
  model.board.drawCard()
end

function drawHand ()
  for i=1,7 do
    model.board.drawCard()
  end
end

function destroySelectedCards (selection)
  model.board.moveSelectedCards(selection, 5, 1)
end

function consumeSelectedCards (selection)
  model.board.moveSelectedCards(selection, 6, 1, 1)
end

function updateClientBoard ()
  ui.board.update(model.board.getSlots())
end

function displayStats ()
  displaystats = true
end

function displayStack (pos)
  local slot = model.board.getSlot(unpack(pos))
  if not slot.hidden then
    displaystack = slot
  end
end

function renderBoard (graphics)
  local slots = model.board.getSlots()
  ui.board.render(graphics)
  if displaystats then
    ui.stats.showWreckage(
      graphics,
      slots[5][1]:totalSize(),
      slots[2][8]:totalSize()
    )
    displaystats = false
  elseif displaystack then
    ui.stats.showStack(graphics, displaystack)
    displaystack = nil
  end
end
