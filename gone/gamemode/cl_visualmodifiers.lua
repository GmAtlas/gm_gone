---[[Visual effects in the gamemode]]---

function GM:GetMotionBlurValues(x,y,fwd,spin)
return x*8,y*8,fwd*8,spin
end

Colorcorrection = {
["$pp_colour_addr"] = 0,
["$pp_colour_addg"] = 0,
["$pp_colour_addb"] = 0,
["$pp_colour_brightness"] = -0.2,
["$pp_colour_contrast"] = 1.5,
["$pp_colour_colour"] = 1.2,
["$pp_colour_mulr"] = 0.2,
["$pp_colour_mulg"] = -0.1,
["$pp_colour_mulb"] = 0.1
}

Bloom = {}
Bloom.dark = 0.2
Bloom.mul = 0.7
Bloom.x = 3
Bloom.y = 3
Bloom.passes = 5
Bloom.colormul = 2
Bloom.r = 0
Bloom.g = 0
Bloom.b = 0.01

function GM:RenderScreenspaceEffects()

DrawBloom(
Bloom.dark,
Bloom.mul,
Bloom.x,
Bloom.y, 
Bloom.passes,
Bloom.colormul, 
Bloom.r, 
Bloom.g, 
Bloom.b)

DrawColorModify(Colorcorrection)

end