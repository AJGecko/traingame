projectiles = object
  list = []
  
  add = function(x,y,name,dir,target)
    local temp = new projectile(x,y,name,dir,target)
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
  
  constructor = function(x,y,name,dir,target)
    this.x = x
    this.y = y
    this.name = name
    this.direction = dir
    this.speed = 4
    this.ttl = 720
    this.id = "pr"
    this.target = target
  end
  
  update = function()
    this.bg = this.direction * (PI/180) 
    this.x += this.speed * sin(this.bg)
    this.y += this.speed * cos(this.bg)
    
    this.mysec = sector.getmysec(this.x,this.y)
    
    local csec = sector.get(this.mysec)
    
    for en in csec
      if en.id == this.target then
        
        local distance = sqrt((en.x - this.x)^2 + (en.y - this.y)^2)
        if distance < 9 then
          if this.target != "train" then
            en.selfdel()
          elsif this.target == "train" then
            train.health -= 10
          end
          this.selfdel()
        end
      end
    end
    
    this.ttl -= 1
    if this.ttl < 1 then
      this.selfdel()
    end
  end
  
  draw = function()
    if this.target == "train" then
      screen.drawSprite( this.name, this.x - cam.x, this.y - cam.y, 6, 6 )
    else
      screen.drawSprite( this.name, this.x - cam.x, this.y - cam.y, 12, 12 )
    end
  end
  
  selfdel = function()
    this.parent.del(this)
  end
  
end


