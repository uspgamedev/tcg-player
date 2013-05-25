
require 'ui.board'
require 'ui.card'
require 'lux.common'

local cards

function love.load ()
  love.graphics.setFont(love.graphics.newFont(10))
  love.graphics.setBackgroundColor(40,40,40,255)
  cards = lux.common.datafile('cards.lua', love.filesystem.load)
  ui.board.load()
  local i = 1
  for _,cardinfo in pairs(cards) do
    ui.board.putCard(ui.Card:new{ info = cardinfo }, i, 1)
    i = i + 1
  end
  ui.board.defineZone(1,1,1,7, {80,110,150,255})
end

function love.mousereleased (x, y, button)
  ui.board.click(x, y, button)
end

function love.keyreleased (button)
  local x, y = love.mouse.getPosition()
  ui.board.keyAction(x, y, button)
end

function love.draw ()
  ui.board.draw(love.graphics)
end
