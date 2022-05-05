local GetService = setmetatable({}, {
    __index = function(self, key)
        return game:GetService(key)
    end
})

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/dwa31/puppy/main/cottoware.lua"))()
local NotifyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/dwa31/puppy/main/AkaliNotif.lua"))()
local Notify = NotifyLibrary.Notify
Library.theme.accentcolor = Color3.new(0.603921, 0.011764, 1)

Notify({
    Title = "DxH - Premium",
    Description = "Whitelisted, Welcome "..game:GetService("Players").LocalPlayer.Name,
    Duration = 5
})

local Window = Library:CreateWindow("DxH - Premium", Vector2.new(492, 598), Enum.KeyCode.RightShift)
local AimingTab = Window:CreateTab("Aiming")

-- Aimbot Section -- 

local LegitSection = AimingTab:CreateSector("Aimbot", "left")

LegitSection:AddButton('Enabled', function()
    getgenv().AimPart = "HumanoidRootPart"
    getgenv().AimlockKey = "q"
    getgenv().AimRadius = 30
    getgenv().ThirdPerson = true
    getgenv().FirstPerson = true
    getgenv().TeamCheck = false
    getgenv().PredictMovement = true
    getgenv().PredictionVelocity = 9
    local L_27_, L_28_, L_29_, L_30_ =
        game:GetService "Players",
    game:GetService "UserInputService",
    game:GetService "RunService",
    game:GetService "StarterGui"
    local L_31_, L_32_, L_33_, L_34_, L_35_, L_36_, L_37_ =
        L_27_.LocalPlayer,
    L_27_.LocalPlayer:GetMouse(),
    workspace.CurrentCamera,
    CFrame.new,
    Ray.new,
    Vector3.new,
    Vector2.new
    local L_38_, L_39_, L_40_ = true, false, false
    local L_41_
    getgenv().CiazwareUniversalAimbotLoaded = true
    getgenv().WorldToViewportPoint = function(L_42_arg0)
        return L_33_:WorldToViewportPoint(L_42_arg0)
    end
    getgenv().WorldToScreenPoint = function(L_43_arg0)
        return L_33_.WorldToScreenPoint(L_33_, L_43_arg0)
    end
    getgenv().GetObscuringObjects = function(L_44_arg0)
        if L_44_arg0 and L_44_arg0:FindFirstChild(getgenv().AimPart) and L_31_ and L_31_.Character:FindFirstChild("Head") then
            local L_45_ = workspace:FindPartOnRay(L_35_(L_44_arg0[getgenv().AimPart].Position, L_31_.Character.Head.Position))
            if L_45_ then
                return L_45_:IsDescendantOf(L_44_arg0)
            end
        end
    end
    getgenv().GetNearestTarget = function()
        local L_46_ = {}
        local L_47_ = {}
        local L_48_ = {}
        for L_50_forvar0, L_51_forvar1 in pairs(L_27_:GetPlayers()) do
            if L_51_forvar1 ~= L_31_ then
                table.insert(L_46_, L_51_forvar1)
            end
        end
        for L_52_forvar0, L_53_forvar1 in pairs(L_46_) do
            if L_53_forvar1.Character ~= nil then
                local L_54_ = L_53_forvar1.Character:FindFirstChild("Head")
                if getgenv().TeamCheck == true and L_53_forvar1.Team ~= L_31_.Team then
                    local L_55_ =
                        (L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local L_56_ =
                        Ray.new(
                            game.Workspace.CurrentCamera.CFrame.p,
                            (L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_55_
                        )
                    local L_57_, L_58_ = game.Workspace:FindPartOnRay(L_56_, game.Workspace)
                    local L_59_ = math.floor((L_58_ - L_54_.Position).magnitude)
                    L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_55_
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_59_
                    table.insert(L_48_, L_59_)
                elseif getgenv().TeamCheck == false and L_53_forvar1.Team == L_31_.Team then
                    local L_60_ =
                        (L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local L_61_ =
                        Ray.new(
                            game.Workspace.CurrentCamera.CFrame.p,
                            (L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_60_
                        )
                    local L_62_, L_63_ = game.Workspace:FindPartOnRay(L_61_, game.Workspace)
                    local L_64_ = math.floor((L_63_ - L_54_.Position).magnitude)
                    L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_60_
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
                    L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_64_
                    table.insert(L_48_, L_64_)
                end
            end
        end
        if unpack(L_48_) == nil then
            return nil
        end
        local L_49_ = math.floor(math.min(unpack(L_48_)))
        if L_49_ > getgenv().AimRadius then
            return nil
        end
        for L_65_forvar0, L_66_forvar1 in pairs(L_47_) do
            if L_66_forvar1.diff == L_49_ then
                return L_66_forvar1.plr
            end
        end
        return nil
    end
    L_32_.KeyDown:Connect(
        function(L_67_arg0)
            if L_67_arg0 == AimlockKey and L_41_ == nil then
                pcall(
                    function()
                        if L_39_ ~= true then
                            L_39_ = true
                        end
                        local L_68_
                        L_68_ = GetNearestTarget()
                        if L_68_ ~= nil then
                            L_41_ = L_68_
                        end
                    end
                )
            elseif L_67_arg0 == AimlockKey and L_41_ ~= nil then
                if L_41_ ~= nil then
                    L_41_ = nil
                end
                if L_39_ ~= false then
                    L_39_ = false
                end
            end
        end
    )
    L_29_.RenderStepped:Connect(
        function()
            if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then
                if
                    (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 or
                    (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1
                then
                    L_40_ = true
                else
                    L_40_ = false
                end
            elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then
                if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 then
                    L_40_ = true
                else
                    L_40_ = false
                end
            elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then
                if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1 then
                    L_40_ = true
                else
                    L_40_ = false
                end
            end
            if L_38_ == true and L_39_ == true then
                if L_41_ and L_41_.Character and L_41_.Character:FindFirstChild(getgenv().AimPart) then
                    if getgenv().FirstPerson == true then
                        if L_40_ == true then
                            if getgenv().PredictMovement == true then
                                L_33_.CFrame =
                                    L_34_(
                                        L_33_.CFrame.p,
                                        L_41_.Character[getgenv().AimPart].Position +
                                        L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
                                    )
                            elseif getgenv().PredictMovement == false then
                                L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
                            end
                        end
                    elseif getgenv().ThirdPerson == true then
                        if L_40_ == true then
                            if getgenv().PredictMovement == true then
                                L_33_.CFrame =
                                    L_34_(
                                        L_33_.CFrame.p,
                                        L_41_.Character[getgenv().AimPart].Position +
                                        L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
                                    )
                            elseif getgenv().PredictMovement == false then
                                L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
                            end
                        end
                    end
                end
            end
        end
    )
end)

LegitSection:AddTextbox("Aimbot Prediction", nil, function(bool)
    getgenv().PredictionVelocity = bool
end)

LegitSection:AddToggle('Auto Prediction', false, function(value)
    autovalueprediction = value
end)

if autovalueprediction == true then
    while wait(5) do
        local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local split = string.split(pingvalue,'(')
        local ping = tonumber(split[1])
        if ping > 140 then
            getgenv().PredictionVelocity = 3
        elseif ping > 130 then
            getgenv().PredictionVelocity = 3.5
        elseif ping > 120 then
            getgenv().PredictionVelocity = 3.5
        elseif ping < 110 then
            getgenv().PredictionVelocity = 4
        elseif ping < 105 then
            getgenv().PredictionVelocity = 5
        elseif ping < 90 then
            getgenv().PredictionVelocity = 5.5
        elseif ping < 80 then
            getgenv().PredictionVelocity = 6
        elseif ping < 70 then
            getgenv().PredictionVelocity = 8
        elseif ping < 60 then
            getgenv().PredictionVelocity = 8
        elseif ping < 50 then
            getgenv().PredictionVelocity = 8
        elseif ping < 40 then
            getgenv().PredictionVelocity = 8
        end
    end
end

LegitSection:AddDropdown('Aimbot Part', {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"}, {"Head"}, false, function(value)
    getgenv().AimPart = value
end)

LegitSection:AddTextbox("Aimbot Key", nil, function(value)
    getgenv().AimlockKey = value
end)

-- SilentFov Section -- 

local SilentFov = AimingTab:CreateSector("Fov", "right")

SilentFov:AddSlider("Silent Aim Sides", 0, 1, 8, 1, function(value)
    Aiming.Settings.FOVSettings.Sides = value
end)

SilentFov:AddSlider("Silent Aim Size", 0, 100, 500, 1, function(value)
    Aiming.Settings.FOVSettings.Scale = value
end)

SilentFov:AddToggle('Silent Aim Fov Visible', true, function(value)
    Aiming.Settings.FOVSettings.Enabled  = value
end)

local RageSection = AimingTab:CreateSector("Silent Aim", "left")

RageSection:AddButton('Silent Aim', function()
    local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Aiming/main/Load.lua"))()("Module")
Aiming.ShowCredits = false 

                Notify({
                    Title = "DxH - Premium",
                    Description = "Silent Aim Loaded, thanks Stefanuk12 for modulev2 ( With license )",
                    Duration = 5
                })

-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")

-- // Vars
local MainEvent = ReplicatedStorage.MainEvent
local AimingSelected = Aiming.Selected
local AimingChecks = Aiming.Checks
local DataPing = Stats.Network.ServerStatsItem["Data Ping"]

-- // Workout the prediction stuff
local PredictionBase = 0.300
local CurrentPredictionValue = 0

RunService.Heartbeat:Connect(function()
    -- // Workout the prediction value
    local Ping = tostring(DataPing:GetValueString()):split(" ")[1]
    CurrentPredictionValue = (Ping / 1000 + PredictionBase)
end)

-- // Apply the prediction
local function ApplyPredictionFormula(SelectedPart)
    -- // Workout the predicted place
    local Predicted = SelectedPart.CFrame + (SelectedPart.Velocity * CurrentPredictionValue)

    -- // Return it
    return Predicted
end

-- // So it works when not obfuscating
LPH_JIT_ULTRA = LPH_JIT_ULTRA or function(...)
    return ...
end

-- //
local __namecall
__namecall = hookmetamethod(game, "__namecall", LPH_JIT_ULTRA(function(...)
    -- // Vars
    local args = {...}
    local self = args[1]
    local method = getnamecallmethod()

    -- // Make sure aiming is enabled, and the game is trying to send the mouse pos to server
    if (method == "FireServer" and self == MainEvent and args[2] == "UpdateMousePos" and AimingChecks.IsAvailable()) then
        -- // Spoof mouse pos
        local Hit = ApplyPredictionFormula(AimingSelected.Part)
        args[3] = Hit.Position

        -- // Return spoofed args
        return __namecall(unpack(args))
    end

    -- // Return
    return __namecall(...)
end))
end)

RageSection:AddToggle('Visible Check', false, function(value)
    Aiming.Settings.VisibleCheck = value
end)

RageSection:AddDropdown('Silent Part', {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"}, {"Head"}, false, function(value)
    Aiming.Settings.TargetPart = value
end)

local TargetSection = AimingTab:CreateSector("Target", "right")

TargetSection:AddButton('Target Silent (Q)', function()
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling



_G.KEY1 = "q"
_G.PART = "HumanoidRootPart"
_G.PRED = 0.039
_G.Frame = Vector3.new(0,0.53,0)


local CC = game:GetService "Workspace".CurrentCamera
local Plr
local enabled = false
local accomidationfactor = nil
local mouse = game.Players.LocalPlayer:GetMouse()
local placemarker = Instance.new("Part", game.Workspace)
local guimain = Instance.new("Folder", game.CoreGui)

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = true
    local a = Instance.new("Frame", e)
    a.Size = UDim2.new(4, 0, 4, 0)
    a.BackgroundTransparency = 0.1
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    g.CornerRadius = UDim.new(50, 50)
    return (e)
end

local data = game.Players:GetPlayers()
function noob(player)
    local character
    repeat
        wait()
    until player.Character
    local handler = makemarker(guimain, player.Character:WaitForChild(_G.PART), Color3.fromRGB(255, 255, 255), 0.0, 0)
    handler.Name = player.Name
    player.CharacterAdded:connect(
        function(Char)
            handler.Adornee = Char:WaitForChild(_G.PART)
        end
    )

    local TextLabel = Instance.new("TextLabel", handler)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Position = UDim2.new(0, 0, 0, -50)
    TextLabel.Size = UDim2.new(0, 100, 0, 100)
    TextLabel.Font = Enum.Font.SourceSansSemibold
    TextLabel.TextSize = 14
    TextLabel.TextColor3 = Color3.new(0, 0, 0)
    TextLabel.TextStrokeTransparency = 0
    TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
    TextLabel.Text = "Name: " .. player.Name
    TextLabel.ZIndex = 10

    spawn(
        function()
            while wait() do
                if player.Character then    
                --TextLabel.Text = player.Name.." | Bounty: "..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
                end
            end
        end
    )
end

for i = 1, #data do
    if data[i] ~= game.Players.LocalPlayer then
        noob(data[i])
    end
end

game.Players.PlayerAdded:connect(
    function(Player)
        noob(Player)
    end
)

game.Players.PlayerRemoving:Connect(
    function(player)
        guimain[player.Name]:Destroy()
    end
)

spawn(
    function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        placemarker.Size = Vector3.new(0.1, 0.1, 0.1)
        placemarker.Transparency = 0.1
        makemarker(placemarker, placemarker, Color3.fromRGB(255, 255, 255), 0.20, 0)
    end
)

mouse.KeyDown:Connect(
    function(k)
        if k ~= _G.KEY1 then
            return
        end
        if enabled then
            -- guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            enabled = false
            TextLabel.TextColor3 = Color3.fromRGB(255, 20, 75)
            TextLabel.Text = "------"
        else
            --guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            enabled = true
            Plr = getClosestPlayerToCursor()
            TextLabel.TextColor3 = Color3.fromRGB(12, 255, 0)
            TextLabel.Text = Plr.Character.Humanoid.DisplayName
        end
    end)

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if
            v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
                v.Character.Humanoid.Health ~= 0 and
                v.Character:FindFirstChild(_G.PART)
         then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end

game:GetService "RunService".Stepped:connect(
    function()
        if enabled and Plr.Character and Plr.Character:FindFirstChild(_G.PART) then
            placemarker.CFrame =
                CFrame.new(Plr.Character[_G.PART].Position + _G.Frame + (Plr.Character[_G.PART].Velocity * accomidationfactor))
        else
            placemarker.CFrame = CFrame.new(0, 9999, 0)
        end
    end
)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall =
    newcclosure(
    function(...)
        local args = {...}
        if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
            args[3] = Plr.Character[_G.PART].Position+ _G.Frame + (Plr.Character[_G.PART].Velocity * accomidationfactor)
            return old(unpack(args))
        end
        return old(...)
    end
)

game.Players.LocalPlayer.Chatted:Connect(
    function(Chat)
        if Chat == "print" then
            print(_G.PRED)
        end
    end
)

game.Players.LocalPlayer.Chatted:Connect(
    function(Chat)
        if Chat == "Code:1029" then

            _G.KEY1 = nil
            _G.AIR = nil
            _G.PART = nil
            _G.PRED = nil
            TextLabel.Visible = false


        end
    end
)

game.Players.LocalPlayer.Chatted:Connect(
    function(Chat)
        if Chat == "Code:1030" then

            _G.KEY1 = "q"
            _G.AIR = 0.00005
            _G.PART = "LowerTorso"
            _G.PRED = 0.029
            TextLabel.Visible = true


        end
    end
)

game.Players.LocalPlayer.Chatted:Connect(
    function(Chat)
        if Chat == "P+" then


            _G.PRED = _G.PRED+0.001



        end
    end
)

game.Players.LocalPlayer.Chatted:Connect(
    function(Chat)
        if Chat == "P-" then

            _G.PRED = _G.PRED-0.001



        end
    end
)



while wait() do
    --[[
    if getClosestPlayerToCursor().Character.Humanoid.FloorMaterial == Enum.Material.Air then
        accomidationfactor = _G.AIR
        print("jump 1")
    else
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local Value = tostring(ping)
        local pingValue = Value:split(" ")
        local PingNumber = pingValue[1]

        accomidationfactor = PingNumber / 1000 + 0.016
    end
    ]]
    if getClosestPlayerToCursor().Character.Humanoid.Jump == true and getClosestPlayerToCursor().Character.Humanoid.FloorMaterial == Enum.Material.Air then
        _G.Frame = Vector3.new(0,-2.3,0)
wait(0.05)
    else
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local Value = tostring(ping)
        local pingValue = Value:split(" ")
        local PingNumber = pingValue[1]
        
        accomidationfactor = PingNumber / 1000 + _G.PRED
        _G.Frame = Vector3.new(0,0.53,0)

    end
end
end)

-- Blantant Tab --

local BlatantTab = Window:CreateTab("Blatant")

local SpeedSector = BlatantTab:CreateSector("Movement", "left")

SpeedSector:AddButton('Movement Speed (N)', function()
    repeat
wait()
until game:IsLoaded()
local Players = game:service('Players')
local LocalPlayer = Players.LocalPlayer
repeat
wait()
until LocalPlayer.Character
local UserInputService = game:service('UserInputService')
local RunService = game:service('RunService')
getgenv().Multiplier = 0.5
local speedglitchtrue = true
local L_139_
UserInputService.InputBegan:connect(function(L_140_arg0)
if L_140_arg0.KeyCode == Enum.KeyCode.LeftBracket then
    Multiplier = Multiplier + 0.01
    print(Multiplier)
    wait(0.2)
    while UserInputService:IsKeyDown(Enum.KeyCode.LeftBracket) do
        wait()
        Multiplier = Multiplier + 0.01
        print(Multiplier)
    end
end
if L_140_arg0.KeyCode == Enum.KeyCode.RightBracket then
    Multiplier = Multiplier - 0.01
    print(Multiplier)
    wait(0.2)
    while UserInputService:IsKeyDown(Enum.KeyCode.RightBracket) do
        wait()
        Multiplier = Multiplier - 0.01
        print(Multiplier)
    end
end
if L_140_arg0.KeyCode == Enum.KeyCode.N then
    speedglitchtrue = not speedglitchtrue
    if speedglitchtrue == true then
        repeat
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
            game:GetService("RunService").Stepped:wait()
        until speedglitchtrue == false
    end
end
end)
end)

SpeedSector:AddSlider("Speed", 0, 3, 5, 1, function(value)
getgenv().Multiplier = value
end)

SpeedSector:AddButton('Movement Speed Gun Fix', function()
for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
    v:Destroy()
end
end
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
repeat
    wait()
until game.Players.LocalPlayer.Character
char.ChildAdded:Connect(function(child)
    if child:IsA("Script") then 
        wait(0.1)
        if child:FindFirstChild("LocalScript") then
            child.LocalScript:FireServer()
        end
    end
end)
end)
end)



-- Teleport Tab --

local TeleportTab = Window:CreateTab("Teleport")

local TeleportSection = TeleportTab:CreateSector("Teleport", "left")

TeleportSection:AddButton('Admin Base', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-874.903992, -32.6492004, -525.215698)
end)
TeleportSection:AddButton('Armor', function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-934.73651123047, -28.492471694946, 565.99884033203)
end)
TeleportSection:AddButton('Food', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-788.39318847656, -39.649200439453, -935.27795410156)
end)
TeleportSection:AddButton('AK Bush', function()
    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -626.288757,
            7.99984694,
            -772.322632,
            -0.997374237,
            -1.67662592e-10,
            -0.0724197701,
            -1.00076274e-10,
            1,
            -9.36886457e-10,
            0.0724197701,
            -9.27178945e-10,
            -0.997374237
        )
end)

local OtherSection = BlatantTab:CreateSector("Other", "right")

OtherSection:AddButton('Fly', function()
    local localplayer = game.Players.LocalPlayer
local localplayermouse = localplayer:GetMouse()

if workspace:FindFirstChild("Core") then
    workspace.Core:Destroy()
end
local L_145_ = Instance.new("Part")
L_145_.Name = "Core"
L_145_.Size = Vector3.new(0.05, 0.05, 0.05)
spawn(function()
    L_145_.Parent = workspace
    local L_152_ = Instance.new("Weld", L_145_)
    L_152_.Part0 = L_145_
    L_152_.Part1 = localplayer.Character.LowerTorso
    L_152_.C0 = CFrame.new(0, 0, 0)
end)
workspace:WaitForChild("Core")
local L_146_ = workspace.Core
flying = true
local L_147_ = 25
local L_148_ = {
    a = false,
    d = false,
    w = false,
    s = false
}
local L_149_
local L_150_
local function L_151_func()
    local L_153_ = Instance.new("BodyPosition", L_146_)
    local L_154_ = Instance.new("BodyGyro", L_146_)
    L_153_.Name = "EPIXPOS"
    L_153_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
    L_153_.position = L_146_.Position
    L_154_.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    L_154_.cframe = L_146_.CFrame
    repeat
        wait()
        localplayer.Character.Humanoid.PlatformStand = true
        local L_155_ = L_154_.cframe - L_154_.cframe.p + L_153_.position
        if not L_148_.w and not L_148_.s and not L_148_.a and not L_148_.d then
            L_147_ = 25
        end
        if L_148_.w then
            L_155_ = L_155_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_147_
            L_147_ = L_147_ + 0
        end
        if L_148_.s then
            L_155_ = L_155_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_147_
            L_147_ = L_147_ + 0
        end
        if L_148_.d then
            L_155_ = L_155_ * CFrame.new(L_147_, 0, 0)
            L_147_ = L_147_ + 0
        end
        if L_148_.a then
            L_155_ = L_155_ * CFrame.new(-L_147_, 0, 0)
            L_147_ = L_147_ + 0
        end
        if L_147_ > 10 then
            L_147_ = 25
        end
        L_153_.position = L_155_.p
        if L_148_.w then
            L_154_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_147_ * 0), 0, 0)
        elseif L_148_.s then
            L_154_.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_147_ * 0), 0, 0)
        else
            L_154_.cframe = workspace.CurrentCamera.CoordinateFrame
        end
    until flying == false
    if L_154_ then
        L_154_:Destroy()
    end
    if L_153_ then
        L_153_:Destroy()
    end
    flying = false
    localplayer.Character.Humanoid.PlatformStand = false
    L_147_ = 25
end
L_149_ = localplayermouse.KeyDown:connect(function(L_156_arg0)
    if not L_146_ or not L_146_.Parent then
        flying = false
        L_149_:disconnect()
        L_150_:disconnect()
        return
    end
    if L_156_arg0 == "w" then
        L_148_.w = true
    elseif L_156_arg0 == "s" then
        L_148_.s = true
    elseif L_156_arg0 == "a" then
        L_148_.a = true
    elseif L_156_arg0 == "d" then
        L_148_.d = true
    elseif L_156_arg0 == "x" then
        if flying == true then
            flying = false
        else
            flying = true
            L_151_func()
        end
    end
end)
L_150_ = localplayermouse.KeyUp:connect(function(L_157_arg0)
    if L_157_arg0 == "w" then
        L_148_.w = false
    elseif L_157_arg0 == "s" then
        L_148_.s = false
    elseif L_157_arg0 == "a" then
        L_148_.a = false
    elseif L_157_arg0 == "d" then
        L_148_.d = false
    end
end)
L_151_func()
end)

local highfly = OtherSection:AddToggle('Heigh Fly', false, function(Data)
            if Data then
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = 20
               -- Module.Functions.PlayAnimation(3152378852, nil, true)
            else
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = 2.1
               -- Module.Functions.StopAnimation()
            end
end)

highfly:AddKeybind()

local EspTab = Window:CreateTab("Esp")

local EspSection = EspTab:CreateSector("", "left")

local EspLibrary = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()

EspSection:AddToggle('Esp', false, function(value)
    EspLibrary:Toggle(value)
end)

EspSection:AddToggle('Tracers', false, function(value)
    EspLibrary.Tracers = value
end)

EspSection:AddToggle('Names', false, function(value)
    EspLibrary.Names = value
end)

EspSection:AddToggle('Hitbox', false, function(value)
    EspLibrary.Boxes = value
end)

local SettingsTab = Window:CreateTab("Settings")

if syn then
    SettingsTab:CreateConfigSystem("left")
else
    Notify({
        Title = "DxH - Premium",
        Description = "Your Executor Doesn't Support Config.",
        Duration = 5
    })
end
