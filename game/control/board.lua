
module ('control.board', package.seeall)

require 'model.board'

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

function renderBoard (graphics)
  local slots = model.board.getSlots()
  ui.board.render(graphics, slots)
end
