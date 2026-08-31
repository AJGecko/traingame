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
    this.id = "en"
    //sector.set(this.x,this.y,this)
    //this.csec = sector.getmysec(this.x,this.y)
  end
  
  attack = function()
    if this.atcd < 1 then   
      projectiles.add(this.x,this.y,"slimeball",this.direction*(180/PI),"train")
      this.atcd = 90
    end
    if atcd > 0 then
      atcd -= 1
    end
  end
  
  update = function()
    
    local dx = train.x - this.x
    local dy = train.y - this.y
    local angle = atan2(dx,dy)
    
    local distance = sqrt((train.x - this.x)^2 + (train.y - this.y)^2)
    
    this.direction = angle
    
    if distance > screen.width/2+300 then 
      this.selfdel()
    end
    
    if distance > 60 then  
      this.bg = this.direction
      this.x += this.speed * sin(this.bg)
      this.y += this.speed * cos(this.bg)
    else  
      this.attack()
    end
    
    /*
    if this.csec != sector.getmysec(this.x,this.y) then
      print("change: "+sector.getmysec(this.x,this.y))
      sector.del(this.csec,this)
      sector.set(this.x,this.y,this)
      this.csec = sector.getmysec(this.x,this.y)
      
    end */
    
    
    // maybe for later  
    /* if random.next() < 0.002 and this.pause == 0 then
      this.pause = 1
      this.ptime = 120
    end
    
    if this.ptime > 0 then
      this.ptime -= 1
    else
      this.pause = 0
    end */
    
  end
  
  draw = function()
    
    screen.setRotation(-this.direction*(180/PI))
    screen.setTranslation(this.x - cam.x,this.y - cam.y)
    screen.drawSprite( "slime"+this.mode, 0, 0, 16, 16 )
    
  end
  
  selfdel = function()
    sector.del(csec,this)
    this.parent.del(this)
  end
  
end


