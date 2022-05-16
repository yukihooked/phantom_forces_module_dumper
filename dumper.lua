local garbage_collection = getgc(true)

local pf_framework = {}

for _,current_value in pairs(garbage_collection) do
    if typeof(current_value) == "function" then
        local name = getinfo(current_value).name
        if(name == "bulletcheck") then
            pf_framework.bulletcheck = current_value
        elseif(name == "trajectory") then
            pf_framework.trajectory = current_value
        elseif(name == "call") then
            pf_framework.call = current_value
        elseif(name == "loadplayer") then
            pf_framework.loadplayer = current_value
        elseif(name == "rankcalculator") then
            pf_framework.rankcalculator = current_value
        elseif(name == "gunbob") then
            pf_framework.gunbob = current_value
        elseif(name == "gunsway") then
            pf_framework.gunsway = current_value
        elseif(name == "getupdater") then
            pf_framework.getupdater = current_value
        elseif(name == "updateplayernames") then
            pf_framework.updateplayernames = current_value
        end
    elseif typeof(current_value) == "table" then
        if(rawget(current_value, "deploy")) then
            pf_framework.menu = current_value
        elseif(rawget(current_value, "send")) then
            pf_framework.net = current_value
        elseif(rawget(current_value, "gammo")) then
            pf_framework.logic = current_value
        elseif(rawget(current_value, "setbasewalkspeed")) then
            pf_framework.char = current_value
        elseif(rawget(current_value, "basecframe")) then
            pf_framework.cam = current_value
        elseif(rawget(current_value, "current_valueotestep")) then
            pf_framework.hud = current_value
        elseif(rawget(current_value, "getbodyparts")) then
            pf_framework.replication = current_value
        elseif(rawget(current_value, "play")) then
            pf_framework.sound = current_value
        elseif(rawget(current_value, "checkkillzone")) then
            pf_framework.roundsystem = current_value
        elseif(rawget(current_value, "new") and rawget(current_value, "step") and rawget(current_value, "reset")) then
            pf_framework.particle = current_value
        elseif(rawget(current_value, "unlocks")) then
            pf_framework.dirtyplayerdata = current_value
        elseif(rawget(current_value, "toanglesyx")) then
            pf_framework.current_valueectorutil = current_value
        elseif(rawget(current_value, "IsVIP")) then
            pf_framework.instancetype = current_value
        elseif(rawget(current_value, "timehit")) then
            pf_framework.physics = current_value
        elseif(rawget(current_value, "raycastSingleExit")) then
            pf_framework.raycastutil = current_value
        elseif(rawget(current_value, "bulletLifeTime")) then
            pf_framework.publicsettings = current_value
        elseif(rawget(current_value, "player") and rawget(current_value, "reset")) then
            pf_framework.animation = current_value
        end
    end
end

local function recursive_print(tbl, depth)
    if typeof(tbl) == "table" then
        depth = depth or 0
        local d = ("\t"):rep(depth)
        local str = ""
        for i,v in next, tbl do
            str = str .. d .. tostring(i) .. '\t' .. tostring(v)..'\n'..recursive_print(v, depth + 1)
        end
        return str
    end
    return ""
end

setclipboard(recursive_print(pf_framework))
print("complete")
