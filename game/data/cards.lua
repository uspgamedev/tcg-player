
module ('data.cards', package.seeall)

require 'lux.common'
require 'ui.card'

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

function make (name)
  return ui.Card:new{ info = cardsinfo[name] }
end
