
module ('component', package.seeall)

require 'base.Component'

Layout = base.Component:new{
  children = {}
}

function Layout:addChild (child)
  self.children[child] = true
end

function Layout:removeChild (child)
  self.children[child] = nil
end

function Layout:draw (graphics)
  graphics = graphics or love.graphics
  for child,_ in pairs(self.children) do
    graphics.push()
    graphics.translate(child.pos:unpack())
    child:draw(graphics)
    graphics.setColor(255, 255, 255, 255)
    graphics.pop()
  end
end
