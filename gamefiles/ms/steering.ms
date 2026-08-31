steering = function()
  if train.fuel > -1 then
    if keyboard.DOWN and not keyboard.UP then
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
    
    if keyboard.UP and not keyboard.DOWN then 
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
    if keyboard.LEFT and not keyboard.RIGHT then train.rot -= 1.5 end
    if keyboard.RIGHT and not keyboard.LEFT then train.rot += 1.5 end
  end
  
  if not keyboard.UP and not keyboard.DOWN then
    if abs(train.speed) < 0.01 then
      train.speed = 0
    else
      train.speed *= 0.9
      
    end
  end
  
  if keyboard.press.SPACE and train.dcooldown > 59 and train.fuel > -1 then
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
  
  if mouse.press then
    local dx = mouse.x
    local dy = mouse.y
    local angle = atan2(dx,dy)
    
    local dir = angle * (180/PI)
    
    projectiles.add(train.x,train.y,"bullet",dir,"en")
  end
end