
module ('data.decks', package.seeall)

require 'lux.common'

local decks

function load (deckfile)
  decks = lux.common.datafile(deckfile, love.filesystem.load)
end

function get (name)
  return decks[name]
end
