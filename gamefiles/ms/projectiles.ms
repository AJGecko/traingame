projectiles = object
  list = []
  
  add = function(x,y,name,dir)
    
  end
  del = function(element)
    this.list.removeElement(element)
  end
  
  update = function()
    for pr in this.list
      pr.update()
    end
  end
  draw = function()
    for pr in this.list
      pr.draw()
    end
  end
    
  
end

projectile = class
  
  constructor = function(x,y,name,dir)
    this.x = x
    this.y = y
    this.name = name
    this.direction = dir
  end
  
end