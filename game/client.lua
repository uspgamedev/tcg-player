
module ('client', package.seeall)

local net         = require 'net'
local decks       = require 'data.decks'
local boardUI     = require 'ui.board'
local statsUI     = require 'ui.stats'
local boardstate  = require 'model.board'

local displaystack
local displaystats

local function hover (x, y)
  local i, j = boardUI.toBoardPosition(x, y)
  if love.mouse.isDown 'r' then
    local slot = boardstate.getSlot(i, j)
    if not slot.hidden then
      displaystack = slot
    end
  end
end

function load (graphics)
  graphics.setFont(love.graphics.newFont(10))
  graphics.setBackgroundColor(40,40,40,255)
  net.sendto 'server' {
    controller = 'board',
    action = 'newMatch',
    playerdeck = decks.get 'player1'
  }
end

function update ()
  local response
  repeat
    response = net.receivefrom 'client'
    if response and response.action == 'updateBoard' then
      boardUI.update(response.slots)
    end
  until not response
  hover(love.mouse.getPosition())
  if love.keyboard.isDown 'tab' then
    displaystats = true
  end
end

function draw (graphics)
  local slots = boardstate.getSlots()
  boardUI.render(graphics)
  if displaystats then
    statsUI.showWreckage(
      love.graphics,
      slots[5][1]:totalSize(),
      slots[2][8]:totalSize()
    )
    displaystats = false
  elseif displaystack then
    statsUI.showStack(graphics, displaystack)
    displaystack = nil
  end
end
