AddCSLuaFile( "cl_init.lua" ) 
AddCSLuaFile( "shared.lua" )  
 
include("shared.lua")

Models = {}
Models[1] = "models/props_junk/watermelon01.mdl"
Models[2] = "models/props_junk/garbage_metalcan001a.mdl"
Models[3] = "models/props_junk/garbage_takeoutcarton001a.mdl"

function ENT:Initialize()
 	
	self:SetModel( table.Random(Models) ) -- CHANGE THIS
	self:PhysicsInit( SOLID_VPHYSICS )      
	self:SetMoveType( MOVETYPE_VPHYSICS )   
	self:SetSolid( SOLID_VPHYSICS )         
 	
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end
 

 


function ENT:Use(act,ply)

ply:SetNWInt("Hunger",ply:GetNWInt("Hunger") + 20 )
self:SafeRemoveEntity()

end


