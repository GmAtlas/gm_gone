---[[Functions to make it easier for the server control of clientside vars]]---
local Ply = {}

--[[Player functions]]--

--Begins chase music for the player
function Ply:beginChaseMusic()
	self:SendLua("cl_spotted = true")
end

--Ends chase music for the player
function Ply:endChaseMusic()
	self:SendLua("cl_spotted = false")
end