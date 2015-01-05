
require 'component.Layout'
require 'component.Board'

local MainScene = component.Layout:new{}
local W, H
local board

function MainScene:load ()
  love.graphics.setBackgroundColor(100,100,100)

  W = love.graphics.getWidth()
  H = love.graphics.getHeight()

  board = component.Board:new{
    pos = lux.geom.point:new {0, H/2},
    size = lux.geom.point:new {W, H/2},
    cards = {}  
  }

  self:addChild(board)
end

function love.keypressed (button)
  if button == ' ' then
    table.insert(board.cards, "WAT")
  end
end


MainScene:new{}:attach(love)
