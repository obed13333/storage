--[[
Credits to Lu/Swagmode Owner for making this
discord.gg/swaggest
discord.gg/fadeds
Note from nighter, dont get scammed lol
To whoever is selling this, ur fr a retard and a skid
Must have 70% strength for it to work
]]

function Main(Delay)
    local H = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')
    local function DeleteOriginal()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v.Name == 'OriginalSize' then
                v:Destroy()
            end
            if v.Name == 'OriginalPosition' then 
                v:Destroy()
            end
        end
    end
    local function Width()
        wait(Delay)
        DeleteOriginal()
        H:FindFirstChild("BodyWidthScale"):Destroy()
    end
    local function Depth()
        wait(Delay)
        DeleteOriginal()
        H:FindFirstChild("BodyDepthScale"):Destroy()
    end
    local function Head()
        wait(Delay)
        DeleteOriginal()
        H:FindFirstChild("HeadScale"):Destroy()
    end
    local function Type()
        wait(Delay)
        DeleteOriginal()
        H:FindFirstChild("BodyTypeScale"):Destroy()  
    end 
    --// Rearrage these below to customize titan
Head()
Type()
Width()
Depth() 
    --\\
end

Main(.8)

--[[
     Patterns
        --\\ Tall and Skinny
            --// Width, Depth, Head, Type
        --\\ Tall and Skinny x2
            --// Width, Depth, Type, Head
        --\\ Forward Long
            --// Width, Head, Depth, Type
        --\\ Forward Long x2
            --// Width, Head, Type, Depth
        --\\ Really Forward Long
            --// Width, Type, Head, Depth
        --\\ Forward Long x3
            --// Width, Type, Depth, Headwd
            
        --\\ Tall, Wide + Thin
            --// Depth, Width, Type, Head
        --\\ Tall, Wide + Thin x2
            --// Depth, Width, Head, Type
        --\\ Tall, Wide + Thinner
            --// Depth, Head, Width, Type
        --\\ Really Wide and Thin
            --// Depth, Head, Type, Width
        --\\ Really Wide and Thin x2
            --// Depth, Type, Head, Width
        --\\ Tall, Wide and Thin x3
            --// Depth, Type, Width, Head
            
        --\\ Tall, Wide and slightly less thin
            --// Type, Depth, Width, Head
        --\\ Really tall and wide slightly less thin
            --// Type, Depth, Head, Width
        --\\ Really tall, wide and thicc
            --// Type, Head, Depth, Width
        --\\  Huge with tiny head 
            --// Type, Head, Width, Depth
        --\\ Forward Long x4
            --// Type, Width, Head, Depth
        --\\ Tall, slightly longer
            --// Type, Width, Depth, Head
            
        --\\ Pretty big
            --// Head, Type, Width, Depth
        --\\ Really Wide and thicc x2
            --// Head, Type, Depth, Width
        --\\ Tall, Wide + Thin x3
            --// Head, Depth, Type, Width
        --\\ Not too wide but thin
            --// Head, Depth, Width, Type
        --\\ Tall slightly forward long
            --// Head, Width, Depth, Type
        --\\ Forward long
            --// Head, Width, Type, Depth
    
--]]
