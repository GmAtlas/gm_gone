hook.Add("Think","Deplete",function()

for k, v in pairs(player.GetAll()) do
if v:GetNWInt("Stamina") == nil then v:SetNWInt("Stamina",100) end
v:SetNWInt("Stamina",math.Clamp(v:GetNWInt("Stamina"),-20, 100 ))
--v:SetNWInt("Stamina",100)

if(v:GetNWInt("Stamina") <=0) then
v:SetRunSpeed(100)
v:SetWalkSpeed(100)
v:SetJumpPower(0)

end
if(v:GetNWInt("Stamina") >=49) then
v:SetRunSpeed(400)
v:SetWalkSpeed(200)
v:SetJumpPower(200)
end





if (v:KeyDown(IN_FORWARD) or v:KeyDown(IN_BACK) or v:KeyDown(IN_MOVELEFT) or v:KeyDown(IN_MOVERIGHT))and v:KeyDown(IN_SPEED) or v:KeyDown(IN_JUMP) then

v:SetNWInt("Stamina",v:GetNWInt("Stamina")- 0.156734)
else v:SetNWInt("Stamina",v:GetNWInt("Stamina")+0.05) end


if v:GetNWInt("Stamina") < 0 and ((v:KeyDown(IN_FORWARD) or v:KeyDown(IN_BACK) or v:KeyDown(IN_MOVELEFT) or v:KeyDown(IN_MOVERIGHT))and v:KeyDown(IN_SPEED) or v:KeyDown(IN_JUMP)) then 
v:SetNWInt("Stamina",-20)
end

end



end)



