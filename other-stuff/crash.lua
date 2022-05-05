local Tool = 'Wallet' 

local plr = game.Players.LocalPlayer
local char = plr.Character
local bp = plr.Backpack

game["Run Service"].Stepped:Connect(function()
    game["Run Service"].Stepped:Connect(function()
        if char:FindFirstChild(Tool) then
            char:FindFirstChild(Tool).Parent = bp
        else
            bp:FindFirstChild(Tool).Parent = char
        end
    end)
end)
