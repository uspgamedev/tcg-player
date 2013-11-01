
module ('ui.common', package.seeall)

function infoBox (graphics, x, y, w, h, info)
  local oldfont = graphics.getFont()
  graphics.setFont(graphics.newFont(14))
  graphics.setColor(100, 100, 100, 180)
  graphics.rectangle('fill', x, y, w, h)
  graphics.setColor(10, 10, 10, 255)
  local dy  = graphics.getFont():getHeight()*1.2
  local i   = 0
  for _,item in pairs(info) do
    love.graphics.printf(item[2], x+10, y+10+i*dy, w-20, item[1])
    i = i + 1
  end
  graphics.setFont(oldfont)
end
