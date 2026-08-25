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
      
      this.x += (this.speed+(this.dash*3)) * sin(this.bg)
      this.y += (this.speed+(this.dash*3)) * cos(this.bg) 
      
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
  
  if train.fuel > -1 then
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
  else  
    keyboard.DOWN = 0
    keyboard.UP = 0
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
  
  if keyboard.press.SPACE and train.dcooldown > 59 then
    train.dash = 1
    train.dtime = 20
    train.dcooldown = 59
  end
  
  
  if train.dash == 1 then
    train.dtime -= 1
    if train.dtime < 1 then
      train.dash = 0
    end
  end
  
  if train.dcooldown < 60 then
    train.dcooldown -= 1
    if train.dcooldown < 0 then
      train.dcooldown = 60
    end
  end
  
  
  // ts = train.speed
   
  train.movement()
  
  cam.x = train.x
  cam.y = train.y
  
  items.update()
  
  ts = train.speed
  
  map.update()
end

draw = function()
  screen.clear("rgb(16,147,16)")
  
  screen.setScale(cam.zoom,cam.zoom)
  
  map.draw()
  
  // train
  screen.setRotation(-train.rot)
  screen.drawSprite( "train", train.x - cam.x, train.y  - cam.y, 12*train.scale, 32*train.scale )
  screen.setRotation(0)
  
  items.draw()
  
  
  
  drawgui()
end