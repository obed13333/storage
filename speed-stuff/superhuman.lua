superhuman = false
plr = game.Players.LocalPlayer
mouse = plr:GetMouse()
mouse.KeyDown:connect(function(key)
    if key == "x" and superhuman == false then
        superhuman = true
        game.Players.LocalPlayer.Character.Humanoid.Name = "Hum"
        game.Players.LocalPlayer.Character.Hum.WalkSpeed = 325
    elseif key == "x" and superhuman == true then
        superhuman = false
        game.Players.LocalPlayer.Character.Hum.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Hum.Name = "Humanoid"
    end
end)
