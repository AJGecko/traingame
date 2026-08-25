init = function()
  train = object 
    x = 0
    y = 0
    speed = 0
    rot = 0
    scale = 2
    fuel = 100
    health = 100
    maxspeed = 3
    maxfuel = 100
    magnet = 0
    
    movement = function()
      this.bg = this.rot * (PI/180) 
      
      this.x += this.speed * sin(this.bg)
      this.y += this.speed * cos(this.bg)
      
      if this.speed * sin(this.bg) != 0 or this.speed * cos(this.bg) then
        fuel -= 0.03125
      end
    end
  end
  
  cam = object
    x = 0
    y = 0
    zoom = 1
  end
  
  
  
  
  items.add(-200,40, "fueltank",25)
  
  for i=0 to 100
    items.add(random.nextInt(1000)-500,random.nextInt(1000)-500,"coin")
  end
  
end

update = function()
  // if keyboard.SPACE then train.rot += 1 end
  
  if keyboard.DOWN then 
    if train.speed > -train.maxspeed then  
      if train.speed > 0 then
        train.speed -= 0.25 
      else
        train.speed -= 0.0625
      end  
    else
      train.speed = -train.maxspeed
    end  
  end  
  
  if keyboard.UP then 
    if train.speed < train.maxspeed then  
      if train.speed < 0 then
        train.speed += 0.25
      else
        train.speed += 0.0625
      end  
    else
      train.speed = train.maxspeed
    end  
  end  
  
  if abs(train.speed) > 0.05 then
    if keyboard.LEFT then train.rot -= 1.5 end
    if keyboard.RIGHT then train.rot += 1.5 end
  end
  
  if not keyboard.UP and not keyboard.DOWN then
    if abs(train.speed) < 0.01 then
      train.speed = 0
    else
      train.speed *= 0.9
    end
  end
  
  // ts = train.speed
   
  train.movement()
  
  cam.x = train.x
  cam.y = train.y
  
  items.update()
  
  ts = train.speed
  
end

draw = function()
  screen.clear("rgb(16,147,16)")
  
  screen.setScale(cam.zoom,cam.zoom)
  
  screen.drawMap( "testmap", 0- cam.x, 0- cam.y, 800, 800 )
  
  // train
  screen.setRotation(-train.rot)
  screen.drawSprite( "train", train.x - cam.x, train.y  - cam.y, 12*train.scale, 32*train.scale )
  screen.setRotation(0)
  
  items.draw()
  
  
  
  drawgui()
end