if game.GameId == 1008451066 then
	repeat
		wait();
	until game:IsLoaded() and game:GetService('Players').LocalPlayer.Character;
	loadstring(game:HttpGet('https://raw.githubusercontent.com/dawn-spec/godmodev3/main/godv3.lua'))();
end;
