
module ('client', package.seeall)

local net         = require 'net'
local data_decks  = require 'data.decks'
local board       = require 'ui.board'

function load (graphics)
  graphics.setFont(love.graphics.newFont(10))
  graphics.setBackgroundColor(40,40,40,255)
  net.sendto 'server' {
    controller = 'board',
    action = 'newMatch',
    playerdeck = data_decks.get 'player1'
  }
end

function update ()
  local response = net.receivefrom 'server'
  if response then
    board.update(response.slots)
  end
end

function draw (graphics)

end
