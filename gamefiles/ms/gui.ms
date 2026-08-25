drawfuel = function()
  
  screen.fillRect(-screen.width/2+60,-screen.height/2+20,train.maxfuel/1.5+2,14,"rgb(118,118,118)")
  
  local color1 = 255-(train.fuel/train.maxfuel)*255 +","+(train.fuel/train.maxfuel)*255 +",30)"
  local color2 = "rgb("
  local color3 = color2+color1
  
  if train.fuel >= 0 then
    drfuel = train.fuel
  else
    drfuel = 0
  end
  
  screen.fillRect(-screen.width/2+60+(-train.maxfuel/1.5+drfuel/1.5)/2,-screen.height/2+20,drfuel/1.5,12,color3)
  screen.drawSprite( "fueltank",-screen.width/2+14, -screen.height/2+20, 18, 18)
end

drawcoins = function()
  screen.drawTextOutline(coins,-screen.width/2+39+((coins/200)*((coins/200)<15))+(15*((coins/200)>=15)),-screen.height/2+40,20,"rgb(17,17,17)")
  screen.drawText(coins,-screen.width/2+39+((coins/200)*((coins/200)<15))+(15*((coins/200)>=15)),-screen.height/2+40,20,"#fff")
  screen.drawSprite( "coin",-screen.width/2+14, -screen.height/2+40, 18, 18 )
end

drawspeed = function()
  screen.drawTextOutline(round(train.speed*20)+"km/h",screen.width/2-36,-screen.height/2+30,20,"rgb(17,17,17)")
  screen.drawText(round(train.speed*20)+"km/h",screen.width/2-36,-screen.height/2+30,20,"#fff")
end

drawgui = function()
  screen.setScale(1,1)
  drawfuel()
  drawcoins()
  drawspeed()
end