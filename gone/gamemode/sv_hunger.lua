hook.Add("Think","DepleteHunger",function()

for k, v in pairs(player.GetAll()) do
if v:GetNWInt("Hunger") == nil then v:SetNWInt("Hunger",100) end
v:SetNWInt("Hunger",math.Clamp(v:GetNWInt("Hunger"),0, 100 ))
--v:SetNWInt("Hunger",100)

v:SetNWInt("Hunger",v:GetNWInt("Hunger")-0.0005-((100 - v:GetNWInt("Stamina"))/5000))

if v:GetNWInt("Hunger") < 1 then
v:TakeDamage( 0.005,v,nil)
end
end



end)



