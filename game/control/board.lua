
module ('control.board', package.seeall)

require 'model.board'
require 'lux.common'

-- "Session" variables
local displaystack = nil

function initialize ()
end

function newMatch (params)
  model.board.preparePlayerDeck(params.playerdeck)
end

function moveSelectedCards (params)
  model.board.moveSelectedCards(params.selection, unpack(params.targetpos))
end

function drawCard ()
  model.board.drawCard()
end

function drawHand ()
  for i=1,7 do
    model.board.drawCard()
  end
end

function destroySelectedCards (params)
  model.board.moveSelectedCards(params.selection, 5, 1)
end

function consumeSelectedCards (params)
  model.board.moveSelectedCards(params.selection, 6, 1, 1)
end

function updateClientBoard ()
  ui.board.update(model.board.getSlots())
end
