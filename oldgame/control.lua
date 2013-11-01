
module ('control', package.seeall)

local all_controllers = love.filesystem.enumerate 'control/'
for _, controller_file in ipairs(all_controllers) do
  local modulename = string.gsub(controller_file, '.lua', '')
  require('control.'..modulename)
  control[modulename].initialize()
end

function love.handlers.control (controller, method, params)
  control[controller][method](params)
end

