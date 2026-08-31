map = object
  map = []
  
  init = function()
    this.enemychance = 0
  end
  
  update = function()
    rdnum = random.next()  
    if rdnum < 0.4 + this.enemychance/1000 and enemys.list.length < 150 then
      local rx = (train.x+random.nextInt(300))*plusormin()
      local ry = (screen.height+train.y+random.nextInt(100))*plusormin()
      enemys.add(rx,ry,"slime",100)
      
    end
    
    if rdnum > 0.008 and items.list.length < 100 then
      local rx = (train.x+random.nextInt(300))*plusormin()
      local ry = (screen.height+train.y+random.nextInt(100))*plusormin()
      items.add(rx,ry,"coin")
      
    end
    
    if random.nextInt(1000) < 5 then
      local rx = (train.x+random.nextInt(300))*plusormin()
      local ry = (screen.height+train.y+random.nextInt(100))*plusormin()
      items.add(rx,ry,"fueltank",25)
      
    end
    
    
    this.px = round(round(train.x)/400)
    this.py = round(round(train.y)/400)
  end
  draw = function()
    screen.drawMap( "testmap", this.px*400-cam.x, this.py*400-cam.y, 200*2, 200*2 )
    screen.drawMap( "testmap", (this.px+1)*400-cam.x, this.py*400-cam.y, 200*2, 200*2 )  
    screen.drawMap( "testmap", (this.px-1)*400-cam.x, this.py*400-cam.y, 200*2, 200*2 )
    
    screen.drawMap( "testmap", this.px*400-cam.x, (this.py-1)*400-cam.y, 200*2, 200*2 )
    screen.drawMap( "testmap", (this.px+1)*400-cam.x, (this.py-1)*400-cam.y, 200*2, 200*2 )  
    screen.drawMap( "testmap", (this.px-1)*400-cam.x, (this.py-1)*400-cam.y, 200*2, 200*2 ) 
    
    screen.drawMap( "testmap", this.px*400-cam.x, (this.py+1)*400-cam.y, 200*2, 200*2 )
    screen.drawMap( "testmap", (this.px+1)*400-cam.x, (this.py+1)*400-cam.y, 200*2, 200*2 )  
    screen.drawMap( "testmap", (this.px-1)*400-cam.x, (this.py+1)*400-cam.y, 200*2, 200*2 ) 
  end  
  
end

sector = object
  sectors = [[[]]]
  
  checksec = function(sec_x,sec_y)
    if this.sectors[sec_x] == 0 then
      this.sectors[sec_x] = []
    end
    if this.sectors[sec_x][sec_y] == 0 then
      this.sectors[sec_x][sec_y] = []
    end
  end
  
  set = function(cx,cy,obj)
    local sec_x = floor(abs(cx/100))
    local sec_y = floor(abs(cy/100))
    
    this.checksec(sec_x,sec_y)
    
    if this.sectors[sec_x][sec_y].contains(obj) == 0 then
      this.sectors[sec_x][sec_y].push(obj)
    end
  
  end
  
  getmysec = function(cx,cy)
    local sec_x = floor(abs(cx/100))
    local sec_y = floor(abs(cy/100))
    return [sec_x,sec_y]
  end
  
  get = function(sec)
    this.checksec(sec[0],sec[1])
    return this.sectors[sec[0]][sec[1]] 
  end
  
  del = function(sec,el)
    this.checksec(sec[0],sec[1])
    if this.sectors[sec[0]][sec[1]].contains(el) == 1 then
      this.sectors[sec[0]][sec[1]].removeElement(el)
    end
  end
  
end

