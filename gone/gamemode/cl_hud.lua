---[[Very spacebuild-ish looking hud...]]---
function GM:Think()

if !LocalPlayer():IsValid() then return end 
angb = LocalPlayer():EyeAngles()
end

drawtext = {}
function draw:PaintText(x, y, text, font, color)
    draw.DrawText(text, font, x, y, color, 1)
end
function GM:HUDPaint()



tex = surface.GetTextureID("vgui/white")
surface.CreateFont("font1",{
font = "DermaLarge",
size = 25,
})
surface.CreateFont("font2",{
font = "DermaLarge",
size = 45,
})
surface.CreateFont("font3",{
font = "DermaLarge",
size = 15,
})
anga = 0
angb = LocalPlayer():EyeAngles()
angc = {}
angc.y = 0
angc.p = 0
hitalpha = 0
hitpoints = " "
wep = ""
clip1 = 0
clip2 = 0
ammo = 0


if LocalPlayer():GetPData("xp") == nil then LocalPlayer():SetPData("xp",0) end

hp = LocalPlayer():Health()
armor = LocalPlayer():Armor()
water = 50
food = 20
stam = LocalPlayer():GetNWInt("Stamina")
if LocalPlayer():GetActiveWeapon():IsValid() then 
wep = LocalPlayer():GetActiveWeapon():GetPrintName()
clip1 = LocalPlayer():GetActiveWeapon():Clip1()
clip2 = LocalPlayer():GetActiveWeapon():Clip2()
ammo = LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType())
nades = LocalPlayer():GetAmmoCount(10)
if LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType() == -1 then
Clip = "--"
MaxAmmo = "--"
elseif LocalPlayer():GetActiveWeapon():Clip1() == -1 and ammo >= 1 then
Clip = 1
MaxAmmo = ammo - 1
elseif LocalPlayer():GetActiveWeapon():Clip1() == -1 and ammo == 0 then
Clip = 0
MaxAmmo = 0
else
Clip = clip1
MaxAmmo = ammo
end
if clip2 == -1 then Clip3 = "" else Clip3 = clip2 end
else
wep = "HANDS"
Clip = "--"
Clip3 = ""
MaxAmmo = "--"
nades = 0
end

hpv1 = {{},{},{},{}}
hpv1[1]["x"] = 110+angc.y
hpv1[1]["y"] = ScrH()-65+angc.p

hpv1[2]["x"] = 130+angc.y
hpv1[2]["y"] = ScrH()-100+angc.p

hpv1[3]["x"] = 380+angc.y
hpv1[3]["y"] = ScrH()-130+angc.p

hpv1[4]["x"] = 360+angc.y
hpv1[4]["y"] = ScrH()-95+angc.p

hpv2 = {{},{},{},{}}
hpv2[1]["x"] = 122+angc.y
hpv2[1]["y"] = ScrH()-72+angc.p

hpv2[2]["x"] = 135+angc.y
hpv2[2]["y"] = ScrH()-95+angc.p

hpv2[3]["x"] = 128+(240*hp/100)+angc.y
hpv2[3]["y"] = ScrH()-95-(28*hp/100)+angc.p

hpv2[4]["x"] = 115+(240*hp/100)+angc.y
hpv2[4]["y"] = ScrH()-72-(28*hp/100)+angc.p

apv1 = {{},{},{},{}}
apv1[1]["x"] = 199+angc.y
apv1[1]["y"] = ScrH()-130+angc.p

apv1[2]["x"] = 380+angc.y
apv1[2]["y"] = ScrH()-151+angc.p

apv1[3]["x"] = 380+angc.y
apv1[3]["y"] = ScrH()-135+angc.p

apv1[4]["x"] = 199+angc.y
apv1[4]["y"] = ScrH()-114+angc.p

apv2 = {{},{},{},{}}
apv2[1]["x"] = 201+angc.y
apv2[1]["y"] = ScrH()-128+angc.p

apv2[2]["x"] = 201+(177*armor/100)+angc.y
apv2[2]["y"] = ScrH()-128-(21*armor/100)+angc.p

apv2[3]["x"] = 201+(177*armor/100)+angc.y
apv2[3]["y"] = ScrH()-116-(21*armor/100)+angc.p

apv2[4]["x"] = 201+angc.y
apv2[4]["y"] = ScrH()-116+angc.p

spv1 = {{},{},{},{}}
spv1[1]["x"] = 149+angc.y
spv1[1]["y"] = ScrH()-70+angc.p

spv1[2]["x"] = 330+angc.y
spv1[2]["y"] = ScrH()-92+angc.p

spv1[3]["x"] = 330+angc.y
spv1[3]["y"] = ScrH()-81+angc.p

spv1[4]["x"] = 149+angc.y
spv1[4]["y"] = ScrH()-59+angc.p

spv2 = {{},{},{},{}}
spv2[1]["x"] = 151+angc.y
spv2[1]["y"] = ScrH()-68+angc.p

spv2[2]["x"] = 151+(177*stam/100)+angc.y
spv2[2]["y"] = ScrH()-68-(22*stam/100)+angc.p

spv2[3]["x"] = 151+(177*stam/100)+angc.y
spv2[3]["y"] = ScrH()-61-(22*stam/100)+angc.p

spv2[4]["x"] = 151+angc.y
spv2[4]["y"] = ScrH()-61+angc.p

w1 = {{},{},{},{}}
w1[1]["x"] = 135+angc.y
w1[1]["y"] = ScrH()-106+angc.p

w1[2]["x"] = 135+angc.y
w1[2]["y"] = ScrH()-250+angc.p

w1[3]["x"] = 165+angc.y
w1[3]["y"] = ScrH()-254+angc.p

w1[4]["x"] = 165+angc.y
w1[4]["y"] = ScrH()-109+angc.p

w2 = {{},{},{},{}}
w2[1]["x"] = 137+angc.y
w2[1]["y"] = ScrH()-108+angc.p

w2[2]["x"] = 137+angc.y
w2[2]["y"] = ScrH()-108-(140*water/100)+angc.p

w2[3]["x"] = 163+angc.y
w2[3]["y"] = ScrH()-111-(141*water/100)+angc.p

w2[4]["x"] = 163+angc.y
w2[4]["y"] = ScrH()-111+angc.p


hg1 = {{},{},{},{}}
hg1[1]["x"] = 167+angc.y
hg1[1]["y"] = ScrH()-110+angc.p

hg1[2]["x"] = 167+angc.y
hg1[2]["y"] = ScrH()-254+angc.p

hg1[3]["x"] = 197+angc.y
hg1[3]["y"] = ScrH()-257+angc.p

hg1[4]["x"] = 197+angc.y
hg1[4]["y"] = ScrH()-113+angc.p

hg2 = {{},{},{},{}}
hg2[1]["x"] = 169+angc.y
hg2[1]["y"] = ScrH()-112+angc.p

hg2[2]["x"] = 169+angc.y
hg2[2]["y"] = ScrH()-112-(140*food/100)+angc.p

hg2[3]["x"] = 195+angc.y
hg2[3]["y"] = ScrH()-115-(140*food/100)+angc.p

hg2[4]["x"] = 195+angc.y
hg2[4]["y"] = ScrH()-115+angc.p

av = {{},{},{},{}}
av[1]["x"] = angc.y+ScrW()-260
av[1]["y"] = angc.p+ScrH()-70

av[2]["x"] = angc.y+ScrW()-270
av[2]["y"] = angc.p+ScrH()-160

av[3]["x"] = angc.y+ScrW()-120
av[3]["y"] = angc.p+ScrH()-160

av[4]["x"] = angc.y+ScrW()-110
av[4]["y"] = angc.p+ScrH()-70

anga = LocalPlayer():EyeAngles() - angb
if angc.y < 60 and anga.y > 0 and anga.y < 30 then angc.y = angc.y + anga.y*2 end
if angc.y > -60 and anga.y < 0 and anga.y > -30 then angc.y = angc.y + anga.y*2 end
if angc.p < 60 and anga.p < 0 and anga.p < 30 then angc.p = angc.p - anga.p*2 end
if angc.p > -60 and anga.p > 0 and anga.p > -30 then angc.p = angc.p - anga.p*2 end

angc.y = angc.y - (angc.y/5)
angc.p = angc.p - (angc.p/5)


surface.SetTexture(tex)
surface.SetDrawColor(0,0,0,150)
surface.DrawPoly(hpv1)
surface.SetDrawColor(255,0,0,150)
surface.DrawPoly(hpv2)
surface.SetDrawColor(0,0,0,150)
surface.DrawPoly(w1)
surface.SetDrawColor(80,190,255,150)
surface.DrawPoly(w2)
surface.SetDrawColor(0,0,0,150)
surface.DrawPoly(hg1)
surface.SetDrawColor(40,155,0,150)
surface.DrawPoly(hg2)
surface.SetDrawColor(0,0,0,150)
surface.DrawPoly(apv1)
surface.SetDrawColor(0,0,255,150)
surface.DrawPoly(apv2)
surface.SetDrawColor(0,0,0,150)
surface.DrawPoly(av)
surface.DrawPoly(spv1)
surface.SetDrawColor(110,255,130,150)
surface.DrawPoly(spv2)
draw.RoundedBox(6,-50,0,100000,23,Color(0,0,0,200))
draw.RoundedBox(4,70+angc.y,80+angc.p,85,35,Color(0,0,0,200))
draw.RoundedBox(0,75+angc.y,87+angc.p,LocalPlayer():GetNWInt("flash")*75/100,20,Color(255,255,255,200))
draw.RoundedBox(6,155+angc.y,96+angc.p,6,3,Color(0,0,0,200))




-----text
draw.DrawText("Kills:"..LocalPlayer():Frags(),"font3",ScrW()-200,3,Color(255,255,255,255),TEXT_ALIGN_LEFT)
draw.DrawText("Deaths:"..LocalPlayer():Deaths(),"font3",ScrW()-100,3,Color(255,255,255,255),TEXT_ALIGN_LEFT)
draw.DrawText(Clip,"font2",angc.y+ScrW()-208,angc.p+ScrH()-130,Color(255,255,255,255),TEXT_ALIGN_RIGHT)
draw.DrawText("/"..MaxAmmo,"font2",angc.y+ScrW()-204,angc.p+ScrH()-130,Color(255,255,255,255),TEXT_ALIGN_LEFT)
draw.DrawText(wep,"font1",angc.y+ScrW()-127,angc.p+ScrH()-155,Color(255,255,255,255),TEXT_ALIGN_RIGHT)
draw.DrawText(Clip3,"font2",angc.y+ScrW()-110,angc.p+ScrH()-130,Color(255,255,255,255),TEXT_ALIGN_LEFT)
draw.DrawText("$"..LocalPlayer():GetPData("xp"),"font3",2,3,Color(255,255,255,255),TEXT_ALIGN_LEFT)
draw.DrawText(hitpoints,"font3",7,23,Color(255,255,255,hitalpha),TEXT_ALIGN_LEFT)
hitalpha = hitalpha - 10
bearing = LocalPlayer():EyeAngles().y-90
    pov = -(LocalPlayer():EyeAngles().p+25)/90
    draw:PaintText(ScrW()/2+math.Round(math.sin(math.rad(bearing))*55),60+math.Round(math.cos(math.rad(bearing))*55*pov), "N", "default", Color(0,100,200,255))
    draw:PaintText(ScrW()/2+math.Round(math.sin(math.rad(bearing+90))*50),60+math.Round(math.cos(math.rad(bearing+90))*50*pov), "E", "default", Color(0,0,0,255))
    draw:PaintText(ScrW()/2+math.Round(math.sin(math.rad(bearing+180))*55),60+math.Round(math.cos(math.rad(bearing+180))*55*pov), "S", "default", Color(0,100,200,255))
    draw:PaintText(ScrW()/2+math.Round(math.sin(math.rad(bearing-90))*50),60+math.Round(math.cos(math.rad(bearing-90))*50*pov), "W", "default", Color(0,0,0,255))

        local x = ScrW() / 2
        local y = ScrH() / 2
local trace = util.GetPlayerTrace(LocalPlayer())
local traceRes = util.TraceLine(trace)
local Pos = traceRes.HitPos
cam.Start2D()
        surface.SetDrawColor(255,255,255,hitalpha)
        surface.DrawLine(Pos:ToScreen().x-5,Pos:ToScreen().y- 5,Pos:ToScreen().x- 15,Pos:ToScreen().y- 15)
        surface.DrawLine(Pos:ToScreen().x+ 5,Pos:ToScreen().y - 5,Pos:ToScreen().x+ 15,Pos:ToScreen().y- 15)
        surface.DrawLine(Pos:ToScreen().x+ 5,Pos:ToScreen().y+ 5,Pos:ToScreen().x+ 15,Pos:ToScreen().y+ 15)
        surface.DrawLine(Pos:ToScreen().x- 5,Pos:ToScreen().y+ 5,Pos:ToScreen().x- 15,Pos:ToScreen().y+ 15)
cam.End2D()

angb = LocalPlayer():EyeAngles()
end
function GM:ScalePlayerDamage(ply,hitgroup,dmginfo)
        if dmginfo:GetAttacker():IsPlayer() and dmginfo:GetAttacker() == LocalPlayer() then
          LocalPlayer():SetPData("xp",LocalPlayer():GetPData("xp")+math.ceil(dmginfo:GetDamage()))
hitpoints = "+$"..math.ceil(dmginfo:GetDamage())
hitalpha = 255
   end
end

function GM:GetMotionBlurValues(x,y,fwd,spin)
return x*8,y*8,fwd*8,spin
end

function GM:HUDShouldDraw(name)
for k, v in pairs({"CHudHealth","CHudBattery","CHudAmmo","CHudSecondaryAmmo","CHudCrosshair"})do
if name == v then return false end
return true
end
end




