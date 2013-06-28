
module ('server', package.seeall)

local board   = require 'model.board'
local control = require 'control'

local function defineBoardZones ()
  board.initialize()
  board.defineZone(1,1,1,7, {50,50,110,255})
  board.defineZone(6,2,6,8, {50,50,110,255})
  board.defineZone(2,1,3,7, {90,55,40,255})
  board.defineZone(4,2,5,8, {40,80,55,255})
  board.defineZone(4,1,5,1, {20,40,27,255})
  board.defineZone(2,8,3,8, {45,27,20,255})
  board.defineZone(1,8,1,8, {40,40,55,255}, true)
  board.defineZone(6,1,6,1, {40,40,55,255}, true)
end

function load ()
  defineBoardZones()
end

function update ()
  local request = net.receivefrom 'server'
  if request then
    control[request.controller][request.action] (request)
    net.sendto 'client' {
      action = 'updateBoard',
      slots = board.getSlots()
    }
  end
end
