plusormin = function()
  local randnum = random.nextInt(1000)-500
  if randnum >= 0 then
    return 1
  else
    return -1
  end
end

eninsec = function()
local encounter = 0
for el in sector.sectors()
for el2 in el
  for el3 in el2
    if el3.id == "en" then
      encounter += 1
    end
  end
end
end
print(encounter)
return encounter
end