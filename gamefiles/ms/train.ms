train = object 
    x = 0
    y = 0
    speed = 0
    rot = 0
    scale = 2
    fuel = 100
    health = 100
    maxhealth = 100
    maxspeed = 3
    maxfuel = 100
    magnet = 0
    id = "train"
    
  init = function()  
    sector.set(this.x,this.y,this)
    csec = sector.getmysec(this.x,this.y)
  end
  
  movement = function()
    this.bg = this.rot * (PI/180) 
    this.x += (this.speed+(this.dash*3)) * sin(this.bg)
    this.y += (this.speed+(this.dash*3)) * cos(this.bg) 
      
    if this.speed * sin(this.bg) != 0 or this.speed * cos(this.bg) then
      this.fuel -= 0.03125
    end
      
    if this.csec != sector.getmysec(this.x,this.y) then
      
      sector.del(this.csec,this)
      sector.set(this.x,this.y,this)
      this.csec = sector.getmysec(this.x,this.y)
      print(this.csec)
      print(sector.get(this.x,this.y))
    end
  end
end
  