AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include("shared.lua")

function ENT:Initialize()

    self:SetTrigger(true)
    self:SetModel("models/props_junk/wood_crate001a.mdl")  
end

function ENT:StartTouch(ent)
  print("BEING TUOCHED")
end

function ENT:EndTouch(ent)
    
end

function ENT:KeyValue( key, value )

end

function ENT:Think()
local plys = ents.FindInSphere(self:GetPos(),900)

for k,v in pairs(plys) do
if v:IsPlayer() then
--Zom = ents.Create("npc_zombie")
--Zom:SetPos(VectorRand(self:GetPos())*10)

--for _,z in pairs(ents.FindByClass("npc_zombie")) do
--if _ > 5 then return end
--Zom:Spawn()
--end
end
end
end