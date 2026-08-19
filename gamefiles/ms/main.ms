init = function()
  train = object 
    x = 0
    y = 0
    speed = 0
    rot = 0
    scale = 2
    fuel = 100
    health = 100
  end
  
  cam = object
    x = 0
    y = 0
    zoom = 1
  end
  
  fueltanks = class
    constructor = function(x,y)
      this.x = x
      this.y = y
      this.content = 100
      this.scale = 2
    end
    
    update = function()
    
    end
    
    draw = function()
      screen.drawSprite( "fueltank", this.x-cam.x, this.y-cam.y, 12*this.scale, 12*this.scale)
    end
  end
  
  ft1 = new fueltanks(-20,40)
  
end

update = function()
   // if keyboard.SPACE then train.rot += 1 end
  
  if keyboard.DOWN then train.y -= 2 end
  if keyboard.UP then train.y += 2 end
  if keyboard.LEFT then train.x -= 2 end
  if keyboard.RIGHT then train.x += 2 end
  
  cam.x = train.x
  cam.y = train.y
  
end

draw = function()
  screen.clear("rgb(16,147,16)")
  
  screen.setScale(cam.zoom,cam.zoom)
  
  screen.drawMap( "testmap", 0- cam.x, 0- cam.y, 800, 800 )
  
  // train
  screen.setRotation(-train.rot)
  screen.drawSprite( "train", train.x - cam.x, train.y  - cam.y, 12*train.scale, 32*train.scale )
  screen.setRotation(0)
  
  ft1.draw()
  
  
end