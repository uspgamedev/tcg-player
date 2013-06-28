
require 'ui.board'
require 'control'
require 'net'
require 'client'
require 'server'
require 'data.cards'
require 'data.decks'
require 'lux.common'

local function getOptions (arg)
  local opts = {}
  for i,opt in ipairs(arg) do
    if i > 1 then
      -- FIXME
      local optname = string.gsub(opt, '%-%-', '')
      opts[optname] = true
      print(optname)
    end
  end
  return opts
end

function love.load (arg)
  local opts = getOptions(arg)
  data.cards.load 'cards.lua'
  data.decks.load 'decks.lua'
  server.load()
  client.load(love.graphics)
  control.board.preparePlayerDeck(data.decks.get 'player1')
  control.board.updateClientBoard()
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
