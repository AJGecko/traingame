init = function()
  
  train.init()
  
  map.init()
  
  cam = object
    x = 0
    y = 0
    zoom = 1
  end
  
  menu = 2
  
end

update = function()
  
  if menu == 1 then
    steering()
    train.movement()
    cam.x = train.x
    cam.y = train.y
    items.update()
    enemys.update()
    projectiles.update()
    map.update()
    train.maxspeed = 3 + coins/400
    if kills >= goal and kills != 0 then
      menu = 3
      mouse.press = 0
    end
    if train.health < 1 then
      menu = 4
      reason = "Your train was destroyed"
      mouse.press = 0
    end
    if train.fuel < 0 then
      menu = 4
      reason = "Out of fuel"
      mouse.press = 0
    end
  end
  
  if menu == 2 then
    if mouse.press and mouse.left then
      menu = 1
      mouse.press = 0
      goal = random.nextInt(800)+50
      kills = 0
      train.fuel = 100
      train.health = 100
      enemys.list = []
      items.list = []
      train.speed = 0
    end
  end
  
  
  if menu == 3 then
    if mouse.press and mouse.left then
      menu = 2
      mouse.press = 0
    end
  end
  
  
  if menu == 4 then
    if mouse.press and mouse.left then
      menu = 2
      mouse.press = 0
    end
  end
  
end

draw = function()
  screen.clear("rgb(16,147,16)")
  screen.setScale(cam.zoom,cam.zoom)
  
  if menu == 1 then
    map.draw()
    
    enemys.draw()
    
    projectiles.draw()
    
    train.draw()
    
    items.draw()
    
    drawgui()
    
    screen.drawText(kills+"/"+goal,0,75,20,"#fff")
    screen.drawText("FPS: "+ system.fps,0,60,20,"#fff")
  end
  
  if menu == 2 then
    map.draw()
    train.draw()
    screen.drawText("Slime Hunter Express",0,60,26,"#fff")
    screen.setTranslation(110,50)
    screen.setRotation(30)
    screen.drawText("Demo",0,0,18,"rgb(0,85,255)")
    screen.setRotation(0)
    screen.setTranslation(0,0)
    screen.drawText("Click to start",0,-60,20,"#fff")
  end
  
  if menu == 3 then
    map.draw()
    screen.drawText("You did it! :)",0,0,26,"#fff")
    screen.drawText("Click to continue",0,-20,20,"#fff")
  end
  
  if menu == 4 then
    map.draw()
    screen.drawText("Game Over",0,20,26,"#fff")
    screen.drawText("Click to continue",0,0,20,"#fff")
    screen.drawText(reason,0,-20,20,"#fff")
  end
  
end