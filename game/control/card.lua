
module ('control.card', package.seeall)

function initialize ()
  decks = lux.common.datafile('decks.lua', love.filesystem.load)
end

function tapCard (card)
  card:tap()
end

function untapCard (card)
  card:untap()
end
