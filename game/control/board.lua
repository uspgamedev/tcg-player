
module ('control.board', package.seeall)

require 'model.board'

-- "Session" variables
local displaystack = nil
local displaystats = false

function defineBoardZone (...)
  model.board.defineZone(...)
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
