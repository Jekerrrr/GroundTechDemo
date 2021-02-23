function love.load()
  love.graphics.setBackgroundColor(0, 42, 235, 1)
  groundX = 0
  groundY = 500
  groundOffset = -0
  gravity = 0
  i = 1
  ground = love.graphics.newImage("survival gameGround.png")
  UNDERground = love.graphics.newImage("crackable4.png")
  UNDERground:setFilter('nearest', 'nearest')
  ground:setFilter('nearest', 'nearest')
  verticalGroundOffset = 0
  Grounds = {}
  love.window.maximize()
  VerticalGrounds = {}
end

function love.update(dt)
  love.window.setTitle(love.timer.getFPS())
  if love.keyboard.isDown('f11') then
    love.window.setFullscreen(true)
  end
  if love.keyboard.isDown('escape') then
    love.window.setFullscreen(false)
  end
  playerScript.move()
  gravity = gravity + 0.5
  playerScript.y = playerScript.y + gravity
end

function love.draw()
  love.graphics.setColor(255, 0, 0)
  for i=1,love.graphics.getWidth() do
    table.insert(Grounds, ground)
    groundOffset = groundOffset + 64
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(Grounds[i], groundX + groundOffset, groundY, 0, 4, 4)
  end
  love.graphics.draw(ground, playerScript.x, playerScript.y, 0, 4, 4)
  if groundOffset > i * love.graphics.getWidth() then
    table.remove(Grounds, i )
    groundOffset = i * love.graphics.getWidth() - love.graphics.getWidth() - 128
  end
end
