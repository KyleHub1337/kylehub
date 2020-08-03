--Defining the library
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/edJT9EGX", true))()
--To close/open the UI (after it's been initialized) use Library:Close() to toggle it, use the keybind option to quickly make a toggle for it without hassle (there is an example below)

--Making a window
local Window = Library:CreateWindow"Testing"
--There is a special property for windows which can be set to false (Window.canInit = false), if done so the window will not be initialized when Library:Init() is called

--[[
	Adding options
	All options will by default have their flag names set to whatever the text is, unless the flag is set
]]


--Slider
Window:AddSlider({text = "WalkSpeed", flag = "slider1", value = 16, min = 16, max = 100, callback = function(a) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a end})
Window:AddSlider({text = "Jump Power", flag = "slider2", value = 50, min = 50, max = 500, callback = function(a) game.Players.LocalPlayer.Character.Humanoid.JumpPower = a end})

--Keybind
if game.PlaceId == 4403611151 then
Window:AddBind({text = "Bind", flag = "bind", key = "H", callback = function() function GetMonster()
    local shortestDistance = math.huge
    for i, v in pairs(game.Workspace.MonsterObject.Blue.Level01:GetDescendants()) do
        if v.Name == "Torso" then
            local magnitude = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if magnitude < shortestDistance then
                closestMonster = v.Position
                shortestDistance = magnitude
            end
        end
    end
return closestMonster
end
game:GetService("Players").LocalPlayer.Character.Gun1.GunRemote:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, GetMonster()) end})
end
Window:AddBind({text = "Toggle UI", key = "RightShift", callback = function() Library:Close() end})

--Initialize the library, so everything will get created
Library:Init()

wait(5)
--Flags can be useful for a lot of stuff, get creative with them :)
--You can also get the value/state/key from each option if they're defined
