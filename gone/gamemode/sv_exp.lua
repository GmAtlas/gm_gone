
hook.Add("Think","exp",function()

for k, v in pairs(player.GetAll()) do

if v:GetPData("xp") == nil then v:SetPData("xp",0) end
if v:GetPData("npcfrags") == nil then v:SetPData("npcfrags",0) end
if v:GetNWInt("frags") == nil then v:SetNWInt("frags",v:Frags()) end
if v:GetNWInt("npcfrags") == nil then v:SetNWInt("npcfrags",v:GetPData("npcfrags")) end

v:SetNWInt("xp",v:GetPData("xp"))
v:SetPData("xp",math.Clamp(tonumber(v:GetPData("xp")),0,999999999999999999999))


if v:Frags() > v:GetNWInt("frags") then
	v:SetPData("xp",v:GetPData("xp")-200)
end


if tonumber(v:GetPData("npcfrags")) > v:GetNWInt("frags") then
	v:SetPData("xp",v:GetPData("xp")+100)
end


v:SetNWInt("npcfrags",v:GetPData("npcfrags"))
v:SetNWInt("frags",v:Frags())

end

end)


function GM:OnNPCKilled( victim, killer, weapon )
	killer:SetPData("npcfrags",killer:GetPData("npcfrags")+1)
end

function GM:PlayerSwitchFlashlight(ply, SwitchOn)
	return ply:GetNWInt("flash") > 1 or not SwitchOn
end
