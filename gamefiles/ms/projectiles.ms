projectiles = object
  list = []
  
  add = function(x,y,name,dir)
    local temp = new projectile(x,y,name,dir)
    temp.parent = this
    this.list.push(temp)
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
    this.speed = 2
    this.ttl = 720
  end
  
  update = function()
    this.bg = this.direction * (PI/180) 
    this.x += this.speed * sin(this.bg)
    this.y += this.speed * cos(this.bg)
    
    
    this.ttl -= 1
    if this.ttl < 1 then
      this.selfdel()
    end
  end
  
  draw = function()
  
    screen.drawSprite( this.name, this.x - cam.x, this.y - cam.y, 12, 12 )
  end
  
  selfdel = function()
    this.parent.del(this)
  end
  
end


