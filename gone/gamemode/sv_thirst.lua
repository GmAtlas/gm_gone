hook.Add("Think","DepleteThirst",function()

for k, v in pairs(player.GetAll()) do
if v:GetNWInt("Thirst") == nil then v:SetNWInt("Thirst",100) end
v:SetNWInt("Thirst",math.Clamp(v:GetNWInt("Thirst"),0, 100 ))
--v:SetNWInt("Thirst",100)

v:SetNWInt("Thirst",v:GetNWInt("Thirst")-0.001-((100 - v:GetNWInt("Stamina"))/5000))
if v:GetNWInt("Thirst") < 1 then
v:TakeDamage( 0.005,v,nil)
end
end



end)



