map = object
  map = []
  
  update = function()
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

