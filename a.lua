local ValidKeys = {
    "JRTtibghwXeykmqzh4r3oCvzf35xtb",

}

local function isValidKey(key)
    for _, v in ipairs(ValidKeys) do
        if v == key then
            return true
        end
    end
    return false
end

if not getgenv().key or not isValidKey(getgenv().key) then
    game:GetService("Players").LocalPlayer:Kick("Key không hợp lệ!")
    return
end
repeat task.wait() until game:IsLoaded()

getgenv().Image = "rbxthumb://type=Asset&id=87467170005297&w=420&h=420"
getgenv().ToggleUI = "E"

task.spawn(function()
    if not getgenv().LoadedMobileUI then
        getgenv().LoadedMobileUI = true
        local OpenUI = Instance.new("ScreenGui")
        local ImageButton = Instance.new("ImageButton")
        local UICorner = Instance.new("UICorner")
        OpenUI.Name = "OpenUI"
        OpenUI.Parent = game:GetService("CoreGui")
        OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        ImageButton.Parent = OpenUI
        ImageButton.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
        ImageButton.BackgroundTransparency = 0.8
        ImageButton.Position = UDim2.new(0, 0, 0, 0)
        ImageButton.Size = UDim2.new(0, 55, 0, 55)
        ImageButton.Image = getgenv().Image
        ImageButton.Draggable = true
        ImageButton.Transparency = 1
        UICorner.CornerRadius = UDim.new(0, 10)
        UICorner.Parent = ImageButton
        ImageButton.MouseButton1Click:Connect(function()
            game:GetService("VirtualInputManager"):SendKeyEvent(true, getgenv().ToggleUI, false, game)
        end)
    end
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Michael Hub [Premium]",
    SubTitle = "By: Michael",
    TabWidth = 130,
    Size = UDim2.fromOffset(530, 350),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.E
})

local Tabs = {
    Shop = Window:AddTab({ Title = "Tab Shop", Icon = "" }),
    Setting = Window:AddTab({ Title = "Setting Farm", Icon = "" }),
    Main = Window:AddTab({ Title = "Tab Farm", Icon = "" }),
    Item = Window:AddTab({ Title = "Tab Item", Icon = "" }),
    Stats = Window:AddTab({ Title = "Tab Stats", Icon = "" }),
    Race = Window:AddTab({ Title = "Tab Race", Icon = "" }),
    Raid = Window:AddTab({ Title = "Tab Raid", Icon = "" }),
    Hop = Window:AddTab({ Title = "Tab Hop", Icon = "" }),
    Misc = Window:AddTab({ Title = "Tab Localplayer", Icon = "" }),
}

local DropdownSelectWeapon = Tabs.Main:AddDropdown("DropdownSelectWeapon", {
    Title = "Select Tool",
    Values = {"Melee", "Sword", "Fruit"},
    Multi = false,
    Default = 1,
})

DropdownSelectWeapon:SetValue('Melee')

local ChooseWeapon = "Melee"  -- Khởi tạo giá trị mặc định cho ChooseWeapon

DropdownSelectWeapon:OnChanged(function(Value)
    ChooseWeapon = Value
end)

task.spawn(function()
    while wait() do
        pcall(function()
            if ChooseWeapon == "Melee" then
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        SelectWeapon = v.Name
                    end
                end
            elseif ChooseWeapon == "Sword" then
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        SelectWeapon = v.Name
                    end
                end
            elseif ChooseWeapon == "Fruit" then  -- Sửa " Blox Fruit" thành "Fruit"
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Fruit" then
                        SelectWeapon = v.Name
                    end
                end
            else
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        SelectWeapon = v.Name
                    end
                end
            end
        end)
    end
end)

local ToggleLevel = Tabs.Main:AddToggle("ToggleLevel", {Title = "Auto Level", Default = false })
ToggleLevel:OnChanged(function(Value)
    _G.AutoLevel = Value
end)


local ToggleMobAura = Tabs.Main:AddToggle("ToggleMobAura", {Title = "Kill Near / Mob Aura", Default = false })
ToggleMobAura:OnChanged(function(Value)
    _G.AutoNear = Value
end)


local ToggleMirageIsland = Tabs.Main and Tabs.Main:AddToggle("ToggleMirageIsland", {Title = "Bring Mob", Default = true })
if ToggleMirageIsland then
    ToggleMirageIsland:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)
end

Tabs.Main:AddButton({
        Title = "Fps Booster",
        Description = "Boost your fps",
        Callback = function()
            FPSBooster()
        end
    })

    function FPSBooster()
        local decalsyeeted = true
        local g = game
        local w = g.Workspace
        local l = g.Lighting
        local t = w.Terrain
        sethiddenproperty(l,"Technology",2)
        sethiddenproperty(t,"Decoration",false)
        t.WaterWaveSize = 0
        t.WaterWaveSpeed = 0
        t.WaterReflectance = 0
        t.WaterTransparency = 0
        l.GlobalShadows = false
        l.FogEnd = 9e9
        l.Brightness = 0
        settings().Rendering.QualityLevel = "Level01"
        for i, v in pairs(g:GetDescendants()) do
            if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            elseif v:IsA("MeshPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
                v.TextureID = 10385902758728957
            end
        end
        for i, e in pairs(l:GetChildren()) do
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                e.Enabled = false
            end
        end
    end
Tabs.Main:AddParagraph({
        Title = "Mastery",
        Content = "___"
    })
local DropdownMastery = Tabs.Main:AddDropdown("DropdownMastery", {
        Title = "Mastery Mode",
        Values = {"Level","Near Mobs",},
        Multi = false,
        Default = 1,
    })
local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Health %",
        Description = "",
        Default = 60,
        Min = 1,
        Max = 100,
        Rounding = 1,
        Callback = function(Value)
        
        end
    })
local ToggleMasteryFruit = Tabs.Main:AddToggle("ToggleMasteryFruit", {Title = "Auto Fruit Mastery", Default = false })
    ToggleMasteryFruit:OnChanged(function(Value)
        AutoFarmMasDevilFruit = Value
    end)
    
local ToggleBone = Tabs.Main:AddToggle("ToggleBone", {Title = "Auto Bone", Default = false })
ToggleBone:OnChanged(function(Value)
    _G.AutoBone = Value
end)
local ToggleCake = Tabs.Main:AddToggle("ToggleCake", {Title = "Auto Cake Prince", Default = false })
ToggleCake:OnChanged(function(Value)
 _G.CakePrince = Value
end)
local DropdownBoss = Tabs.Main:AddDropdown("DropdownBoss", {
        Title = "Select Bot",
        Values = {"none"},
        Multi = false,
        Default = 1,
    })
local ToggleAutoFarmBoss = Tabs.Main:AddToggle("ToggleAutoFarmBoss", {Title = "Kill Boss", Default = false })
    ToggleAutoFarmBoss:OnChanged(function(Value)
		_G.AutoBoss = Value
    end)
Tabs.Main:AddParagraph({
        Title = "Ectoplasm",
        Content = "___"
    })
local ToggleVatChatKiDi = Tabs.Main:AddToggle("ToggleVatChatKiDi", {Title = "Auto Ectoplasm", Default = false })
    ToggleVatChatKiDi:OnChanged(function(Value)
        _G.Ectoplasm = Value
    end)
Tabs.Main:AddParagraph({
        Title = "Rough Sea",
        Content = "___"
    })
local ToggleTerrorshark = Tabs.Main:AddToggle("ToggleTerrorshark", {Title = " Kill Terrorshark", Default = false })

    ToggleTerrorshark:OnChanged(function(Value)
        _G.AutoTerrorshark = Value
    end)
local TogglePiranha = Tabs.Main:AddToggle("TogglePiranha", {Title = " Kill Piranha", Default = false })

     TogglePiranha:OnChanged(function(Value)
        _G.farmpiranya = Value
     end)
local ToggleShark = Tabs.Main:AddToggle("ToggleShark", {Title = " Kill Shark", Default = false })
     ToggleShark:OnChanged(function(Value)
        _G.AutoShark = Value
     end)
local ToggleFishCrew = Tabs.Main:AddToggle("ToggleFishCrew", {Title = " Kill Fish Crew", Default = false })
    ToggleFishCrew:OnChanged(function(Value)
       _G.AutoFishCrew = Value
    end)
local ToggleElite = Tabs.Main:AddToggle("ToggleElite", {Title = "Auto Elite Hunter", Default = false })

    ToggleElite:OnChanged(function(Value)
       _G.AutoElite = Value
       end)
Tabs.Main:AddParagraph({
        Title = "Sea Beast",
        Content = "___"
    })
local ToggleSeaBeAst = Tabs.Main:AddToggle("ToggleSeaBeAst", {Title = "Auto Sea Beast", Default = false })

ToggleSeaBeAst:OnChanged(function(Value)
    _G.AutoSeaBeast = Value
    end)
Tabs.Main:AddParagraph({
        Title = "Mirage Island",
        Content = "___"
    })
local ToggleTweenMirageIsland = Tabs.Main:AddToggle("ToggleTweenMirageIsland", {Title = "Tween To Mirage Island", Default = false })
ToggleTweenMirageIsland:OnChanged(function(Value)
    _G.AutoMysticIsland = Value
end) 
local ToggleMirage = Tabs.Main:AddToggle("ToggleMirage", {Title = "Auto Mirage Island", Default = false })
ToggleMirage:OnChanged(function(Value)
 _G.AutoSeaBeast = Value
end)
 local Togglelockmoon = Tabs.Main:AddToggle("Togglelockmoon", {Title = "Lock Moon and Use Race Skill", Default = false })
    Togglelockmoon:OnChanged(function(Value)
        _G.AutoLockMoon = Value
    end) 
local ToggleTweenGear = Tabs.Main:AddToggle("ToggleTweenGear", {Title = "Tween To Gear", Default = false })
ToggleTweenGear:OnChanged(function(Value)
    _G.TweenToGear = Value
end) 
local ToggleFactory = Tabs.Item:AddToggle("ToggleFactory", {Title = "Auto Farm Factory", Default = false })
ToggleFactory:OnChanged(function(Value)
    _G.Factory = Value
end)

local ToggleHoly = Tabs.Item:AddToggle("ToggleHoly", {Title = "Auto Holy Torch", Default = false })
ToggleHoly:OnChanged(function(Value)
    _G.Auto_Holy_Torch = Value
end)

local ToggleTushita = Tabs.Item:AddToggle("ToggleTushita", {Title = "Auto Tushita", Default = false })
ToggleTushita:OnChanged(function(Value)
    AutoTushita = Value
end)

local ToggleYama = Tabs.Item:AddToggle("ToggleYama", {Title = "Auto Get Yama", Default = false })
ToggleYama:OnChanged(function(Value)
    _G.AutoYama = Value
end)

local ToggleMirageIsland = Tabs.Item and Tabs.Item:AddToggle("ToggleMirageIsland", {Title = "Auto CDK", Default = false })
    ToggleMirageIsland:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)

local ToggleMirageIsland = Tabs.Item and Tabs.Item:AddToggle("ToggleMirageIsland", {Title = "Auto Trade Bone", Default = false })
    ToggleMirageIsland:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)
local ToggleMirageIsland = Tabs.Item and Tabs.Item:AddToggle("ToggleMirageIsland", {Title = "Auto Buy Legendary Sword", Default = false })
    ToggleMirageIsland:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)
local ToggleMirageIsland = Tabs.Item and Tabs.Item:AddToggle("ToggleMirageIsland", {Title = "Auto Buy Haki Color", Default = false })
    ToggleMirageIsland:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)
local ToggleMirageIsland = Tabs.Item and Tabs.Item:AddToggle("ToggleMirageIsland", {Title = "Auto Get Ranboiw Haki", Default = false })
    ToggleMirageIsland:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)

local ToggleMirageIsland = Tabs.Item and Tabs.Item:AddToggle("ToggleMirageIsland", {Title = "Auto Soul Guitar", Default = false })
    ToggleMirageIsland:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)
local ToggleMirageIsland = Tabs.Item and Tabs.Item:AddToggle("ToggleMirageIsland", {Title = "Auto True Triple Katana", Default = false })
    ToggleMirageIsland:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)


local ToggleWhite = Tabs.Setting:AddToggle("ToggleWhite", {Title = "White Screen", Default = false })
    ToggleWhite:OnChanged(function(Value)
       _G.WhiteScreen = Value
       if _G.WhiteScreen == true then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    elseif _G.WhiteScreen == false then
        game:GetService("RunService"):Set3dRenderingEnabled(true)
            end
        end)
local ToggleRemoveNotify = Tabs.Setting:AddToggle("ToggleRemoveNotify", {Title = "Remove All Notify", Default = false })
ToggleRemoveNotify:OnChanged(function(Value)
    RemoveNotify = Value
    end)
local ToggleRemove = Tabs.Setting:AddToggle("ToggleRemove", {Title = "Remove Dame Text", Default = true })
ToggleRemove:OnChanged(function(Value)
    FaiFaoRemovetext = Value
    end)
local ToggleX = Tabs.Setting:AddToggle("ToggleX", {Title = "Skill X", Default = true })
ToggleX:OnChanged(function(Value)
    SkillX = Value
end)
local ToggleZ = Tabs.Setting:AddToggle("ToggleZ", {Title = "Skill Z", Default = true })
ToggleZ:OnChanged(function(Value)
    SkillZ = Value
end)
local SliderTween = Tabs.Setting:AddSlider("SliderTween", {
    Title = "Teleport / Tween",
    Description = "",
    Default = 300,
    Min = 100,
    Max = 1000,
    Rounding = 1,
    Callback = function(Value)
      ChangeSpeed = Value
    end
})
local SliderPosY = Tabs.Setting:AddSlider("SliderPosY", {
    Title = "Pos Y",
    Description = "",
    Default = 30,
    Min = -60,
    Max = 60,
    Rounding = 1,
    Callback = function(Value)
      posY = Value
    end
})
local SliderPosX = Tabs.Setting:AddSlider("SliderPosX", {
    Title = "Pos X",
    Description = "",
    Default = 0,
    Min = -60,
    Max = 60,
    Rounding = 1,
    Callback = function(Value)
      posX = Value
    end
})
local ToggleC = Tabs.Setting:AddToggle("ToggleC", {Title = "Skill C", Default = true })
ToggleC:OnChanged(function(Value)
    SkillC = Value
end)
local ToggleF = Tabs.Setting:AddToggle("ToggleF", {Title = "Skill F", Default = false })
ToggleF:OnChanged(function(Value)
   SkillF = Value
    end)
local ToggleF = Tabs.Setting:AddToggle("ToggleF", {Title = "Skill F", Default = false })
ToggleF:OnChanged(function(Value)
   SkillF = Value
    end)
local ToggleGun = Tabs.Stats:AddToggle("ToggleGun", {Title = "Auto Gun", Default = false })
ToggleGun:OnChanged(function(Value)
    _G.Auto_Stats_Gun = Value
    end)
local ToggleDe = Tabs.Stats:AddToggle("ToggleDe", {Title = "Auto Defense", Default = false })
ToggleDe:OnChanged(function(Value)
    _G.Auto_Stats_Defense = Value
    end)

local ToggleSword = Tabs.Stats:AddToggle("ToggleSword", {Title = "Auto Sword", Default = false })
ToggleSword:OnChanged(function(Value)
    _G.Auto_Stats_Sword = Value
    end)
local ToggleFruit = Tabs.Stats:AddToggle("ToggleFruit", {Title = "Auto Demon Fruit", Default = false })
ToggleFruit:OnChanged(function(Value)

    end)


local Chips = {"Flame","Ice","Quake","Light","Dark","Spider","Rumble","Magma","Buddha","Sand","Phoenix","Dough"}

local DropdownRaid = Tabs.Raid:AddDropdown("DropdownRaid", {
    Title = "Dropdown",
    Values = Chips,
    Multi = false,
    Default = 1,
})
local ToggleBuy = Tabs.Raid:AddToggle("ToggleBuy", {Title = "Buy Chip", Default = false })
ToggleBuy:OnChanged(function(Value)
    _G.Auto_Buy_Chips_Dungeon = Value
end)

    local ToggleStart = Tabs.Raid:AddToggle("ToggleStart", {Title = "Start Raid", Default = false })
    ToggleStart:OnChanged(function(Value)
        _G.Auto_StartRaid = Value
end)
local ToggleKillAura = Tabs.Raid:AddToggle("ToggleKillAura", {Title = "Kill Aura", Default = false })
ToggleKillAura:OnChanged(function(Value)
    KillAura = Value
end)
local ToggleNextIsland = Tabs.Raid:AddToggle("ToggleNextIsland", {Title = "Next Island", Default = false })
ToggleNextIsland:OnChanged(function(Value)
    AutoNextIsland = Value
end)

Tabs.Raid:AddParagraph({
        Title = "Player",
        Content = "___"
    })
local Playerslist = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Playerslist,v.Name)
end

local SelectedPly = Tabs.Raid:AddDropdown("SelectedPly", {
    Title = "Dropdown",
    Values = Playerslist,
    Multi = false,
    Default = 1,
})

local ToggleQuanSat = Tabs.Raid:AddToggle("ToggleQuanSat", {Title = "Spectate Player", Default = false })
ToggleQuanSat:OnChanged(function(Value)
    SpectatePlys = Value
    local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
    local plr2 = game:GetService("Players"):FindFirstChild(_G.SelectPly)
    repeat wait(.1)
        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
    until SpectatePlys == false 
    game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
end)

local ToggleTeleport = Tabs.Raid:AddToggle("ToggleTeleport", {Title = "Teleport To Player", Default = false })
ToggleTeleport:OnChanged(function(Value)
    _G.TeleportPly = Value
    pcall(function()
        if _G.TeleportPly then
            repeat Tween(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame) wait() until _G.TeleportPly == false
        end
    end)
end)

local DropdownIsland = Tabs.Race:AddDropdown("DropdownIsland",{
    Title = "Dropdown",
    Values = IslandList,
    Multi = false,
    Default = 1,
})
Tabs.Misc:AddButton({
	Title = "Rejoin Server",
	Description = "",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end
})


Tabs.Misc:AddButton({
	Title = "Hop Server",
	Description = "",
	Callback = function()
		Hop()
	end
})

function Hop()
	local PlaceID = game.PlaceId
	local AllIDs = {}
	local foundAnything = ""
	local actualHour = os.date("!*t").hour
	local Deleted = false
	function TPReturner()
		local Site;
		if foundAnything == "" then
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
		else
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
		end
		local ID = ""
		if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
			foundAnything = Site.nextPageCursor
		end
		local num = 0;
		for i,v in pairs(Site.data) do
			local Possible = true
			ID = tostring(v.id)
			if tonumber(v.maxPlayers) > tonumber(v.playing) then
				for _,Existing in pairs(AllIDs) do
					if num ~= 0 then
						if ID == tostring(Existing) then
							Possible = false
						end
					else
						if tonumber(actualHour) ~= tonumber(Existing) then
							local delFile = pcall(function()
								AllIDs = {}
								table.insert(AllIDs, actualHour)
							end)
						end
					end
					num = num + 1
				end
				if Possible == true then
					table.insert(AllIDs, ID)
					wait()
					pcall(function()
						wait()
						game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
					end)
					wait(4)
				end
			end
		end
	end
	function Teleport() 
		while wait() do
			pcall(function()
				TPReturner()
				if foundAnything ~= "" then
					TPReturner()
				end
			end)
		end
	end
	Teleport()
end      

Tabs.Misc:AddButton({
	Title = "Devil Shop",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
	end
})



Tabs.Misc:AddButton({
	Title = "Color Haki",
	Description = "",
	Callback = function()
		game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
	end
})



Tabs.Misc:AddButton({
	Title = "Title Name",
	Description = "",
	Callback = function()
		local args = {
			[1] = "getTitles"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
	end
})



Tabs.Misc:AddButton({
	Title = "Open Awakening",
	Description = "",
	Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
	end
})


Tabs.Misc:AddButton({
	Title = "Rain Fruit",
	Description = "Rain fruit (Fake)",
	Callback = function()
        for i, v in pairs(game:GetObjects("rbxassetid://15970729030")[1]:GetChildren()) do
            v.Parent = game.Workspace.Map
            v:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
            if v.Fruit:FindFirstChild("AnimationController") then
                v.Fruit:FindFirstChild("AnimationController"):LoadAnimation(v.Fruit:FindFirstChild("Idle")):Play()
            end
            v.Handle.Touched:Connect(function(otherPart)
                if otherPart.Parent == game.Players.LocalPlayer.Character then
                    v.Parent = game.Players.LocalPlayer.Backpack
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                end
            end)
        end
	end
})

local ToggleFindMoon = Tabs.Hop:AddToggle("ToggleFindMoon", {Title = "Find Full Moon", Default = false })
ToggleFindMoon:OnChanged(function(Value)
    _G.AutoFindMoon = Value
end)
local ToggleMirageIsland = Tabs.Hop:AddToggle("ToggleMirageIsland", {Title = "Find Mirage Island", Default = false })
ToggleMirageIsland:OnChanged(function(Value)
    _G.FindMirageIsland = Value
end)
local ToggleAutoAcientQuest = Tabs.Race:AddToggle("ToggleAutoAcientQuest", {Title = "Auto Acient Quest", Default = false })
ToggleAutoAcientQuest:OnChanged(function(Value)
    AutoFarmAcient = Value
end)
local ToggleAutotrial = Tabs.Race:AddToggle("ToggleAutotrial", {Title = "Auto Trial", Default = false })
ToggleAutotrial:OnChanged(function(Value)
    _G.AutoQuestRace = Value
end)

Tabs.Race:AddButton({
    Title = "Timple Of Time",
    Description = "",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    end
})


Tabs.Race:AddButton({
    Title = "Lever Pull",
    Description = "",
    Callback = function()
        Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end
})


Tabs.Race:AddButton({
    Title = "Acient One",
    Description = "",
    Callback = function()
        Tween2(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
    end
})


local Mastery = Tabs.Race:AddSection("Auto Race")


Tabs.Race:AddButton({
    Title = "Race Door",
    Description = "",
    Callback = function()
        Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875) 
        wait(0.1)
           Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875) 
           wait(0.1)
              Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875) 
              wait(0.1)
                 Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875) 
            wait(0.5)
                    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                    Tween2(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                    Tween2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                    Tween2(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                    Tween2(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                    Tween2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                    Tween2(CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094))
                    end
    end
})
