
module ('data.cards', package.seeall)

require 'lux.common'
require 'model.card'

local cardsinfo = {}
local editions = {}

function load (cardfile)
  local cardsdata = lux.common.datafile(cardfile, love.filesystem.load)
  for _,editioninfo in pairs(cardsdata) do
    table.insert(editions, editioninfo)
    for _,cardinfo in ipairs(editioninfo) do
      cardsinfo[cardinfo.name] = cardinfo
    end
  end
end

local nextID = 1

function make (name)
  local new_card = model.Card:new {
    id = nextID,
    info = cardsinfo[name]
  }
  nextID = nextID + 1
  return new_card
end
