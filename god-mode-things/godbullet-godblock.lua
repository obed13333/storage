local localPlayer = game:GetService('Players').LocalPlayer;
local localCharacter = localPlayer.Character;
localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
local newCharacter = localPlayer.CharacterAdded:Wait();
local spoofFolder = Instance.new('Folder');
spoofFolder.Name = 'FULLY_LOADED_CHAR';
spoofFolder.Parent = newCharacter;
newCharacter:WaitForChild('RagdollConstraints'):Destroy();
local spoofValue = Instance.new('BoolValue', newCharacter);
spoofValue.Name = 'RagdollConstraints';
wait()
--godblock/godbullet
local ps = game:GetService("Players")
local lp = ps.LocalPlayer
local char = lp.Character

char.BodyEffects.Armor:Destroy()
char.BodyEffects.Defense:Destroy()

local Clone1 = Instance.new("IntValue")
Clone1.Name = "Armor"
Clone1.Parent = char.BodyEffects

local Clone2 = Instance.new("NumberValue")
Clone2.Name = "Defense"
Clone2.Parent = char.BodyEffects
