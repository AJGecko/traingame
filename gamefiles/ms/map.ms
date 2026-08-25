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

/*map = object
  map = []
  
  update = function()
    this.px = round(round(train.x)/400)
    this.py = round(round(train.y)/400)
  end
  draw = function()
    screen.drawMap( "testmap", this.px*400-cam.x, this.py*400-cam.y, 200*2, 200*2 
    screen.drawMap( "testmap", (this.px+1)*400-cam.x, this.py*400-cam.y, 200*2, 200*2 )  
    screen.drawMap( "testmap", (this.px-1)*400-cam.x, this.py*400-cam.y, 200*2, 200*2 ) 
  end  
  
end