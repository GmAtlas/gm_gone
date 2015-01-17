
hook.Add("Think","flashdeplete",function()

for k, v in pairs(player.GetAll()) do

if v:GetNWInt("flash") == nil then v:SetNWInt("flash",100) end

v:SetNWInt("flash",math.Clamp(v:GetNWInt("flash"),-10,100))

if v:GetNWInt("flash") == -10 then v:Flashlight(false) end


if v:FlashlightIsOn() then
	v:SetNWInt("flash",v:GetNWInt("flash")-0.1)
else 
	v:SetNWInt("flash",v:GetNWInt("flash")+0.05)
end


if v:FlashlightIsOn() and v:GetNWInt("flash")<=0 then
v:SetNWInt("flash",-10) 
end


end

end)
