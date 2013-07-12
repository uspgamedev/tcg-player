
require 'ui.board'
require 'control'
require 'net'
require 'client'
require 'server'
require 'data.cards'
require 'data.decks'
require 'lux.common'

local opts = {}
local displaystats = false

local function getOptions (arg)
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
end

function love.mousereleased (x, y, button)
  ui.board.click(x, y, button)
end

function love.keypressed (button)
  local x, y = love.mouse.getPosition()
  ui.board.keyAction(x, y, button)
end

function love.update (dt)
  server.update()
  client.update()
  ui.board.hover(love.mouse.getPosition())
  if love.keyboard.isDown 'tab' then
    displaystats = true
  end
end

function love.draw ()
  control.board.renderBoard(love.graphics)
  local slots = model.board.getSlots()
  if displaystats then
    ui.stats.showWreckage(
      love.graphics,
      slots[5][1]:totalSize(),
      slots[2][8]:totalSize()
    )
    displaystats = false
  end
end
