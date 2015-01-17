--Required Client Files
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
--Custom Client Files
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("cl_visualmodifiers.lua")
AddCSLuaFile("cl_soundscape.lua")
--Player Class
AddCSLuaFile("player_class/player_res.lua")
--Required Server Files
include("shared.lua")
--Custom Server Files
include("sv_stamina.lua")
include("sv_hunger.lua")
include("sv_thirst.lua")
include("sv_flashlight.lua")
include("sv_control.lua")
include("sv_lootcontrol.lua")

DEFINE_BASECLASS( "gamemode_base" )

if SERVER then



print("===============================")
print("==      =======================")
print("=   ==   ======================")
print("=  ====  ======================")
print("=  =========   ===  = ====   ==")
print("=  ========     ==     ==  =  =")
print("=  ===   ==  =  ==  =  ==     =")
print("=  ====  ==  =  ==  =  ==  ====")
print("=   ==   ==  =  ==  =  ==  =  =")
print("==      ====   ===  =  ===   ==")
print("===============================")
print("=================================================")
print("=  =========================  ============  ==  =")
print("=  =========================  ============  ==  =")
print("=  =========================  ============  ==  =")
print("=  =========   ====   ======  ===   ======  ==  =")
print("=  ========     ==  =  ===    ==  =  ===    ==  =")
print("=  ========  =  =====  ==  =  ==     ==  =  ==  =")
print("=  ========  =  ===    ==  =  ==  =====  =  =====")
print("=  ========  =  ==  =  ==  =  ==  =  ==  =  ==  =")
print("=        ===   ====    ===    ===   ====    ==  =")
print("=================================================")



end




-- [[ INITAL PLAYER SPAWN AKA FIRST JOIN SPAWN ]] --
function GM:PlayerInitialSpawn( pl ) 
    pl:SetTeam( 3 ) 
    player_manager.SetPlayerClass( pl, "player_res" )

end


---- [[ GIVE WEAPONS AND RUN PLAYER CLASS ON SPAWN ]] -- 
function GM:PlayerSpawn( pl )

	pl:SetNWInt("Stamina",100)
	pl:SetNWInt("Hunger",100)
	pl:SetNWInt("Thirst",100)
	pl:SetNWInt("Grace",0)
	
        player_manager.OnPlayerSpawn( pl )
        player_manager.RunClass( pl, "Spawn" )
        hook.Call( "PlayerSetModel", GAMEMODE, pl )
    ---Delays the calling of the function until a little after 
    ---the player spawns
    timer.Create(pl:SteamID().."SS_LOAD",10,1,function()
    	pl:SendLua("GN_InitializeSoundScape()")
    end)
end

---------- [[SET PLAYER MODEL]] ----
function GM:PlayerSetModel( pl )

        local cl_playermodel = pl:GetInfo( "cl_playermodel" )
        local modelname = player_manager.TranslatePlayerModel( cl_playermodel )
        util.PrecacheModel( modelname )
        pl:SetModel( modelname )
        
end


