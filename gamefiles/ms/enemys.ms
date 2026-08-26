enemys = object
  list = []
  
  add = function(x,y,name,lp)
    local temp = new enemy(x,y,name,lp)
    temp.parent = this
    this.list.push(temp)
  end
  del = function(element)
    this.list.removeElement(element)
  end
  
  update = function()
    for en in this.list
      en.update()
    end
  end
  draw = function()
    for en in this.list
      en.draw()
    end
    screen.setRotation(0)
    screen.setTranslation(0,0)
  end
    
  
end

enemy = class
  
  constructor = function(x,y,name,lp)
    this.x = x
    this.y = y
    this.mode = ""
    this.lp = lp
    this.speed = 0.5
  end
  
  update = function()
    
    local dx = train.x - this.x
    local dy = train.y - this.y
    local angle = atan2(dx,dy)
    
    if this.pause != 1 then  
      this.direction = angle
      this.bg = this.direction
      this.x += this.speed * sin(this.bg)
      this.y += this.speed * cos(this.bg)
    end
      
    if random.next() < 0.002 and this.pause == 0 then
      this.pause = 1
      print("pause")
      this.ptime = 120
    end
    
    if this.ptime > 0 then
      this.ptime -= 1
      print(this.ptime)
    else
      this.pause = 0
    end
    
  end
  
  draw = function()
    
    screen.setRotation(-this.direction*(180/PI))
    screen.setTranslation(this.x - cam.x,this.y - cam.y)
    screen.drawSprite( "slime"+this.mode, 0, 0, 16, 16 )
    
  end
  
  selfdel = function()
    this.parent.del(this)
  end
  
end


