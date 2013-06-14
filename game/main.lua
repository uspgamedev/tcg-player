
require 'ui.board'
require 'data.cards'
require 'lux.common'

local function getOptions (arg)
  local opts = {}
  for i,opt in ipairs(arg) do
    if i > 1 then
      local optname = string.gsub(opt, '%-%-', '')
      opts[optname] = true
      print(optname)
    end
  end
  return opts
end

function love.load (arg)
  local opts = getOptions(arg)
  love.graphics.setFont(love.graphics.newFont(10))
  love.graphics.setBackgroundColor(40,40,40,255)
  data.cards.load 'cards.lua'
  local decks = lux.common.datafile('decks.lua', love.filesystem.load)
  model.board.load()
  control.board.updateClientBoard()
  control.board.defineBoardZones()
  model.board.preparePlayerDeck(decks.player1)
end

function love.mousereleased (x, y, button)
  ui.board.click(x, y, button)
end

function love.keypressed (button)
  local x, y = love.mouse.getPosition()
  ui.board.keyAction(x, y, button)
end

function love.update (dt)
  control.board.updateClientBoard()
  ui.board.hover(love.mouse.getPosition())
  if love.keyboard.isDown 'tab' then
    control.board.displayStats()
  end
end

function love.draw ()
  control.board.renderBoard(love.graphics)
end
