
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
  ui.board.defineZone(1,1,1,7, {50,50,110,255})
  ui.board.defineZone(6,2,6,8, {50,50,110,255})
  ui.board.defineZone(2,1,3,7, {90,55,40,255})
  ui.board.defineZone(4,2,5,8, {40,80,55,255})
  ui.board.defineZone(4,1,5,1, {20,40,27,255})
  ui.board.defineZone(2,8,3,8, {45,27,20,255})
  ui.board.defineZone(1,8,1,8, {40,40,55,255}, true)
  ui.board.defineZone(6,1,6,1, {40,40,55,255}, true)
end

function love.mousereleased (x, y, button)
  ui.board.click(x, y, button)
end

function love.keyreleased (button)
  local x, y = love.mouse.getPosition()
  ui.board.keyAction(x, y, button)
end

function love.update (dt)
  ui.board.hover(love.mouse.getPosition())
end

function love.draw ()
  ui.board.draw(love.graphics)
end
