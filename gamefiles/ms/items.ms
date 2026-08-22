items = object
  list = []
  
  add = function(x,y,name,op=1)
    if name == "fueltank" then
      local temp = new fueltank(x,y,name,op)
      temp.parent = this
      this.list.push(temp)
    elsif name == "coin" then
      local temp = new coin(x,y,name)
      temp.parent = this
      this.list.push(temp)
    else  
      local temp = new item(x,y,name)
      temp.parent = this
      this.list.push(temp)
    end
  end
  del = function(element)
    this.list.removeElement(element)
  end
  
  update = function()
    for it in this.list
      it.update()
    end
  end
  draw = function()
    for it in this.list
      it.draw()
    end
  end
    
end
    
item = class
  constructor = function(x,y,name)
    this.x = x
    this.y = y
    this.scale = 1
    this.name = name
    this.vis = 1
    this.aftereffect = 0
    this.wascol = 0
  end
    
  update = function()
    this.distance = sqrt((train.x - this.x)^2 + (train.y - this.y)^2)
    // global.dstest = this.distance
    
    if this.distance < 60 + train.magnet then
      if train.x < this.x then
        this.x -= 3
      end
      if train.x > this.x then
        this.x += 3
      end
      if train.y < this.y then
        this.y -= 3
      end
      if train.y > this.y then
        this.y += 3
      end
      
      if this.distance < 17 then
        if train.x < this.x then
          this.x -= 1
        end
        if train.x > this.x then
          this.x += 1
        end
        if train.y < this.y then
          this.y -= 1
        end
        if train.y > this.y then
          this.y += 1
        end
      end
        
      if this.distance < 7 then
        vis = 0
        this.collected()
        wascol = 1
      end
    end
  end
    
  draw = function()
    if this.vis == 1 then
      screen.drawSprite( this.name, this.x-cam.x, this.y-cam.y, 12*this.scale, 12*this.scale)
    end
  end
    
  collected = function()
    if this.wascol != 1 then
      selfdel()
      this.wascol = 1
    end
  end
  
  selfdel = function()
    this.parent.del(this)
  end
end
  
  
fueltank = class extends item
  constructor = function(x,y,name,content)
    this.content = content
    this.x = x
    this.y = y
    this.scale = 2
    this.name = name
    this.vis = 1
    this.aftereffect = 0
  end
    
  collected = function()
    if this.wascol != 1 then
      if train.fuel + this.content <= train.maxfuel then
        train.fuel = train.fuel + this.content
      else
        train.fuel = train.maxfuel
      end
      selfdel()
      print("trainfuel: "+train.fuel)
    end
      
  end
    
  draw = function()
    if this.vis == 1 then
      screen.drawSprite( this.name, this.x-cam.x, this.y-cam.y, 12*this.scale, 12*this.scale)
      screen.drawText(this.content,this.x-cam.x+4*this.scale,this.y-cam.y-5.5*this.scale,4*this.scale,"#fff")
    end
    if this.wascol == 1 and this.aftereffect < 30 then
      screen.drawText("+"+this.content+"F",train.x-cam.x,train.y-cam.y+this.aftereffect/5,10+this.aftereffect/15,"#fff")
      this.aftereffect += 1
    end
  end
end

coin = class extends item
  constructor = function(x,y,name)
    this.x = x
    this.y = y
    this.scale = 1
    this.name = name
    this.vis = 1
    this.aftereffect = 0
    this.wascol = 0
  end
  
  collected = function()
    if this.wascol != 1 then
      global.coins += 1
      selfdel()
      this.wascol = 1
    end
  end
  
  draw = function()
    if this.vis == 1 then
      screen.drawSprite( this.name, this.x-cam.x, this.y-cam.y, 12*this.scale, 12*this.scale)
    end
    if this.wascol == 1 and this.aftereffect < 30 then
      screen.drawText("+"+1+"C",train.x-cam.x,train.y-cam.y+this.aftereffect/5,10+this.aftereffect/15,"#fff")
      this.aftereffect += 1
    end
  end
  
  
  
end










