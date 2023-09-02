local lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/kraken163/krakens/master/ui%20lib')))()


local w = lib:MakeWindow({Name = "saber bú cặc", HidePremium = false, SaveConfig = true, ConfigFolder = "sabersim"})

local Tab = w:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Auto Saber",
	Default = false,
	Callback = function(v)
		shared.farmcc = v
	end    
})
Tab:AddToggle({
	Name = "Auto Sell",
	Default = false,
	Callback = function(v)
		shared.sellconcac1 =v
	end    
})
Tab:AddToggle({
	Name = "Auto Sell when Full",
	Default = false,
	Callback = function(state)
		if state then
			waitValue2 = .1
			while wait(waitValue2) do
			if game.Players.LocalPlayer.PlayerGui.Gui.Submenus.BackpackFull.Visible == true then
				local sellconcac = CFrame.new(532.8, 186.313, 151.486) 
				local Hum = game.Players.LocalPlayer.Character.HumanoidRootPart 
			end
			end
			else
			waitValue2 = 10000000000000000000
			end
	end    
})
Tab:AddToggle({
	Name = "Auto Buy Saber",
	Default = false,
	Callback = function(v)
		shared.sword =v
	end    
})
Tab:AddToggle({
	Name = "Auto Buy DNA",
	Default = false,
	Callback = function(v)
		shared.dna =v
	end    
})
Tab:AddToggle({
	Name = "Auto Buy Rank",
	Default = false,
	Callback = function(v)
		shared.rank =v
	end    
})
Tab:AddToggle({
	Name = "Auto Buy Skills",
	Default = false,
	Callback = function(v)
		shared.skill =v
	end    
})
Tab:AddToggle({
	Name = "Auto Buy Auras",
	Default = false,
	Callback = function(v)
		shared.auras =v
	end    
})
Tab:AddToggle({
	Name = "Auto Buy Pets Aura",
	Default = false,
	Callback = function(v)
		shared.petsaura =v
	end    
})

-- anti afk
local Players = game:GetService'Players'
if not Players.LocalPlayer then
    Players:GetPropertyChangedSignal'LocalPlayer':Wait()
end

for i, v in next, getconnections(Players.LocalPlayer.Idled) do 
    v:Disable()
end
-----


local function sword()
local string_1 = "Swords";
local Target = game:GetService("ReplicatedStorage").Events.BuyAll;
Target:FireServer(string_1);
end

local function dna()
local string_1 = "Backpacks";
local Target = game:GetService("ReplicatedStorage").Events.BuyAll;
Target:FireServer(string_1);
end

---- auto rank nhu con cac
local function rank()
	for _,v in pairs( game:GetService("ReplicatedStorage").ShopItems.Classes:GetChildren()) do
	if v:IsA("Folder") then
local userdata_1 = v;
local Target = game:GetService("ReplicatedStorage").Events.BuyItem;
Target:FireServer(userdata_1);
end
end
end
------ cach ly

local function skill()
local string_1 = "JumpBoosts";
local Target = game:GetService("ReplicatedStorage").Events.BuyAll;
Target:FireServer(string_1);	
end

local function bosshit()
local string_1 = "BossBoosts";
local Target = game:GetService("ReplicatedStorage").Events.BuyAll;
Target:FireServer(string_1);
end

local sellconcac = CFrame.new(532.8, 186.313, 151.486) 
local Hum = game.Players.LocalPlayer.Character.HumanoidRootPart 

local function tool()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
if v:IsA('Tool') then 
v.Parent = game.Players.LocalPlayer.Character
end
end
end

local function farmcc()
tool()
local Target = game:GetService("ReplicatedStorage").Events.Clicked;
Target:FireServer();
end

local function sellconcac1()
Hum.CFrame = sellconcac
local Target = game:GetService("ReplicatedStorage").Events.Sell;
Target:FireServer();
end

local function auras()
local string_1 = "Auras";
local Target = game:GetService("ReplicatedStorage").Events.BuyAll;
Target:FireServer(string_1);
end

local function petsaura()
local string_1 = "PetAuras";
local Target = game:GetService("ReplicatedStorage").Events.BuyAll;
Target:FireServer(string_1);		
end

local Tab = w:MakeTab({
	Name = "Eggs",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Open Egg",
	Default = false,
	Callback = function(v)
		shared.openeggs =v
	end    
})

Tab:AddDropdown({
	Name = "Eggs",
	Default = petname,
	Options = {"1", "2"},
	Callback = function(v)
		shared.Egg = v
	end    
})

local function openegg(Name)
local userdata_1 = game:GetService("ReplicatedStorage").Eggs[Name];
local number_1 = 1;
local Target = game:GetService("ReplicatedStorage").Events.HatchEggs;
Target:InvokeServer(userdata_1, number_1);
end

spawn(function()
    while wait() do if shared.openeggs then openegg(shared.Egg) end end end)

---- craftpet

Tab:AddToggle({
	Name = "Craft All Pets",
	Default = false,
	Callback = function(v)
		shared.craftpet =v
	end    
})

local function craft()
local Target = game:GetService("ReplicatedStorage").Events.CombineAll;
Target:FireServer();
end

Tab:AddToggle({
	Name = "Sell Common",
	Default = false,
	Callback = function(v)
		shared.sellcomoon =v
	end    
})

----teleport

local Tab = w:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "MainLand",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(493.070526, 797.530945, 263.546448)
  	end    
})

Tab:AddDropdown({
	Name = "Island",
	Default = "Lands",
	Options = {'Island1','Island2','Island3','Island4','Island5','Island6','Island7','Island8','Island9','Island10','Island11','Island12','Island13','Island14','Island15','Island16','Island17','Island18','Island19','Island20','Island21','Island22','Island23','Island24','Island25','Island26','Island27','Island28','Island29','Island30'},
	Callback = function(v)
		print(v)
	end    
})

Tab:AddButton({
	Name = "Sell",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Locations.Sell.CFrame
	end})
	Tab:AddButton({
		Name = "Shop",
		Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Locations.Shop.CFrame
	end})
	Tab:AddButton({
		Name = "Spawn",
		Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Locations.FirstSpawns.FirstSpawn.CFrame
	end})
	Tab:AddButton({
		Name = "Crown Shop",
		Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Locations.CrownShop.CFrame
	end})
	Tab:AddButton({
		Name = "King of The Hill",
		Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Locations.KOH.CFrame
	end})
	Tab:AddButton({
		Name = "Arena",
		Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Locations.ArenaBase.CFrame
	end})
	Tab:AddButton({
		Name = "Goto Player",
		Callback = function(object, focus)
	if focus then
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[object.Text].Character.HumanoidRootPart.CFrame
	end
	end})

---player

local Tab = w:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "AutoCapture Flags",
	Default = false,
	Callback = function(state)
		 
if state then
	waitValue8 = 30
	while wait() do
	local CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	for i , v in pairs(shuffle(game.Workspace.Flags:GetChildren())) do
	if v.OwnerValue.Value ~= game.Players.LocalPlayer.Name then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Base.CFrame
	repeat
	wait()
	until v.OwnerValue.Value == game.Players.LocalPlayer.Name
	wait(waitValue8)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame
	end
	end
	end
	else
	waitValue8 = 100000000000000000000
	end
	end    
})

local Tab = w:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Inf jump",
	Callback = function()
		game:GetService("UserInputService").JumpRequest:Connect(function()
			if infiniteJumpEnabled then
				game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end
		end)
  	end    
})
---TIme

Tab:AddLabel('Elapsed Time:', sectime)
Tab:AddLabel('Credit: Kʳᵃᵏᵉⁿ#8334')
Tab:AddLabel('Script: Kʳᵃᵏᵉⁿ#8334')

spawn(function()
    while wait() do 
        if shared.farmcc then
            farmcc()
        end
    end
end)

spawn(function()
    while wait(1) do 
        if shared.sellconcac1 then
            sellconcac1()
        end
    end
end)

spawn(function()
    while wait(10) do 
        if shared.sword then
            sword()
        end
    end
end)

spawn(function()
    while wait(10) do 
        if shared.dna then
            dna()
        end
    end
end)

spawn(function()
    while wait(10) do 
        if shared.rank then
            rank()
        end
    end
end)

spawn(function()
    while wait(10) do 
        if shared.skill and shared.bosshit then
            skill()
            bosshit()
        end
    end
end)

spawn(function()
    while wait(10) do 
        if shared.auras then
            auras()
        end
    end
end)

spawn(function()
    while wait(10) do 
        if shared.petsaura then
            petsaura()
        end
    end
end)

local petname = {}

for i,v in pairs(game:GetService('ReplicatedStorage'):FindFirstChild('Eggs'):GetChildren()) do
    if not petname[v.Name] then
        petname[v.Name] = v.Name
    end
end

----
spawn(function()
	while wait(1) do
		if shared.craftpet then
			craft()
				end
			end
		end)
