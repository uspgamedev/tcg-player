
module ('component', package.seeall)

require 'base.Component'

Zone = base.Component:new {
  cards = {}
}

function Zone:addCard (card, i)
  table.insert(self.cards, i)
end

function Zone:removeCard (i)
  return table.insert(self.cards, i)
end
