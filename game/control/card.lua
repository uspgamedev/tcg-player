
module ('control.card', package.seeall)

local board = require 'model.board'

function initialize ()
  decks = lux.common.datafile('decks.lua', love.filesystem.load)
end

function tapCard (params)
  board.findCard(params.cardID):tap()
end

function untapCard (params)
  board.findCard(params.cardID):untap()
end
