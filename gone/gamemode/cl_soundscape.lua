function GN_InitializeSoundScape()
	cl_spotted = false  ---This will be a boolean value.
	---Precaches the sounds
    local cache_ambient = Sound("gone/music/ambientmusic_loop.wav")
    local cache_chase = Sound("gone/music/chasemusic_loop.wav")
    ---Creates a CSoundPatch out of the precached sounds
    ss_ambientmusic = CreateSound(LocalPlayer(),cache_ambient)
    ss_chasemusic = CreateSound(LocalPlayer(),cache_chase)

    GN_BeginSoundscape()
end

function GN_SoundscapeThink()
    if cl_spotted then
        ss_ambientmusic:ChangeVolume(0,2)
        ss_chasemusic:ChangeVolume(1,2)
    else
    	ss_ambientmusic:ChangeVolume(1,2)
    	ss_chasemusic:ChangeVolume(0,2)
    end
end

function GN_BeginSoundscape()

    ss_ambientmusic:PlayEx(0,100)
    ss_chasemusic:PlayEx(0,100)
    hook.Add("Think","GoneSoundscapeThink",GN_SoundscapeThink)
end
