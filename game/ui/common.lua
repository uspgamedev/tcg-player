
module ('ui.common', package.seeall)

function infoBox (graphics, x, y, w, h, info)
  graphics.setColor(100, 100, 100, 180)
  graphics.rectangle('fill', x, y, w, h)
  graphics.setColor(200, 200, 50, 150)
  for tag,content in pairs(info) do
    --love.graphics.printf()
  end
end
