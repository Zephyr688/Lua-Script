--此脚本由Smk开源发布，官方群聊638904774
local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/Zephyr688/Lua-Script/refs/heads/main/Orion.lua")))()

OrionLib:MakeNotification({
	Name = "脚本加载完毕！：",
	Content = "欢迎使用FDP脚本",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Window = OrionLib:MakeWindow({Name = "FDP", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "FDP BY Smk"})

local Tab1 = Window:MakeTab({
    Name = "通用功能",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Tab1:AddParagraph("FDP","By Smk")

Tab1:AddParagraph("此脚本由Smk开源发布","官方群聊638904774")

Tab1:AddSlider({
	Name = "移动速度",
	Min = 0,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "速度",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
		game.Players.LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(9e99, 9e99, 9e99, 9e99, 9e99)
	end    
})

Tab1:AddSlider({
	Name = "跳跃力度",
	Min = 0,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "大小",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

Tab1:AddSlider({
	Name = "地图重力",
	Min = 0,
	Max = 500,
	Default = 126,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "大小",
	Callback = function(Value)
	    game.Workspace.Gravity = Value
	end    
})

Tab1:AddSlider({
	Name = "角色生命",
	Min = 0,
	Max = 500,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "生命",
	Callback = function(Value)
	    wuhughiusahiwu = Value
		game.Players.LocalPlayer.Character.Humanoid.Health = Value
	end    
})

Tab1:AddToggle({
    Name = "锁定生命",
	Default = false,
	Callback = function(Value)
	    while Value == true do
		    wait(1)
		    if Value == true then
	    	    game.Players.LocalPlayer.Character.Humanoid.Health = wuhughiusahiwu
			end
		end
	end
})

Tab1:AddSlider({
	Name = "视野缩放",
	Min = 0,
	Max = 500,
	Default = 52,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "缩放",
	Callback = function(Value)
	    wuhu123ghiusahiwu = Value
		game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
	end    
})

Tab1:AddToggle({
    Name = "锁定缩放",
    Callback = function(Value)
	    while Value == true do
		    wait(1)
			if Value == true then
			    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = wuhu123ghiusahiwu
			end
		end
    end    
})

Tab1:AddSlider({
	Name = "甩人力度",
	Min = 0,
	Max = 1000,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "甩人力度",
	Callback = function(Value)
		swdawdpower = Value
	end    
})

Tab1:AddToggle({
    Name = "甩人",
	Default = false,
    Callback = function(Value)
	    swdawdt = Value
		while swdawdt == true do
			wait(1)
			if swdawdt == true then
		        power = swdawdpower
     		    game:GetService("RunService").Stepped:connect(function()
      		    game.Players.LocalPlayer.Character.Head.CanCollide = false
      		    game.Players.LocalPlayer.Character.Torso.CanCollide = false
       		    game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
       		    game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
       		    end)
       		    wait(1)
       		    local bambam = Instance.new("BodyThrust")
       	    	bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
       		    bambam.Force = Vector3.new(power,0,power)
      	    	bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
			end
        end
    end
})

Tab1:AddTextbox({
    Name = "范围",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        _G.HeadSize = Value
        _G.Disabled = true
        game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            for i,v in next, game:GetService("Players"):GetPlayers() do
                if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                pcall(function()
                    v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    v.Character.HumanoidRootPart.Transparency = 0.7
                    v.Character.HumanoidRootPart.CanCollide = false
                    end)
                    end
                end
            end
        end)
    end   
})

Tab1:AddButton({
    Name = "连跳",
	Callback = function()
	    game:GetService("UserInputService").JumpRequest:connect(function()
		    game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")		
	    end)
	end
})
	   
Tab1:AddButton({
    Name = "夜视",
    Callback = function()
        local lighting = game.Lighting
        lighting.Brightness = 2
        lighting.ClockTime = 14
        lighting.FogEnd = 100000
        lighting.GlobalShadows = false
        lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end    
})

Tab1:AddButton({
    Name = "优化帧数",
	Callback = function()
	    local ToDisable = {
        Textures = true,
        VisualEffects = true,
        Parts = true,
        Particles = true,
        Sky = true
        }

        local ToEnable = {
        FullBright = false
        }

        local Stuff = {}
        
        for _, v in next, game:GetDescendants() do
            if ToDisable.Parts then
                if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then
                    v.Material = Enum.Material.SmoothPlastic
                    table.insert(Stuff, 1, v)
                end
            end
          
            if ToDisable.Particles then
                if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then
                    v.Enabled = false
                    table.insert(Stuff, 1, v)
                end
            end
            
            if ToDisable.VisualEffects then
                if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then
                    v.Enabled = false
                    table.insert(Stuff, 1, v)
                end
            end
            
            if ToDisable.Textures then
                if v:IsA("Decal") or v:IsA("Texture") then
                    v.Texture = ""
                    table.insert(Stuff, 1, v)
                end
            end
            
            if ToDisable.Sky then
               if v:IsA("Sky") then
                    v.Parent = nil
                    table.insert(Stuff, 1, v)
                end
                    end
        end
        
        game:GetService("TestService"):Message("Effects Disabler Script : Successfully disabled "..#Stuff.." assets / effects. Settings :")
        
        for i, v in next, ToDisable do
            print(tostring(i)..": "..tostring(v))
        end
        if ToEnable.FullBright then
            local Lighting = game:GetService("Lighting")
            Lighting.FogColor = Color3.fromRGB(255, 255, 255)
            Lighting.FogEnd = math.huge
            Lighting.FogStart = math.huge
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.Brightness = 5
            Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
            Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
            Lighting.Outlines = true
        end
    end
})

Tab1:AddButton({
    Name = "传送工具",
	Callback = function()
	    mouse = game.Players.LocalPlayer:GetMouse()
        tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Click Teleport"
        tool.Activated:connect(
        function()
            local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
            pos = CFrame.new(pos.X, pos.Y, pos.Z)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

local Tab2 = Window:MakeTab({
    Name = "绘制自瞄",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab2:AddButton({
    Name = "绘制",
    Callback = function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/vTTE8LhN")))()
    end
})

Tab2:AddSlider({
	Name = "自瞄距离",
	Min = 1,
	Max = 1000,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "自瞄距离",
	Callback = function(Value)
		AimbotDistance = Value
    end    
})
Tab2:AddToggle({
    Name = "队伍检测",
	Default = false,
    Callback = function(Value)
        AimbotTeamCheak = Value
    end
})
Tab2:AddToggle({
    Name = "右键自瞄",
	Default = false,
    Callback = function (Value)
        local Camera = workspace.CurrentCamera
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local TweenService = game:GetService("TweenService")
        local LocalPlayer = Players.LocalPlayer
        local Holding = false
        local AimbotT = Value
        
        _G.AimbotEnabled = AimbotT
        _G.TeamCheck = AimbotTeamCheak -- If set to true then the script would only lock your aim at enemy team members.
        _G.AimPart = "Head" -- Where the aimbot script would lock at.
        _G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
        
        local function GetClosestPlayer()
        local MaximumDistance = AimbotDistance
        local Target = nil
          
        coroutine.wrap(function()
            wait(20); MaximumDistance = AimbotDistance -- Reset the MaximumDistance so that the Aimbot doesn't remember it as a very small variable and stop capturing players...
        end)()
        
        for _, v in next, Players:GetPlayers() do
        	if v.Name ~= LocalPlayer.Name then
        		if _G.TeamCheck == true then
        			if v.Team ~= LocalPlayer.Team then
        				if v.Character ~= nil then
        					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
        						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
        							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
        							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
        								
       								if VectorDistance < MaximumDistance then
       									Target = v
                       					MaximumDistance = VectorDistance
        							end
        						end
        					end
        				end
        			end
        		else
        			if v.Character ~= nil then
        				if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
       						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
       							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
       							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
   							
							    if VectorDistance < MaximumDistance then
        							Target = v
                       					MaximumDistance = VectorDistance
        						end
        					end
        				end
        			end
        		end
        	end
        end
        return Target
        end
        
        UserInputService.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                Holding = true
            end
        end)
        
        UserInputService.InputEnded:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                Holding = false
            end
        end)
        
        RunService.RenderStepped:Connect(function()
            if Holding == true and _G.AimbotEnabled == true then
                TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
            end
        end)
    end
})

local Tab3 = Window:MakeTab({
    Name = "监狱人生",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab3:AddDropdown({
    Name = "阵容",
    Default = "",
    Options = {"警察","囚犯","罪犯"},
    Callback = function(Value)
        if Value == "警察" then
            workspace.Remote.TeamEvent:FireServer("Bright blue")
        elseif Value == "囚犯" then
            workspace.Remote.TeamEvent:FireServer("Bright orange")
        elseif Value == "罪犯" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-976.125183, 109.123924, 2059.99536)
        end
    end
})

Tab3:AddButton({
    Name = "逮捕罪犯（警察）",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local cpos = Player.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
        if v.Name ~= Player.Name then
            local i = 10
            repeat
            wait(1)
            i = i-1
            game:GetService("Workspace").Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
            Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
            until i == 0
        end
        end
        Player.Character.HumanoidRootPart.CFrame = cpos
    end
})
Tab3:AddButton({
    Name = "添加近战武器",
	Callback = function()
		local replicatedStorage = game:GetService("ReplicatedStorage")
        		local players = game:GetService("Players")
		local localPlayer = players.LocalPlayer
        
		local tools = replicatedStorage.Tools:GetChildren()
        
		for _, tool in pairs(tools) do
        local newTool = tool:Clone()
  		newTool.Parent = localPlayer.Backpack
        end
	end
})
Tab3:AddButton({
    Name = "隐身",
    Callback = function()
        local player = game.Players.LocalPlayer
        position = player.Character.HumanoidRootPart.Position
        wait(1)
        player.Character:MoveTo(position + Vector3.new(0, 1000000, 0))
        wait(1)
        humanoidrootpart = player.Character.HumanoidRootPart:clone()
        wait(1)
        player.Character.HumanoidRootPart:Destroy()
        humanoidrootpart.Parent = player.Character
        player.Character:MoveTo(position)
        wait(1)
        game.Players.LocalPlayer.Character.Torso.Transparency = 1
        game.Players.LocalPlayer.Character.Head.Transparency  = 1
        game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
        game.Players.LocalPlayer.Character["Right Arm"].Transparency = 1
        game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1
        game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
        game.Players.LocalPlayer.Character.Humanoid:RemoveAccessories()
        game.Players.LocalPlayer.Character.Head.face:Remove()
    end
        })
local Tab4 = Window:MakeTab({
    Name = "Race Clicker",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab4:AddParagraph("自动挂机要先开启Auto Race","")

Tab4:AddToggle({
    Name = "自动挂机",
    Default = false,
    Callback = function(Value)
		AutoAFK1145wt = Value
		while AutoAFK1145wt == true do
		    wait(0.5)
			if AutoAFK1145wt == true then
	    		local Tp1 = game:GetService("Players")
    			local Tp2 = Tp1.LocalPlayer.Character.HumanoidRootPart
    			local Tp3 = CFrame.new(-442200, 4, 4)
				Tp2.CFrame = Tp3    
			end
		end
    end    
})


local Tab5 = Window:MakeTab({
    Name = "脚本",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab5:AddDropdown({
    Name = "脚本",
    Default = "",
    Options = {"俄亥俄州","电脑键盘","Infinite Yield","DEX","DEX2"},
    Callback = function(Value)
        if Value == "DEX" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    	elseif Value == "Infinite Yield" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckusfm/infiniteyield-reborn/master/source"))()
		elseif Value == "电脑键盘" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))()
		elseif Value == "DEX2" then
            local loaded, dex = pcall(game.GetObjects, game, "rbxassetid://11131744262")
            if not loaded or (loaded and (not dex[1] or typeof(dex[1]) ~= "Instance")) then
                return warn(not loaded and dex or "Failed to load '11131744262'")
            end
            dex = dex[1]
            if syn and type(syn) == "table" and syn.protect_gui and type(syn.protect_gui) == "function" then
                pcall(syn.protect_gui, dex)
            end
            math.randomseed(os.clock())
            local name = ""
            for _ = 1, math.random(24, 33) do
                name = name .. string.char(math.random(33, 126))
            end
            dex.Name = name
            dex.Parent = (get_hidden_ui and get_hidden_ui()) or (gethui and gethui()) or (get_hidden_gui and get_hidden_gui()) or game:GetService("CoreGui")
            local meta = {__index = getfenv()}
            local function sandbox(v)
                task.spawn(setfenv(loadstring(v.Source, "=" .. v:GetFullName()), setmetatable({script = v}, meta)))
            end
            if dex:IsA("LuaSourceContainer") then
                sandbox(v)
            end
            for _, v in ipairs(dex:GetDescendants()) do
                if v:IsA("LuaSourceContainer") then
                    sandbox(v)
                end
            end
            return dex
        elseif Value == "俄亥俄州" then
		
        if not game:IsLoaded() then
            game.Loaded:wait(0.1)
        end
        
        local plrs = game:GetService("Players")
        local lp = plrs.LocalPlayer
        local mouse = lp:GetMouse()
        local ws = game:GetService("Workspace")
        local cg = game:GetService("CoreGui")
        local pg = lp:FindFirstChildOfClass("PlayerGui")
        local rs = game:GetService("RunService")
        local uis = game:GetService("UserInputService")
        local stepped = rs.Stepped
        local renderstepped = rs.RenderStepped
        local heartbeat = rs.Heartbeat
        local guiname = tostring((game.PlaceId - lp.UserId) / 2)
        local currentplayer = lp
        local shp = sethiddenproperty or set_hidden_property or sethiddenprop or set_hidden_prop
        local ssr = setsimulationradius or setsimradius or set_simulation_radius
        local v3 = Vector3.new
        local v3_0 = v3(0, 0, 0)
        local cf = CFrame.new
        local flycf = false
        
        local function gp(parent, name, className)
        	local ret = nil
        	pcall(function()
        		for i, v in pairs(parent:GetChildren()) do
        			if (v.Name == name) and v:IsA(className) then
        				ret = v
        				break
        			end
        		end
        	end)
        	return ret
        end
        
        local gui = gp(cg, guiname, "ScreenGui") or gp(pg, guiname, "ScreenGui")
        if gui then
        	gui:Destroy()
        end
        
        gui = Instance.new("ScreenGui")
        gui.Name = guiname
        gui.ResetOnSpawn = false
        gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        gui.Enabled = false
        gui.IgnoreGuiInset = true
        pcall(function()
            gui.Parent = cg
        end)
        if gui.Parent ~= cg then
            gui.Parent = pg
        end
        gui:GetPropertyChangedSignal("Parent"):Connect(function()
            if not (gui and gui.Parent) then
                gui = false
            end
        end)
        local mainFrame = Instance.new("Frame")
        mainFrame.Name = "mainFrame"
        mainFrame.Parent = gui
        mainFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
        mainFrame.BorderSizePixel = 0
        mainFrame.Position = UDim2.new(0, 0, 1, -200)
        mainFrame.Size = UDim2.new(1, 0, 0, 200)
        local mf = Instance.new("Frame")
        mf.Name = "mf"
        mf.Parent = mainFrame
        mf.BackgroundColor3 = mainFrame.BackgroundColor3
        mf.BorderSizePixel = 0
        mf.Position = UDim2.new(0, 0, 1, 0)
        mf.Size = UDim2.new(1, 0, 1, 0)
        local scriptName = Instance.new("TextLabel")
        scriptName.Name = "scriptName"
        scriptName.Parent = mainFrame
        scriptName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        scriptName.BackgroundTransparency = 1.000
        scriptName.BorderSizePixel = 0
        scriptName.Size = UDim2.new(1, 0, 0, 20)
        scriptName.Font = Enum.Font.SourceSans
        scriptName.Text = "FDP"
        scriptName.TextColor3 = Color3.fromRGB(181, 181, 181)
        scriptName.TextSize = 20.000
        scriptName.TextWrapped = true
        local line = Instance.new("Frame")
        line.Name = "line"
        line.Parent = scriptName
        line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        line.BackgroundTransparency = 0.700
        line.BorderSizePixel = 0
        line.Position = UDim2.new(0, 5, 1, 0)
        line.Size = UDim2.new(1, -10, 0, 1)
        local showhide = Instance.new("TextButton")
        showhide.Name = "showhide"
        showhide.Parent = mainFrame
        showhide.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
        showhide.BorderSizePixel = 0
        showhide.Position = UDim2.new(0.5, -25, 0, -30)
        showhide.Size = UDim2.new(0, 50, 0, 30)
        showhide.Font = Enum.Font.SourceSans
        showhide.Text = "\\/"
        showhide.TextColor3 = Color3.fromRGB(235, 235, 235)
        showhide.TextSize = 20.000
        local scrollingFrame = Instance.new("ScrollingFrame")
        scrollingFrame.Name = "scrollingFrame"
        scrollingFrame.Parent = mainFrame
        scrollingFrame.Active = true
        scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        scrollingFrame.BackgroundTransparency = 1.000
        scrollingFrame.BorderSizePixel = 0
        scrollingFrame.ClipsDescendants = false
        scrollingFrame.Position = UDim2.new(0, 5, 0, 30)
        scrollingFrame.Size = UDim2.new(1, -10, 1, -35)
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        scrollingFrame.ScrollBarThickness = 10
        scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.X
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = scrollingFrame
        UIListLayout.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 10)
        
        local event = Instance.new("BindableEvent", gui)
        local fps = 60
        fps = 1 / fps
        local tf = 0
        local con = nil
        con = renderstepped:Connect(function(s)
            if not gui then
        	    con:Disconnect()
        	    return
        	end
        	tf += s
        	if tf >= fps then
        		for i=1, math.floor(tf / fps) do
        			event:Fire(true)
        		end
        		tf = 0
        	end
        end)
        local event = event.Event
        
        local sn = scriptName.Text
        local function notify(msg)
        	spawn(function()
        		local msg1 = sn .. " - " .. msg
        		scriptName.Text = msg1
        		wait(3)
        		if scriptName.Text == msg1 then
        			scriptName.Text = sn
        		end
        	end)
        end
        
        if gui.Parent == pg then
            notify("gui in playerGui")
        end
        
        local ancprt = nil
        local function weldtp(part, cfr)
        	if not (part and part.Parent and part:IsA("BasePart") and (not part:IsGrounded())) then
        		return nil
        	end
        	if not (ancprt and ancprt.Parent and ancprt:IsA("BasePart") and ancprt:IsGrounded() and ancprt:IsDescendantOf(ws)) then
        		for i, v in pairs(ws:GetDescendants()) do
        			if v and v.Parent and v:IsA("BasePart") and v:IsGrounded() then
        				ancprt = v
        				break
        			end
        		end
        	end
        	if not ancprt then
        		ancprt = Instance.new("Part", ws)
        		ancprt.Anchored = true
        		ancprt.Transparency = 1
        		ancprt.CanCollide = false
        		ancprt.Name = "weldtp part"
        	end
        	local weld = Instance.new("Weld")
        	weld.Part0 = part
        	weld.C0 = cfr:Inverse()
        	weld.Part1 = ancprt
        	weld.C1 = ancprt.CFrame:Inverse()
        	weld.Parent = ws
        	stepped:wait(0.1)
        	pcall(function()
        		weld:Destroy()
        	end)
        end
        
        local function makeFrame(parent, text, color)
        	local frame = Instance.new("Frame")
        	frame.Name = "frame_" .. text
        	frame.Parent = parent
        	frame.BackgroundColor3 = color
        	frame.Size = UDim2.new(0, 300, 0, 145)
        	frame.BorderSizePixel = 0
        	local framelabel = Instance.new("TextLabel")
        	framelabel.Name = "framelabel"
        	framelabel.Parent = frame
        	framelabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	framelabel.BackgroundTransparency = 1.000
        	framelabel.BorderSizePixel = 0
        	framelabel.Size = UDim2.new(1, 0, 0, 20)
        	framelabel.Font = Enum.Font.SourceSans
        	framelabel.Text = text
        	framelabel.TextColor3 = Color3.fromRGB(223, 223, 223)
        	framelabel.TextSize = 14.000
        	local line = Instance.new("Frame")
        	line.Name = "line"
        	line.Parent = framelabel
        	line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	line.BackgroundTransparency = 0.700
        	line.BorderSizePixel = 0
        	line.Position = UDim2.new(0, 5, 1, 0)
        	line.Size = UDim2.new(1, -10, 0, 1)
        	local ScrollingFrame = Instance.new("ScrollingFrame")
        	ScrollingFrame.Parent = frame
        	ScrollingFrame.Active = true
        	ScrollingFrame.Name = "ScrollingFrame"
        	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	ScrollingFrame.BackgroundTransparency = 1.000
        	ScrollingFrame.BorderSizePixel = 0
        	ScrollingFrame.Position = UDim2.new(0, 5, 0, 25)
        	ScrollingFrame.Size = UDim2.new(1, -5, 1, -30)
        	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        	ScrollingFrame.ScrollBarThickness = 7
        	ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        	local UIListLayout = Instance.new("UIListLayout")
        	UIListLayout.Parent = ScrollingFrame
        	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        	UIListLayout.Padding = UDim.new(0, 5)
        	return frame
        end
        
        showhide.MouseButton1Click:Connect(function()
        	if showhide.Text == "/\\" then
        		showhide.Text = "\\/"
        		mainFrame:TweenPosition(UDim2.new(0, 0, 1, -200), "Out", "Elastic", 1)
        	else
        		showhide.Text = "/\\"
        		mainFrame:TweenPosition(UDim2.new(0, 0, 1, -5), "Out", "Elastic", 1)
        	end
        end)
        
        local controllable = {}
        local lastc = nil
        local con = nil
        con = lp.CharacterAdded:Connect(function(c)
            if not gui then
                con:Disconnect()
                return
            end
            if lastc == c then
                return
            end
            if c and c.Parent then
                lastc = c
                controllable = {}
                for i, v in pairs(plrs:GetPlayers()) do
                    local c = v.Character
                    if c and c.Parent then
                        table.insert(controllable, c)
                    end
                end
            end
        end)
        
        local viewedPlayer = nil
        
        local playersframe = makeFrame(scrollingFrame, "玩家", Color3.fromRGB(53, 53, 100))
        local playercframe = makeFrame(playersframe, "playerscontrol", Color3.fromRGB(53, 53, 100))
        playercframe.BorderSizePixel = 1.000
        playercframe.BorderColor3 = Color3.fromRGB(27, 42, 53)
        playercframe.Position = UDim2.new(0, 10, -1, -40)
        playercframe.BackgroundColor3 = Color3.fromRGB(53, 53, 100)
        playercframe.Visible = true
        local playerframef = makeFrame(playercframe, "friends", Color3.fromRGB(53, 53, 100))
        playerframef.Position = UDim2.new(1, 10, 0, 5)
        
        local function addbtn(parent, plr)
        	local playerbutton = Instance.new("TextButton")
        	playerbutton.Name = plr.Name
        	playerbutton.Parent = parent
        	if plr == lp then
        		playerbutton.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
        	else
        		playerbutton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        	end
        	playerbutton.BorderSizePixel = 0
        	playerbutton.Size = UDim2.new(1, -10, 0, 20)
        	playerbutton.Font = Enum.Font.SourceSans
        	playerbutton.Text = plr.Name
        	if plr.Name ~= plr.DisplayName then
        		playerbutton.Text = "昵称：" .. plr.DisplayName .. " 用户名：" .. playerbutton.Text
        	end
        	playerbutton.TextColor3 = Color3.fromRGB(223, 223, 223)
        	playerbutton.TextSize = 15.000
        	playerbutton.MouseButton1Click:Connect(function()
        		playercframe.framelabel.Text = "" .. playerbutton.Text
        		currentplayer = plr
        		playercframe.Visible = true
        		playerframef.Visible = false
        		viewbutton.Text = ((viewedPlayer == plr) and "退出监视") or "监视"
        	end)
        end
        
        local function unview()
            viewedPlayer = nil
            viewbutton.Text = "监视"
        	local c = lp.Character
        	if c and c.Parent then
        	    local subject = c:FindFirstChildOfClass("Humanoid") or c:FindFirstChildWhichIsA("BasePart")
        	    if subject then
            	    ws.CurrentCamera.CameraType = Enum.CameraType.Custom
            		ws.CurrentCamera.CameraSubject = subject
        		else
        		    notify("no part to view")
        		end
        	else
        		notify("character not found")
        	end
        end
        
        local playersScroll = playersframe.ScrollingFrame
        
        for i, v in pairs(plrs:GetPlayers()) do
        	addbtn(playersScroll, v)
        end
        local reset = function() end
        local con = nil
        con = plrs.PlayerAdded:Connect(function(plr)
        	if gui then
        		addbtn(playersScroll, plr)
        	else
        	    con:Disconnect()
        	end
        end)
        local con = nil
        con = plrs.PlayerRemoving:Connect(function(plr)
        	if gui then
        		local playerbutton = gp(playersScroll, plr.Name, "TextButton")
        		if playerbutton then
        			playerbutton:Destroy()
        		end
        		if plr == currentplayer then
        			playercframe.Visible = false
        		end
        		if plr == viewedPlayer then
        		    unview()
        		end
        	else
        	    con:Disconnect()
        	end
        end)
        local hideplayerc = Instance.new("TextButton")
        hideplayerc.Name = "addpositionbutton"
        hideplayerc.Parent = playercframe.framelabel
        hideplayerc.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
        hideplayerc.BorderSizePixel = 0
        hideplayerc.Position = UDim2.new(1, -17, 0, 2)
        hideplayerc.Size = UDim2.new(0, 15, 0, 15)
        hideplayerc.Font = Enum.Font.SourceSans
        hideplayerc.Text = "X"
        hideplayerc.TextColor3 = Color3.fromRGB(223, 223, 223)
        hideplayerc.TextSize = 14.000
        hideplayerc.MouseButton1Click:Connect(function()
        	playercframe.Visible = false
        end)
        local function makeplrbutton(buttontext)
        	local button = Instance.new("TextButton")
        	button.Name = "plrButton"
        	button.Parent = playercframe.ScrollingFrame
        	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        	button.BorderSizePixel = 0
        	button.Size = UDim2.new(1, -10, 0, 20)
        	button.Font = Enum.Font.SourceSans
        	button.Text = buttontext
        	button.TextColor3 = Color3.fromRGB(223, 223, 223)
        	button.TextSize = 15.000
        	return button
        end
        makeplrbutton("传送（快捷键：T）").MouseButton1Click:Connect(function()
        
        		local c = lp.Character
        		local UserInputService = game:GetService("UserInputService")
        
        		UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
        			if input.KeyCode == Enum.KeyCode.T then
        				if c and c.Parent then
        					local tp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
        					if tp then
        						local c1 = currentplayer.Character
        						if c1 and c1.Parent then
        							local to = gp(c1, "HumanoidRootPart", "BasePart") or gp(c1, "Head", "BasePart") or c1:FindFirstChildWhichIsA("BasePart")
        							if to then
        								if flycf then
        									flycf = to.CFrame
        								else
        									weldtp(tp, to.CFrame)
        								end
        								notify("goto: " .. currentplayer.Name)
        							else
        								notify("no target part found")
        							end
        						else
        							notify("target character not found")
        						end
        					else
        						notify("no part found")
        					end
        				else
        					notify("character not found")
        				end
        			end
        		end)
        		if c and c.Parent then
        			local tp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
        			if tp then
        				local c1 = currentplayer.Character
        				if c1 and c1.Parent then
        					local to = gp(c1, "HumanoidRootPart", "BasePart") or gp(c1, "Head", "BasePart") or c1:FindFirstChildWhichIsA("BasePart")
        					if to then
        						if flycf then
        							flycf = to.CFrame
        						else
        							weldtp(tp, to.CFrame)
        						end
        						notify("goto: " .. currentplayer.Name)
        					else
        						notify("no target part found")
        					end
        				else
        					notify("target character not found")
        				end
        			else
        				notify("no part found")
        			end
        		else
        			notify("character not found")
        		end
        	end)
        viewbutton = makeplrbutton("监视")
        viewbutton.MouseButton1Click:Connect(function()
            if viewedPlayer == currentplayer then
                unview()
            else
        	    viewedPlayer = currentplayer
        	    viewbutton.Text = "退出监视"
        	end
        end)
        
        local cbringb = makeplrbutton("把他传送过来")
        
        local function noanimations()
        	local c = lp.Character
        	if c and c.Parent then
        		local hum = c:FindFirstChildOfClass("Humanoid")
        		if hum then
        			local animate = gp(c, "Animate", "LocalScript")
        			if animate then
        				animate.Disabled = true
        			end
        			for i, v in pairs(hum:GetPlayingAnimationTracks()) do
        				v:Stop()
        			end
        		else
        			notify("humanoid not found")
        		end
        	else
        		notify("character not found")
        	end
        end
        
        local function isConnected(part0, part1, tested)
            if not ((typeof(part0) == "Instance") and part0:IsA("BasePart")) then
                return false
            end
            if not ((typeof(part1) == "Instance") and part1:IsA("BasePart")) then
                return false
            end
            if not tested then
                tested = {}
            end
            local ret = false
            table.insert(tested, part0)
            for i, v in pairs(part0:GetConnectedParts()) do
                if part1 == v then
                    return true
                elseif not table.find(tested, v) then
                    ret = ret or isConnected(v, part1, tested)
                end
            end
            return ret
        end
        
        local function attach(c1)
            local bck = lp:FindFirstChildOfClass("Backpack")
        	local c = lp.Character
        	--checks for: model, humanoid, arm, torso for main character:
        	if not (c and c.Parent) then
        	    notify("character not found")
        	    return false
        	end
        	local hum = c:FindFirstChildOfClass("Humanoid")
        	if not hum then
        	    notify("humanoid not found")
        	    return false
        	end 
        	local arm = gp(c, "Right Arm", "BasePart") or gp(c, "RightHand", "BasePart")
        	if not arm then
        	    notify("arm not found")
        	    return false
        	end
        	local torso = gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart")
        	if not torso then
        	    notify("torso not found")
        	    return
        	end
        	if torso:IsGrounded() then
        	    notify("torso is grounded")
        	    return
        	end
        	if not isConnected(arm, torso) then
        	    notify("arm and toso not connected")
        	    return
        	end
        	--checks for: tool:
        	local tool = c:FindFirstChildOfClass("Tool")
        	if (not tool) and bck then
        		tool = bck:FindFirstChildOfClass("Tool")
        	end
        	if not tool then
        	    notify("no tool found")
        	    return false
        	end
        	local handle = gp(tool, "Handle", "BasePart")
        	if not handle then
        	    notify("tool handle not found")
        	    return
        	end
        	--checks for: model, humanoid, arm, torso for target character:
        	if not (c1 and c1.Parent) then
        	    notify("target character not found")
        	    return false
        	end
        	local hum1 = c1:FindFirstChildOfClass("Humanoid")
        	if not hum1 then
        	    notify("target humanoid not found")
        	    return false
        	end
        	local arm1 = gp(c1, "Right Arm", "BasePart") or gp(c1, "RightHand", "BasePart")
        	if not arm1 then
        	    notify("target arm not found")
        	    return false
        	end
        	local torso1 = gp(c1, "Torso", "BasePart") or gp(c1, "UpperTorso", "BasePart")
        	if not torso1 then
        	    notify("target torso not found")
        	    return
        	end
        	if torso1:IsGrounded() then
        	    notify("target torso is grounded")
        	    return
        	end
        	if not isConnected(arm1, torso1) then
        	    notify("target arm and toso not connected")
        	    return
        	end
        	--all checks good
        	if bck then
            	for i, v in pairs(c:GetChildren()) do
            	    if v:IsA("Tool") then
            	        v.Parent = bck
            	    end
            	end
        	end
        	local nhum = hum:Clone()
        	hum:Destroy()
        	hum = nhum
        	hum.Parent = c
        	hum:EquipTool(tool)
        	for i, v in pairs(c1:GetDescendants()) do
        		if v and v.Parent and v:IsA("BasePart") then
        			v.Massless = true
        		end
        	end
        	while stepped:wait(0.1) do
        	    --checks for: model, humanoid, arm, torso for main character:
        	    if not (c and c.Parent) then
        	        notify("character removed")
        	        return false
        	    end
        	    if (not hum and hum.Parent) then
        	        notify("humanoid removed")
        	        return false
        	    end
        	    if not (arm and arm.Parent) then
        	        notify("arm removed")
        	        return false
        	    end
        	    if not (torso and torso.Parent) then
        	        notify("torso removed")
        	        return false
        	    end
        	    if torso:IsGrounded() then
            	    notify("torso got grounded")
            	    return
            	end
        	    if not isConnected(arm, torso) then
            	    notify("arm and toso connection removed")
            	    return
            	end
        	    --checks for: model, humanoid, arm, torso for target character:
        	    if not (c1 and c1.Parent) then
        	        notify("target character removed")
        	        return false
        	    end
        	    if not (hum1 and hum1.Parent) then
        	        notify("target humanoid removed")
        	        return false
        	    end
        	    if not (arm1 and arm1.Parent) then
        	        notify("target arm removed")
        	        return false
        	    end
        	    if not (torso1 and torso1.Parent) then
        	        notify("target torso removed")
        	        return false
        	    end
        	    if torso:IsGrounded() then
                    notify("target torso got grounded")
                    return
                end
        	    if not isConnected(arm1, torso1) then
            	    notify("target arm and toso connection removed")
            	    return
            	end
            	--checks for: tool
        	    if not (tool and tool.Parent) then
        	        notify("tool removed")
        	        return false
        	    end
        	    if not (handle and handle.Parent) then
        	        notify("tool handle removed")
        	        return false
        	    end
        	    if (tool.Parent ~= c) and (tool.Parent ~= c1) and (tool.Parent ~= bck) then
        	        notify("unexpected tool parent")
        	        return false
        	    end
        	    --all checks good
        	    if (tool.Parent == c1) then
        	        break
        	    end
        	    tool.Parent = c
        	    weldtp(arm1, handle.CFrame)
        	    if (tool.Parent == c1) then
        	        break
        	    end
        	end
        	return handle
        end
        
        makeplrbutton("查看本服好友").MouseButton1Click:Connect(function()
        	playerframef.Visible = not playerframef.Visible
        	if not playerframef.Visible then
        		return
        	end
        	playerframef.framelabel.Text = "查看本服好友：" .. currentplayer.Name
        	local scroll = playerframef.ScrollingFrame
        	for i, v in pairs(scroll:GetChildren()) do
        		if v and v.Parent and v:IsA("TextButton") then
        			v:Destroy()
        		end
        	end
        	for i, v in pairs(plrs:GetPlayers()) do
        		spawn(function()
        			if v and v.Parent and currentplayer:IsFriendsWith(v.UserId) then
        				addbtn(playerframef.ScrollingFrame, v)
        			end
        		end)
        	end
        end)
        
        local positionsframe = makeFrame(scrollingFrame, "位置", Color3.fromRGB(53, 53, 100))
        local addpositionbutton = Instance.new("TextButton")
        addpositionbutton.Name = "addpositionbutton"
        addpositionbutton.Parent = positionsframe.framelabel
        addpositionbutton.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
        addpositionbutton.BorderSizePixel = 0
        addpositionbutton.Position = UDim2.new(1, -77, 0, 2)
        addpositionbutton.Size = UDim2.new(0, 75, 1, -4)
        addpositionbutton.Font = Enum.Font.SourceSans
        addpositionbutton.Text = "+添加"
        addpositionbutton.TextColor3 = Color3.fromRGB(206, 206, 206)
        addpositionbutton.TextSize = 14.000
        addpositionbutton.MouseButton1Click:Connect(function()
        	local c = lp.Character
        	if c and c.Parent then
        		local hrp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
        		if hrp then
        			local cfr = hrp.CFrame
        			local positionframe = Instance.new("Frame")
        			local loadposbutton = Instance.new("TextButton")
        			local removeposbutton = Instance.new("TextButton")
        			local positionName = Instance.new("TextBox")
        			positionframe.Name = "positionframe"
        			positionframe.Parent = positionsframe.ScrollingFrame
        			positionframe.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
        			positionframe.BorderSizePixel = 0
        			positionframe.Size = UDim2.new(1, -10, 0, 30)
        			loadposbutton.Name = "loadposbutton"
        			loadposbutton.Parent = positionframe
        			loadposbutton.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
        			loadposbutton.BorderSizePixel = 0
        			loadposbutton.Position = UDim2.new(1, -70, 0, 5)
        			loadposbutton.Size = UDim2.new(0, 40, 1, -10)
        			loadposbutton.Font = Enum.Font.SourceSans
        			loadposbutton.Text = "load"
        			loadposbutton.TextColor3 = Color3.fromRGB(223, 223, 223)
        			loadposbutton.TextSize = 16.000
        			removeposbutton.Name = "removeposbutton"
        			removeposbutton.Parent = positionframe
        			removeposbutton.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
        			removeposbutton.BorderSizePixel = 0
        			removeposbutton.Position = UDim2.new(1, -25, 0, 5)
        			removeposbutton.Size = UDim2.new(0, 20, 1, -10)
        			removeposbutton.Font = Enum.Font.SourceSans
        			removeposbutton.Text = "X"
        			removeposbutton.TextColor3 = Color3.fromRGB(223, 223, 223)
        			removeposbutton.TextSize = 16.000
        			positionName.Name = "positionName"
        			positionName.Parent = positionframe
        			positionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        			positionName.BackgroundTransparency = 1.000
        			positionName.BorderSizePixel = 0
        			positionName.Position = UDim2.new(0, 5, 0, 5)
        			positionName.Size = UDim2.new(1, -80, 1, -10)
        			positionName.Font = Enum.Font.SourceSans
        			positionName.Text = "Position1"
        			positionName.ClearTextOnFocus = false
        			positionName.TextColor3 = Color3.fromRGB(0, 0, 0)
        			positionName.TextSize = 25.000
        			positionName.TextXAlignment = Enum.TextXAlignment.Left
        			loadposbutton.MouseButton1Click:Connect(function()
        				c = lp.Character
        				if c and c.Parent then
        					hrp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
        					if hrp then
        						if flycf then
        							flycf = cfr
        						else
        							weldtp(hrp, cfr)
        						end
        					else
        						notify("part not found")
        					end
        				else
        					notify("character not found")
        				end
        			end)
        			removeposbutton.MouseButton1Click:Connect(function()
        				positionframe:Destroy()
        			end)
        		end
        	end
        end)
        
        local charframe = makeFrame(scrollingFrame, "功能", Color3.fromRGB(53, 53, 100))
        local function makecharbutton(buttontext)
        	local button = Instance.new("TextButton")
        	button.Name = "charButton"
        	button.Parent = charframe.ScrollingFrame
        	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        	button.BorderSizePixel = 0
        	button.Size = UDim2.new(1, -10, 0, 20)
        	button.Font = Enum.Font.SourceSans
        	button.Text = buttontext
        	button.TextColor3 = Color3.fromRGB(226, 226, 226)
        	button.TextSize = 15.000
        	return button
        end
        local function respawnRequest()
        	local ccfr = ws.CurrentCamera.CFrame
        	local c = lp.Character
        	lp.Character = nil
        	lp.Character = c
        	ws.CurrentCamera:GetPropertyChangedSignal("CFrame"):wait(0.1)
        	ws.CurrentCamera.CFrame = ccfr
        end
        local loopr = false
        local fakevoidp = nil
        reset = function(respawn)
            if fakevoidp then
                fakevoidp = nil
                wait(0.3)
            end
        	local c = lp.Character
        	local partName, cfr, ccfr = nil, nil, nil
        	if not (c and c.Parent) then
        		respawnRequest()
        		if not loopr then
        			notify("character not found, trying to respawn")
        		end
        		return
        	end
        	local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
        	if not part then
        	    respawnRequest()
        		if not loopr then
        			notify("no part found in the character, trying to respawn")
        		end
        		return
        	end
        	partName, cfr, ccfr = part.Name, part.CFrame, ws.CurrentCamera.CFrame
        	spawn(function()
        		local c, part = c, nil
        		while c and c.Parent do
        			stepped:wait(0.1)
        		end
        		while not (c and c.Parent) do
        			stepped:wait(0.1)
        			c = lp.Character
        		end
        		while stepped:wait(0.1) and c and c.Parent and (not part) do
        			part = gp(c, partName, "BasePart")
        		end
        		if not part then
        			if not loopr then
        				notify("failed to tp back")
        			end
        			return
        		end
        		weldtp(part, cfr)
        		ws.CurrentCamera.CFrame = ccfr
        		cfr = false
        		if not loopr then
        			notify("respawned")
        		end
        	end)
        	if respawn and (not loopr) then
        		notify("respawning...")
        	end
        	if respawn and (plrs.RespawnTime > 0.5) then
        		spawn(function()
        			while c and c.Parent do
        				if part and part.Parent then
        					cfr = part.CFrame
        				end
        				ccfr = ws.CurrentCamera.CFrame
        				stepped:wait(0.1)
        			end
        		end)
        		local spamrequest = true
        		spawn(function()
        			while wait(0.1) and spamrequest and c and c.Parent do
        				respawnRequest()
        			end
        		end)
        		wait(0.3)
        		spamrequest = false
        		wait(plrs.RespawnTime - 0.5)
        		part = nil
        	end
        	if c and c.Parent then
        		if respawn then
        			local hum = c:FindFirstChildOfClass("Humanoid")
        			if hum then
        				hum:Destroy()
        			end
        		end
        		c:BreakJoints()
        		while respawn and gui and cfr do
        	        stepped:wait(0.1)
        	    end
        	end
        end
        makecharbutton("秒开银行").MouseButton1Click:Connect(function()
            while true do
        	    wait(1)
        	    game.Workspace.BankRobbery.VaultDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
                game.Workspace.BankRobbery.BankCash.Main.Attachment.ProximityPrompt.MaxActivationDistance= 20
        	end
        end)
        makecharbutton("秒开金保险").MouseButton1Click:Connect(function()
        		while true do
        			wait(1)
        			local safe = game.workspace.Game.Entities.GoldJewelSafe.GoldJewelSafe
        			safe.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
        			safe.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.MaxActivationDistance= 20
        			safe.Name = "safeopen"
        		end
        	end)
        makecharbutton("秒开黑保险").MouseButton1Click:Connect(function()
        	while true do
        		wait(1)
        		local safe2 = game.workspace.Game.Entities.JewelSafe.JewelSafe
        		safe2.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
        		safe.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.MaxActivationDistance= 20
        		safe2.Name = "safeopen"
        	end
        end)
        makecharbutton("秒拿空投").MouseButton1Click:Connect(function()
        	while true do
        		wait(1)
        		game:GetService("Workspace").Game.Airdrops.Airdrop.Airdrop.ProximityPrompt.HoldDuration = 0
        		game:GetService("Workspace").Game.Airdrops.Airdrop.Airdrop.ProximityPrompt.MaxActivationDistance= 20
        		game:GetService("Workspace").Game.Airdrops.Airdrop.Airdrop.Name = "airdropopen"
        	end
        end)
        makecharbutton("秒拿珠宝").MouseButton1Click:Connect(function()
            local rocks = game:GetService("Workspace").GemRobbery.JewelryCases.HighYieldSpawns
            for _, obj in pairs(rocks:GetChildren()) do
                if obj.ClassName == "Model" then
                    for _, innerObj in pairs(obj:GetChildren()) do
                        if innerObj.ClassName == "Model" then
                            if innerObj.Name == "Case" then
                            elseif innerObj.Name == "Emerald" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            elseif innerObj.Name == "Sapphire" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            elseif innerObj.Name == "Amethyst" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            elseif innerObj.Name == "Topaz" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end                     
                            elseif innerObj.Name == "Diamond" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            elseif innerObj.Name == "Gold Bar" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            elseif innerObj.Name == "Ruby" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            else
                                if innerObj:FindFirstChild("Box") and innerObj.Box:FindFirstChild("ProximityPrompt") then
                                    innerObj.Box.ProximityPrompt.HoldDuration = 0
                                end
                            end
                        end
                    end
                end
            end
            local rocks2 = game:GetService("Workspace").GemRobbery.JewelryCases.LowYieldSpawns
            for _, obj in pairs(rocks2:GetChildren()) do
                if obj.ClassName == "Model" then
                    for _, innerObj in pairs(obj:GetChildren()) do
                        if innerObj.ClassName == "Model" then
                            if innerObj.Name == "Case" then
                            elseif innerObj.Name == "Emerald" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            elseif innerObj.Name == "Sapphire" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            elseif innerObj.Name == "Amethyst" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            elseif innerObj.Name == "Topaz" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            elseif innerObj.Name == "Diamond" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            elseif innerObj.Name == "Gold Bar" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            elseif innerObj.Name == "Ruby" then
                                if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                    innerObj.Handle.ProximityPrompt.HoldDuration = 0
                                end
                            else
                                if innerObj:FindFirstChild("Box") and innerObj.Box:FindFirstChild("ProximityPrompt") then
                                    innerObj.Box.ProximityPrompt.HoldDuration = 0
                                end
                            end
                        end
                    end
                end
            end
        	end)
        
            local Dealer1 = makecharbutton("远程黑市")
            local Dealer1t = false
            Dealer1.MouseButton1Click:Connect(function()
            if Dealer1t == false then
                   Dealer1t = true
                Dealer1.Text = "远程黑市(开)"
                game:GetService("Workspace").BlackMarket.Dealer.Dealer.ProximityPrompt.MaxActivationDistance = 100000
            else
                Dealer1t = false
                Dealer1.Text = "远程黑市"
                game:GetService("Workspace").BlackMarket.Dealer.Dealer.ProximityPrompt.MaxActivationDistance = 20
            end
        end)
        
        makecharbutton("秒用弹药箱").MouseButton1Click:Connect(function()
        	for i = 1 , 50 do
        		local Ammo = game.workspace.Game.Local.droppables["Ammo Box"]
        		Ammo.Handle.ProximityPrompt.HoldDuration = 0
        		Ammo.Name = "Ammo"
        	end
        end)
        	makecharbutton("原皮枪连发无后座").MouseButton1Click:Connect(function()
        		while true do
                    wait(1)
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Raygun") then
                        if game.ReplicatedStorage.Models.Items.Raygun.Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items.Raygun.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("M1911") then
                        if game.ReplicatedStorage.Models.Items.M1911.Handle.Muzzle:FindFirstChild("PointLight") then
                           game.ReplicatedStorage.Models.Items.M1911.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Scar L") then
                        if game.ReplicatedStorage.Models.Items["Scar L"].Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items["Scar L"].Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Glock") then
                        if game.ReplicatedStorage.Models.Items.Glock.Handle.Muzzle:FindFirstChild("PointLight") then
                        game.ReplicatedStorage.Models.Items.Glock.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Mossberg") then
                        if game.ReplicatedStorage.Models.Items.Mossberg.Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items.Mossberg.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("RPG") then
                        if game.ReplicatedStorage.Models.Items.RPG.Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items.RPG.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("USP 45") then
                        if game.ReplicatedStorage.Models.Items["USP 45"].Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items["USP 45"].Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Sawn Off") then
                        if game.ReplicatedStorage.Models.Items["Sawn Off"].Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items["Sawn Off"].Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Minigun") then
                        if game.ReplicatedStorage.Models.Items.Minigun.Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items.Minigun.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Stagecoach") then
                        if game.ReplicatedStorage.Models.Items.Stagecoach.Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items.Stagecoach.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Deagle") then
                        if game.ReplicatedStorage.Models.Items.Deagle.Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items.Deagle.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("RPK") then
                        if game.ReplicatedStorage.Models.Items.RPK.Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items.RPK.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Glock 18") then
                        if game.ReplicatedStorage.Models.Items["Glock 18"].Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items["Glock 18"].Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("AK-47") then
                        if game.ReplicatedStorage.Models.Items["AK-47"].Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items["AK-47"].Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Tommy Gun") then
                        if game.ReplicatedStorage.Models.Items["Tommy Gun"].Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items["Tommy Gun"].Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("M4A1") then
                        if game.ReplicatedStorage.Models.Items.M4A1.Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items.M4A1.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Uzi") then
                        if game.ReplicatedStorage.Models.Items.Uzi.Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items.Uzi.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("MP7") then
                        if  game.ReplicatedStorage.Models.Items.MP7.Handle.Muzzle:FindFirstChild("PointLight") then
                        game.ReplicatedStorage.Models.Items.MP7.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                    if game.ReplicatedStorage.Models.Items:FindFirstChild("Python") then
                        if  game.ReplicatedStorage.Models.Items.Python.Handle.Muzzle:FindFirstChild("PointLight") then
                            game.ReplicatedStorage.Models.Items.Python.Handle.Muzzle.PointLight.Name = "PointLight1"
                        end
                    end
                end
        	end)
        makecharbutton("快捷储物柜(快捷:Z)").MouseButton1Click:Connect(function()
        	game:GetService("Players").LocalPlayer.PlayerGui.Backpack.Holder.Locker.Visible = true
        end)
        local hitbox123 = makecharbutton("近战范围")
        local hitbox123t = false
        hitbox123.MouseButton1Click:Connect(function()
            if hitbox123t == false then
                hitbox123t = true
                hitbox123.Text = "近战范围(开)"
                _G.HeadSize = 40
        		_G.Disabled = true
        		game:GetService("RunService").RenderStepped:connect(function()
        			if _G.Disabled then
        				for i,v in next, game:GetService("Players"):GetPlayers() do
        					if v.Name ~= game:GetService("Players").LocalPlayer.Name then
        						pcall(function()
        							v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
        							v.Character.HumanoidRootPart.Transparency = 0.7
        							v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
        							v.Character.HumanoidRootPart.Material = "Neon"
        							v.Character.HumanoidRootPart.CanCollide = false
        						end)
        					end
        				end
        			end
        		end)
            else
                hitbox123t = false
                hitbox123.Text = "近战范围"
                _G.HeadSize = 1
            end
        end)
        local espitem = makecharbutton("透视物品")
        local espitemt = false
        espitem.MouseButton1Click:Connect(function()
            if espitemt == false then
                espitemt = true
                espitem.Text = "透视物品(开)"
            else
                espitemt = false
                espitem.Text = "透视物品"
            end
            while espitemt == true do
        	wait(1)
                for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                    for i,v in pairs(l:GetChildren()) do
                         if v.ClassName == "MeshPart" or "Part" then
                            for i,e in pairs(v:GetChildren()) do
                                if e.ClassName == "ProximityPrompt" then
                                    if e.ObjectText == "Military Armory Keycard" or e.ObjectText == "Airdrop Marker" or e.ObjectText == "Diamond Ring" or e.ObjectText == "Money Printer" or e.ObjectText == "Diamond" or e.ObjectText == "Void Gem" or e.ObjectText == "Dark Matter Gem" or e.ObjectText == "Gold AK-47" or e.ObjectText == "Gold Deagle" or e.ObjectText == "Police Armory Keycard" or e.ObjectText == "Electronics" or e.ObjectText == "Weapon Parts" or e.ObjectText == "Rollie" then
                                        xd = Instance.new("BillboardGui")
                                        xd.Parent = v
                                        xd.AlwaysOnTop = true
                                        xd.Size = UDim2.new(0, 100, 0, 25)
                                        Frame = Instance.new("Frame")
                                        Frame.Parent = xd
                                        Frame.BackgroundColor3 = Color3.new(0, 255, 255)
                                        Frame.Size = UDim2.new(1, 0, 1, 0)
                                        Frame.BackgroundTransparency = 1
                                        text = Instance.new("TextLabel")
                                        text.TextScaled = true
                                        text.BackgroundColor3 = Color3.new(0, 255, 255)
                                        text.Parent = Frame
                                        text.Text = e.ObjectText
                                        text.Size = UDim2.new(1, 0, 1, 0)
                                        text.BackgroundTransparency = 1
                                        text.TextColor3 = Color3.new(0, 255, 255)
                                    end
                                end    
                            end
                        end
                     end
                end
        		wait(5)
        		for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                    for i,v in pairs(l:GetChildren()) do
                         if v.ClassName == "MeshPart" or "Part" then
                            for i,e in pairs(v:GetChildren()) do
                                if e.ClassName == "ProximityPrompt" then
                                    if e.ObjectText == "Military Armory Keycard" or e.ObjectText == "Airdrop Marker" or e.ObjectText == "Diamond Ring" or e.ObjectText == "Money Printer" or e.ObjectText == "Diamond" or e.ObjectText == "Void Gem" or e.ObjectText == "Dark Matter Gem" or e.ObjectText == "Gold AK-47" or e.ObjectText == "Gold Deagle" or e.ObjectText == "Police Armory Keycard" or e.ObjectText == "Electronics" or e.ObjectText == "Weapon Parts"then
                                        xd:Remove()
                                    end
                                end    
                            end
                        end
                     end
                end
            end
        end)
        local noclipb = makecharbutton("穿墙")
        local noclip = false
        local antifling = false
        noclipb.MouseButton1Click:Connect(function()
        	noclip = not noclip
        	noclipb.Text = "穿墙" .. ((noclip and " (开)") or "")
        end)
        local infjumpb = makecharbutton("连跳")
        local infjump = false
        local con = nil
        con = game:GetService("UserInputService").JumpRequest:Connect(function()
        	if not gui then
        	    con:Disconnect()
        	    return
        	end
        	if infjump then
        		local c = lp.Character
        		if c and c.Parent then
        			local hum = c:FindFirstChildOfClass("Humanoid")
        			if hum then
        				hum:ChangeState("Jumping")
        			end
        		end
        	end
        end)
        
        infjumpb.MouseButton1Click:Connect(function()
        	infjump = not infjump
        	infjumpb.Text = "连跳" .. ((infjump and "(开)") or "")
        end)
        
        local ctrltp = false
        local clicktpbutton = makecharbutton("按住CRTL时点击传送")
        clicktpbutton.MouseButton1Click:Connect(function()
            ctrltp = not ctrltp
            clicktpbutton.Text = "按住CRTL时点击传送" .. ((ctrltp and " (开)") or "")
        end)
        local con = nil
        con = mouse.Button1Down:Connect(function()
            if not gui then
                con:Disconnect()
                return
            end
            if not ctrltp then
                return
            end
            if not (mouse.Target and uis:IsKeyDown(Enum.KeyCode.LeftControl)) then
                return
            end
            local to = mouse.Hit.Position + v3(0, 3, 0)
            to = cf(to, to + v3(-1, 0, -1) * ws.CurrentCamera.CFrame.LookVector)
            if flycf then
                flycf = to
                return
            end
            local c = lp.Character
            if not (c and c.Parent) then
                return
            end
            local hrp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
            if hrp then
                weldtp(hrp, to)
            end
        end)
        makecharbutton("按X隐身").MouseButton1Click:Connect(function()
            -- Roblox Invisibility Toggle Script
        
            -- Also by the way, if you press "E" on your keyboard, You will become invisible to other players, but on your screen, you will still be able to see yourself to make it easier.
        
        
            --Settings:
            local ScriptStarted = false
            local Keybind = "X" --Set to whatever you want, has to be the name of a KeyCode Enum.
            local Transparency = true --Will make you slightly transparent when you are invisible. No reason to disable.
            local NoClip = false --Will make your fake character no clip.
        
            local Player = game:GetService("Players").LocalPlayer
            local RealCharacter = Player.Character or Player.CharacterAdded:wait(0.1)
        
            local IsInvisible = false
        
            RealCharacter.Archivable = true
            local FakeCharacter = RealCharacter:Clone()
            local Part
            Part = Instance.new("Part", workspace)
            Part.Anchored = true
            Part.Size = Vector3.new(200, 1, 200)
            Part.CFrame = CFrame.new(0, -500, 0) --Set this to whatever you want, just far away from the map.
            Part.CanCollide = true
            FakeCharacter.Parent = workspace
            FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
        
            for i, v in pairs(RealCharacter:GetChildren()) do
                if v:IsA("LocalScript") then
                    local clone = v:Clone()
                    clone.Disabled = true
                    clone.Parent = FakeCharacter
                end
            end
            if Transparency then
                for i, v in pairs(FakeCharacter:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 0.7
                    end
                end
            end
            local CanInvis = true
            function RealCharacterDied()
                CanInvis = false
                RealCharacter:Destroy()
                RealCharacter = Player.Character
                CanInvis = true
                isinvisible = false
                FakeCharacter:Destroy()
                workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
        
                RealCharacter.Archivable = true
                FakeCharacter = RealCharacter:Clone()
                Part:Destroy()
                Part = Instance.new("Part", workspace)
                Part.Anchored = true
                Part.Size = Vector3.new(200, 1, 200)
                Part.CFrame = CFrame.new(9999, 9999, 9999) --Set this to whatever you want, just far away from the map.
                Part.CanCollide = true
                FakeCharacter.Parent = workspace
                FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
        
                for i, v in pairs(RealCharacter:GetChildren()) do
                    if v:IsA("LocalScript") then
                        local clone = v:Clone()
                        clone.Disabled = true
                        clone.Parent = FakeCharacter
                    end
                end
                if Transparency then
                    for i, v in pairs(FakeCharacter:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.Transparency = 0.7
                        end
                    end
                end
                RealCharacter.Humanoid.Died:Connect(function()
                    RealCharacter:Destroy()
                    FakeCharacter:Destroy()
                end)
                Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
            end
            RealCharacter.Humanoid.Died:Connect(function()
                RealCharacter:Destroy()
                FakeCharacter:Destroy()
            end)
            Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
            local PseudoAnchor
            game:GetService "RunService".RenderStepped:Connect(
                function()
                    if PseudoAnchor ~= nil then
                        PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
                    end
                    if NoClip then
                        FakeCharacter.Humanoid:ChangeState(11)
                    end
                end
            )
        
            PseudoAnchor = FakeCharacter.HumanoidRootPart
            local function Invisible()
                if IsInvisible == false then
                    local StoredCF = RealCharacter.HumanoidRootPart.CFrame
                    RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
                    FakeCharacter.HumanoidRootPart.CFrame = StoredCF
                    RealCharacter.Humanoid:UnequipTools()
                    Player.Character = FakeCharacter
                    workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
                    PseudoAnchor = RealCharacter.HumanoidRootPart
                    for i, v in pairs(FakeCharacter:GetChildren()) do
                        if v:IsA("LocalScript") then
                            v.Disabled = false
                        end
                    end
        
                    IsInvisible = true
                else
                    local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
                    FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
        
                    RealCharacter.HumanoidRootPart.CFrame = StoredCF
        
                    FakeCharacter.Humanoid:UnequipTools()
                    Player.Character = RealCharacter
                    workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
                    PseudoAnchor = FakeCharacter.HumanoidRootPart
                    for i, v in pairs(FakeCharacter:GetChildren()) do
                        if v:IsA("LocalScript") then
                            v.Disabled = true
                        end
                    end
                    IsInvisible = false
                end
            end
        
            game:GetService("UserInputService").InputBegan:Connect(
            function(key, gamep)
                if gamep then
                    return
                end
                if key.KeyCode.Name:lower() == Keybind:lower() and CanInvis and RealCharacter and FakeCharacter then
                    if RealCharacter:FindFirstChild("HumanoidRootPart") and FakeCharacter:FindFirstChild("HumanoidRootPart") then
                        Invisible()
                    end
                end
            end
            )
            local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://232127604"
            Sound:Play()
            game:GetService("StarterGui"):SetCore("SendNotification",{["Title"] = "Invisible Toggle Loaded",["Text"] = "Press "..Keybind.." to become change visibility.",["Duration"] = 20,["Button1"] = "Okay."})
        
        end)
        makecharbutton("清除障碍").MouseButton1Click:Connect(function()
        	game:GetService("Workspace").InviteSigns:Destroy()
            game:GetService("Workspace").Game.Props["Trash Bag"]:Destroy()
            game:GetService("Workspace").Game.Props.Dumpster:Destroy()
            game:GetService("Workspace").Game.Props["Traffic Cone"]:Destroy()
            game:GetService("Workspace").Game.Props["Wire Fence"]:Destroy()
            game:GetService("Workspace").Game.Props["Wood Crate"]:Destroy()
            game:GetService("Workspace").Game.Props.Hydrant:Destroy()
            game:GetService("Workspace").Game.Props["Street Light"]:Destroy()
            game:GetService("Workspace").Game.Props["Power Line Pole"]:Destroy()
            game:GetService("Workspace").Game.Props["Wood Fence"]:Destroy()
            game:GetService("Workspace").Game.Props.BusStop:Destroy()
            game:GetService("Workspace").Game.Props.Roadblock:Destroy()
            game:GetService("Workspace").Game.Props.Bollard:Destroy()
            game:GetService("Workspace").Game.Props.Light:Destroy()
            game:GetService("Workspace").Game.Props.Roadblock:Destroy()
            game:GetService("Workspace").Game.Props.Glass:Destroy()
            game:GetService("Workspace").Game.Props.Bench:Destroy()
            game:GetService("Workspace").Game.Props["Trash Bin"]:Destroy()
            game:GetService("Workspace").Game.Props.Bollard:Destroy()
            game:GetService("Workspace").Game.Props["Office Chair"]:Destroy()
            game:GetService("Workspace").Game.Props.Table:Destroy()
            game:GetService("Workspace").BankRobbery.BankWalls:Destroy()
            game:GetService("Workspace").BankRobbery.AlarmLightModel:Destroy()
            game:GetService("Workspace").BankRobbery.AlarmLights:Destroy()
        end)
        local tpframe = makeFrame(scrollingFrame, "瞬移", Color3.fromRGB(53, 53, 100))
        local tpscroll = tpframe.ScrollingFrame
        local function maketpbutton(buttontext)
        	local button = Instance.new("TextButton")
        	button.Name = "tpscroll"
        	button.Parent = tpscroll
        	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        	button.BorderSizePixel = 0
        	button.Size = UDim2.new(1, -10, 0, 20)
        	button.Font = Enum.Font.SourceSans
        	button.Text = buttontext
        	button.TextColor3 = Color3.fromRGB(226, 226, 226)
        	button.TextSize = 15.000
        	return button
        end
        local tp = maketpbutton("银行")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(1055.94153, 15.11950874, -344.58374)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("珠宝店")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(1719.02637, 14.2831011, -714.293091)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("黑市")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(690.499, -18.949, -115.453)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("沙滩")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(998.4656372070312, 15, 395.9789733886719)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("武器店(撬锁)")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(660.5284423828125, 6.4081127643585205, -716.489990234375)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("警局(M4A1)")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(603.4676513671875,25.662811279296875,-922.0442504882812)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("军事基地(军甲)")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(563.4422607421875,28.502071380615234,-1472.780517578125)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("武士刀")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(175.191, 13.937, -132.69)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("锯掉")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(1179.98523,40,-436.812683)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("沙漠之鹰")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(363.341461, 26.0798492, -259.681396)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("射线枪")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(148.685471, -90, -529.280945)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("AUG")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(1170.500244140625,48.37138366699219,-772.55859375)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("军事基地(加特林)")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(364.97076416015625, 0.764974117279053, -1447.3302001953125)
            tp2.CFrame = tp3
        end)
        
        local tp = maketpbutton("沙漠之鹰")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(363.341461, 26.0798492, -259.681396)
            tp2.CFrame = tp3
        end)
        local tp = maketpbutton("射线枪")
        tp.MouseButton1Click:Connect(function()
            local tp1 = game:GetService("Players")
            local tp2 = tp1.LocalPlayer.Character.HumanoidRootPart
            local tp3 = CFrame.new(148.685471, -90, -529.280945)
            tp2.CFrame = tp3
        end)
        
        local utilframe = makeFrame(scrollingFrame, "自动化", Color3.fromRGB(53, 53, 100))
        local utilscroll = utilframe.ScrollingFrame
        
        local function makeutilbutton(buttontext)
        	local button = Instance.new("TextButton")
        	button.Name = "utilButton"
        	button.Parent = utilscroll
        	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        	button.BorderSizePixel = 0
        	button.Size = UDim2.new(1, -10, 0, 20)
        	button.Font = Enum.Font.SourceSans
        	button.Text = buttontext
        	button.TextColor3 = Color3.fromRGB(226, 226, 226)
        	button.TextSize = 15.000
        	return button
        end
        local autobankb = makeutilbutton("自动银行")
        local autobankbt = false
        autobankb.MouseButton1Click:Connect(function()
            if autobankbt == false then
                autobankbt = true
                autobankb.Text = "自动银行(开)"
            else
                autobankbt = false
                autobankb.Text = "自动银行"
            end
            while autobankbt == true do
            wait(0.3)
            if autobankbt == true then
                local BankDoor = game:GetService("Workspace").BankRobbery.VaultDoor
                local BankCashs = game:GetService("Workspace").BankRobbery.BankCash
                local epoh2 = game:GetService("Players")
                local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                if BankDoor.Door.Attachment.ProximityPrompt.Enabled == true then
                    BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
                    BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 20
                    local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
                    epoh3.CFrame = epoh1
                    wait(0.3)
                    BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
                    wait(0.3)
                    BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
                else
                    if BankCashs.Cash:FindFirstChild("Bundle") then
                        local epoh1 = CFrame.new(1055.94153, 15.11950874, -344.58374)
                        epoh3.CFrame = epoh1
                        BankCashs.Main.Attachment.ProximityPrompt.MaxActivationDistance = 20
                        BankCashs.Main.Attachment.ProximityPrompt:InputHoldBegin()
                    end 
                    if not BankCashs.Cash:FindFirstChild("Bundle") then
                    	BankCashs.Main.Attachment.ProximityPrompt:InputHoldEnd()
                    end
                end
            end
        end
        end)
        local automoneyprint = makeutilbutton("自动捡印钞机")
        local automoneyprintt = false
        automoneyprint.MouseButton1Click:Connect(function()
            if automoneyprintt == false then
                automoneyprintt = true
                automoneyprint.Text = "自动捡印钞机(开)"
            else
                automoneyprintt = false
                automoneyprint.Text = "自动捡印钞机"
            end
            while automoneyprintt == true do
        	wait(0.1)
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for i,v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or "Part" then
                        for i,e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Money Printer" then
                                    local epoh1 = v.CFrame
                                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                    e:InputHoldBegin()
                                    e:InputHoldEnd()
                                end
                            end
                        end       
                    end
                end
            end
        end
        end)
        
        local autoore = makeutilbutton("自动捡稀有珠宝")
        local autooret = false
        autoore.MouseButton1Click:Connect(function()
            if autooret == false then
                autooret = true
                autoore.Text = "自动捡稀有珠宝(开)"
            else
                autooret = false
                autoore.Text = "自动捡稀有珠宝"
            end
            while autooret == true do
        	wait(0.1)
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for i,v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or "Part" then
                        for i,e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Diamond Ring" or e.ObjectText == "Diamond" or e.ObjectText == "Void Gem" or e.ObjectText == "Dark Matter Gem" or e.ObjectText == "Rollie" then
                                    local epoh1 = v.CFrame
                                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
        							wait(0.1)
                                    e:InputHoldBegin()
                                    e:InputHoldEnd()
                                end
                            end
                        end       
                    end
                end
            end
        end
        end)
        
        local automgoldgun = makeutilbutton("自动捡黄金枪")
        local automgoldgunt = false
        automgoldgun.MouseButton1Click:Connect(function()
            if automgoldgunt == false then
                automgoldgunt = true
                automgoldgun.Text = "自动捡黄金枪(开)"
            else
                automgoldgunt = false
                automgoldgun.Text = "自动捡黄金枪"
            end
            while automgoldgunt == true do
        	wait(0.1)
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for i,v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or "Part" then
                        for i,e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Gold AK-47" or e.ObjectText == "Gold Deagle" then
                                    local epoh1 = v.CFrame
                                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                    wait(0.1)
                                    e:InputHoldBegin()
                                    e:InputHoldEnd()
                                end
                            end
                        end       
                    end
                end
            end
        end
        end)
        
        local autoairdrop123 = makeutilbutton("自动捡空投标记")
        local autoairdrop123t = false
        autoairdrop123.MouseButton1Click:Connect(function()
            if autoairdrop123t == false then
                autoairdrop123t = true
                autoairdrop123.Text = "自动捡空投、空袭标记(开)"
            else
                autoairdrop123t = false
                autoairdrop123.Text = "自动捡空投标记"
            end
            while autoairdrop123t == true do
        	wait(0.1)
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for i,v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or "Part" then
                        for i,e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Airdrop Marker" or e.ObjectText == "Airstrike Marker" then
                                    local epoh1 = v.CFrame
                                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                    wait(0.1)
                                    e:InputHoldBegin()
                                    e:InputHoldEnd()
                                end
                            end
                        end       
                    end
                end
            end
        end
        end)
        
        local autoairdrop1231 = makeutilbutton("自动捡精致零件")
        local autoairdrop1231t = false
        autoairdrop1231.MouseButton1Click:Connect(function()
            if autoairdrop1231t == false then
                autoairdrop1231t = true
                autoairdrop1231.Text = "自动捡精致零件(开)"
            else
                autoairdrop1231t = false
                autoairdrop1231.Text = "自动捡精致零件"
            end
            while autoairdrop1231t == true do
        	wait(0.1)
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for i,v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or "Part" then
                        for i,e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Electronics" or e.ObjectText == "Weapon Parts" then
                                    local epoh1 = v.CFrame
                                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                    wait(0.1)
                                    e:InputHoldBegin()
                                    e:InputHoldEnd()
                                end
                            end
                        end       
                    end
                end
            end
        end
        end)
        
        local autoPresent = makeutilbutton("自动捡礼物盒")
        local autoPresentt = false
        autoPresent.MouseButton1Click:Connect(function()
            if autoPresentt == false then
                autoPresentt = true
                autoPresent.Text = "自动捡礼物盒(开)"
            else
                autoPresentt = false
                autoPresent.Text = "自动捡礼物盒"
            end
            while autoPresentt == true do
        	wait(0.1)
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for i,v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or "Part" then
                        for i,e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Small Present" then
                                    local epoh1 = v.CFrame
                                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                    wait(0.1)
                                    e:InputHoldBegin()
                                    e:InputHoldEnd()
                                end
                            end
                        end       
                    end
                end
            end
        end
        end)
        
        local autoredcrad = makeutilbutton("自动捡红卡")
        local autoredcradt = false
        autoredcrad.MouseButton1Click:Connect(function()
            if autoredcradt == false then
                autoredcradt = true
                autoredcrad.Text = "自动捡红卡(开)"
            else
                autoredcradt = false
                autoredcrad.Text = "自动捡红卡"
            end
            while autoredcradt == true do
        	wait(0.1)
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for i,v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or "Part" then
                        for i,e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Military Armory Keycard" then
                                    local epoh1 = v.CFrame
                                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                    wait(0.1)
                                    e:InputHoldBegin()
                                    e:InputHoldEnd()
                                end
                            end
                        end       
                    end
                end
            end
        end
        end)
        
        local autopickballoon = makeutilbutton("自动捡气球")
        local autopickballoont = false
        autopickballoon.MouseButton1Click:Connect(function()
            if autopickballoont == false then
                autopickballoont = true
                autopickballoon.Text = "自动捡气球(开)"
            else
                autopickballoont = false
                autopickballoon.Text = "自动捡气球"
            end
            while autopickballoont == true do
        	wait(0.1)
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for i,v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or "Part" then
                        for i,e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Bunny Balloon" or e.ObjectText == "Ghost Balloon" or e.ObjectText == "Clover Balloon" then
                                    local epoh1 = v.CFrame
                                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                    wait(0.1)
                                    e:InputHoldBegin()
                                    e:InputHoldEnd()
                                end
                            end
                        end       
                    end
                end
            end
        end
        end)
        
        local autopickcandycane = makeutilbutton("自动捡糖果棒")
        local autopickcandycanet = false
        autopickcandycane.MouseButton1Click:Connect(function()
            if autopickcandycanet == false then
                autopickcandycanet = true
                autopickcandycane.Text = "自动捡糖果棒(开)"
            else
                autopickcandycanet = false
                autopickcandycane.Text = "自动捡糖果棒"
            end
            while autopickcandycanet == true do
        	wait(0.1)
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for i,v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or "Part" then
                        for i,e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Bunny Balloon" or e.ObjectText == "Ghost Balloon" or e.ObjectText == "Clover Balloon" then
                                    local epoh1 = v.CFrame
                                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                    wait(0.1)
                                    e:InputHoldBegin()
                                    e:InputHoldEnd()
                                end
                            end
                        end       
                    end
                end
            end
        end
        end)
        
        local aassdd = makeutilbutton("珠宝店提示")
            local aassddt = false
            aassdd.MouseButton1Click:Connect(function()
            if aassddt == false then
                aassddt = true
                aassdd.Text = "珠宝店提示(开)"
            else
                automoneyprintt = false
                aassdd.Text = "珠宝店提示"
            end
        
            while aassddt do
                wait(0.1)
                local Ge = game:GetService("Workspace").GemRobbery:FindFirstChild("Rubble")
                if Ge then
                    game:GetService("StarterGui"):SetCore("SendNotification",{
        	    	Title = "提示：";
        	    	Text = "珠宝店已刷新";
        	    	Duration = math.huge;
                    Button1 = "好"
                    })
                    wait(30)
                end
            end
        end)
        
        makeutilbutton("瞬移秒开金保险").MouseButton1Click:Connect(function()
            local BankDoor = game:GetService("Workspace").BankRobbery.VaultDoor
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            if BankDoor.Door.Attachment.ProximityPrompt.Enabled == true then
                BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
                BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 20
                local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
                epoh3.CFrame = epoh1
                wait(0.3)
                BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
        		BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
            end
            local GoldJewelSafes = game:GetService("Workspace").Game.Entities.GoldJewelSafe
            for _, model in pairs(GoldJewelSafes:GetChildren()) do
                if model.ClassName == "Model" then
                    epoh3.CFrame = model.WorldPivot * CFrame.new(0, 10, 0)
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.MaxActivationDistance = 20
                    wait(0.3)
                    if model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.Enabled == true then
                        model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldBegin()
                        model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldEnd()
                        break
                    end
                end
            end
        end)
        makeutilbutton("瞬移开黑保险").MouseButton1Click:Connect(function()
            local BankDoor = game:GetService("Workspace").BankRobbery.VaultDoor
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            if BankDoor.Door.Attachment.ProximityPrompt.Enabled == true then
                BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
                BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 20
                local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
                epoh3.CFrame = epoh1
                wait(0.3)
                BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
        		BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
            end
            local JewelSafes = game:GetService("Workspace").Game.Entities.JewelSafe
            for _, model in pairs(JewelSafes:GetChildren()) do
                if model.ClassName == "Model" then
                    epoh3.CFrame = model.WorldPivot * CFrame.new(0, 10, 0)
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.MaxActivationDistance = 20
                    wait(0.3)
                    if model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.Enabled == true then
                        model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldBegin()
                        model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldEnd()
                        break
                    end
                end
            end
        end)
        makeutilbutton("瞬移大宝箱").MouseButton1Click:Connect(function()
            local LargeChes = game:GetService("Workspace").Game.Entities.LargeChest
            local foundModel = false
            for _, model in pairs(LargeChes:GetChildren()) do
                if model.ClassName == "Model" then
                    foundModel = true
                    local epoh1 = model.WorldPivot
                    local epoh2 = game:GetService("Players")
                    local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                    wait(0.1)
                    model.Door["Meshes/LargeSafe1_Cube.002_Cube.003_None (3)"].Attachment.ProximityPrompt:InputHoldBegin()
                    model.Door["Meshes/LargeSafe1_Cube.002_Cube.003_None (3)"].Attachment.ProximityPrompt:InputHoldEnd()
                    break
                end
            end
        end)
        makeutilbutton("瞬移开小宝箱").MouseButton1Click:Connect(function()
            local SmallChes = game:GetService("Workspace").Game.Entities.SmallChest
            for _, model in pairs(SmallChes:GetChildren()) do
                if model.ClassName == "Model" then
                    local epoh1 = model.WorldPivot
                    local epoh2 = game:GetService("Players")
                    local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                    wait(0.1)
                    model.Lock["Meshes/untitled_chest.002_Material.009 (4)"].Attachment.ProximityPrompt:InputHoldBegin()
                    model.Lock["Meshes/untitled_chest.002_Material.009 (4)"].Attachment.ProximityPrompt:InputHoldEnd()
                    break
                end
            end
        end)
        makeutilbutton("瞬移开小保险").MouseButton1Click:Connect(function()
            local SmallSaf = game:GetService("Workspace").Game.Entities.SmallSafe
            for _, model in pairs(SmallSaf:GetChildren()) do
                if model.ClassName == "Model" then
                    local epoh1 = model.WorldPivot
                    local epoh2 = game:GetService("Players")
                    local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                    epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                    SmallSaf.SmallSafe.Door["Meshes/Safe1_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
                    wait(0.1)
                    SmallSaf.SmallSafe.Door["Meshes/Safe1_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldBegin()
                    SmallSaf.SmallSafe.Door["Meshes/Safe1_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldEnd()
                    break
                end
            end
        end)
        
        makeutilbutton("瞬移挖宝藏").MouseButton1Click:Connect(function()
            local Debri = game:GetService("Workspace").Game.Local.Debris
            if Debri.TreasureMarker then
                local epoh1 = Debri.TreasureMarker.CFrame
                local epoh2 = game:GetService("Players")
                local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                Debri.TreasureMarker.ProximityPrompt.HoldDuration = 0
                Debri.TreasureMarker.ProximityPrompt.MaxActivationDistance = 40
                wait(0.1)
                Debri.TreasureMarker.ProximityPrompt:InputHoldBegin()
                Debri.TreasureMarker.ProximityPrompt:InputHoldEnd()
            end  
        end)
        
        local cbringframe = makeFrame(scrollingFrame, "把他传送过来", Color3.fromRGB(53, 53, 100))
        local cbringscroll = cbringframe.ScrollingFrame
        
        local cbring = {}
        
        local togglecbring = nil
        
        local function makecbringframe(name)
        	local plrcbringf = Instance.new("Frame")
        	local uncbringbtn = Instance.new("TextButton")
        	local cbringplrname = Instance.new("TextBox")
        	plrcbringf.Name = name
        	plrcbringf.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
        	plrcbringf.BorderSizePixel = 0
        	plrcbringf.Size = UDim2.new(1, -10, 0, 30)
        	plrcbringf.Parent = cbringscroll
        	uncbringbtn.Name = "removeposbutton"
        	uncbringbtn.Parent = plrcbringf
        	uncbringbtn.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
        	uncbringbtn.BorderSizePixel = 0
        	uncbringbtn.Position = UDim2.new(1, -25, 0, 5)
        	uncbringbtn.Size = UDim2.new(0, 20, 1, -10)
        	uncbringbtn.Font = Enum.Font.SourceSans
        	uncbringbtn.Text = "X"
        	uncbringbtn.TextColor3 = Color3.fromRGB(223, 223, 223)
        	uncbringbtn.TextSize = 16.000
        	cbringplrname.Parent = plrcbringf
        	cbringplrname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	cbringplrname.BackgroundTransparency = 1.000
        	cbringplrname.BorderSizePixel = 0
        	cbringplrname.Position = UDim2.new(0, 5, 0, 5)
        	cbringplrname.Size = UDim2.new(1, -80, 1, -10)
        	cbringplrname.Font = Enum.Font.SourceSans
        	cbringplrname.Text = name
        	cbringplrname.TextColor3 = Color3.fromRGB(0, 0, 0)
        	cbringplrname.TextSize = 25.000
        	cbringplrname.TextXAlignment = Enum.TextXAlignment.Left
        	uncbringbtn.MouseButton1Click:Connect(function()
        		togglecbring(name)
        	end)
        	return plrcbringf
        end
        
        togglecbring = function(name)
        	local frame = gp(cbringscroll, name, "Frame")
        	if frame then
        		pcall(function()
        			table.remove(cbring, table.find(cbring, name))
        		end)
        		frame:Destroy()
        		notify("removed " .. name .. " from cbring")
        	else
        		table.insert(cbring, name)
        		makecbringframe(name)
        		notify("added " .. name .. " to cbring")
        	end
        end
        
        cbringb.MouseButton1Click:Connect(function()
        	togglecbring(currentplayer.Name)
        end)
        
        local cbringallbtn = Instance.new("TextButton")
        cbringallbtn.Name = "cbringallbtn"
        cbringallbtn.Parent = cbringframe.framelabel
        cbringallbtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        cbringallbtn.BorderSizePixel = 0
        cbringallbtn.Position = UDim2.new(1, -57, 0, 2)
        cbringallbtn.Size = UDim2.new(0, 55, 1, -4)
        cbringallbtn.Font = Enum.Font.SourceSans
        cbringallbtn.Text = "+添加全部"
        cbringallbtn.TextColor3 = Color3.fromRGB(223, 223, 223)
        cbringallbtn.TextSize = 14.000
        cbringallbtn.MouseButton1Click:Connect(function()
        	for i, v in pairs(plrs:GetPlayers()) do
        		if (v ~= lp) and v and v.Parent and (not table.find(cbring, v.Name)) then
        			togglecbring(v.Name)
        		end
        	end
        end)
        
        spawn(function()
        	while gui do
        		local waited = false
        		local lpc = lp.Character
        		if lpc and lpc.Parent then
        			local part0 = gp(lpc, "Torso", "BasePart") or gp(lpc, "HumanoidRootPart", "BasePart") or gp(lpc, "Head", "BasePart") or lpc:FindFirstChildWhichIsA("BasePart")
        			if part0 then
        				for i, v in pairs(plrs:GetPlayers()) do
        					if v ~= lp then
        						local c = v.Character
        						if c and c.Parent then
        							if table.find(cbring, v.Name) then
        								local part1 = gp(c, part0.Name, "BasePart") or gp(c, "Torso", "BasePart") or gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
        								if part1 then
        									local p1cf = part0.CFrame
        									waited = true
        									weldtp(part1, p1cf + p1cf.LookVector * 2)
        								end
        							end
        						end
        					end
        				end
        			end
        		end
        		if not waited then
        			stepped:wait(0.1)
        		end
        	end
        end)
        
        local con = nil
        con = stepped:Connect(function()
            if not gui then
                con:Disconnect()
                return
            end
        	local lpc = lp.Character
        	if noclip and lpc and lpc.Parent then
        		for i, v in pairs(lpc:GetDescendants()) do
        			if v:IsA("BasePart") then
        				v.CanCollide = false
        			end
        		end
        	end
        end)
        
        local con0, con1 = nil, nil
        local function antiflingF()
            if not gui then
                con0:Disconnect()
                con1:Disconnect()
                return
            end
            if antifling then
        		for i, v in pairs(plrs:GetPlayers()) do
        			if v ~= lp then
        				local c = v.Character
        				if c and c.Parent then
        					for i1, v1 in pairs(c:GetDescendants()) do
        						if v1:IsA("BasePart") then
        							v1.CanCollide = false
        							v1.Velocity = v3_0
        							v1.RotVelocity = v3_0
        						end
        					end
        				end
        			end
                end
            end
        end
        con0 = stepped:Connect(antiflingF)
        con1 = heartbeat:Connect(antiflingF)
        
        gui.Enabled = true
        renderstepped:wait(0.1)
        playercframe.Visible = false
        
        game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = true
        game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Position = UDim2.new(0, 0, 0, 40)
        game:GetService("Players").LocalPlayer.PlayerGui.Money.Container.premium.Shadow.Visible = false
        game:GetService("Players").LocalPlayer.PlayerGui.Money.Container["2x cash"].Shadow.Visible = false
        game:GetService("Players").LocalPlayer.PlayerGui.Money.Container.premium.Visible = true
        game:GetService("Players").LocalPlayer.PlayerGui.Money.Container.premium.TextLabel.Text = "FDP User"
        game:GetService("Players").LocalPlayer.PlayerGui.Money.Container["2x cash"].Visible = true
        game:GetService("Players").LocalPlayer.PlayerGui.Money.Container["2x cash"].TextLabel.Text = "FDP By Smk"
        game:GetService("Workspace").BlackMarket.Dealer.Dealer.ProximityPrompt.HoldDuration = 0
        game:GetService("Workspace").BlackMarket.BlackMarketBillboard.TopLabel.Text = "黑市"
        game:GetService("Workspace").BlackMarket.BlackMarketBillboard.BottomLabel.Text = "向黑商出售物品以获得钱!"
        game:GetService("Workspace").OhioSign.Screen.SurfaceGui.Frame.Population.Text = "FDP User"
        
        local Teams = game:GetService("Teams")
        local newTeam = Instance.new("Team")
        newTeam.Name = "FDP User"
        newTeam.Parent = Teams
        local player = game:GetService("Players").LocalPlayer
        player.Team = newTeam
        
        local UserInputService = game:GetService("UserInputService")
        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.Z then
                game:GetService("Players").LocalPlayer.PlayerGui.Backpack.Holder.Locker.Visible = true
            end
        end)
        
        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.E then
                game:GetService("Workspace").BankRobbery.VaultDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
                game:GetService("Workspace").BankRobbery.VaultDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 20
                game:GetService("Workspasce").BankRobbery.BankCash.Main.Attachment.ProximityPrompt.MaxActivationDistance = 20    
            end
        end)
        
        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.E then
                local safe = game:GetService("Workspace").Game.Entities.GoldJewelSafe.GoldJewelSafe
                safe.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
                safe.Name = "safeopen"  
            end
        end)
        
        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.E then
                local safe2 = game:GetService("Workspace").Game.Entities.JewelSafe.JewelSafe
                safe2.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
                safe2.Name = "safeopen"
            end
        end)
        
        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.E then
                game:GetService("Workspace").Game.Airdrops.Airdrop.Airdrop.ProximityPrompt.HoldDuration = 0
            end
        end)
        local function loop1()
        		while true do
        			wait(0.1)
        			local players = game:GetService("Players"):GetPlayers()
        
        			for _, player in pairs(players) do
        				local leaderstats = Instance.new("IntValue")
        				leaderstats.Name = "leaderstats"
        				leaderstats.Value = player.stats.Money.Value
        
        				local Rank = Instance.new("NumberValue")
        				Rank.Name = "全服金钱"
        				Rank.Value = player.stats.Money.Value
        
        				local Health = Instance.new("NumberValue")
        				Health.Name = "血量"
        				Health.Value = player.Character.Humanoid.Health
        
        				leaderstats.Parent = player
        				Rank.Parent = leaderstats
        				Health.Parent = leaderstats
        			end
        		end
        	end
        
        	for i = 1, 20 do
        
        		if game.Workspace.ToSort:FindFirstChild('Tunnel') then
        			game.workspace.ToSort.Tunnel:Destroy()
        		end
        	end
        	local road = Instance.new("Part")
        	road.Size = Vector3.new(760.364, 1.001, 46.918)
        	road.Anchored = true
        	road.Archivable = true
        	road.Position = Vector3.new(-255.446, -9.808, -350.11)
        	road.Parent = workspace
        	road.Color = Color3.new(0.223529, 0.223529, 0.223529)
        	road.Material = "Concrete"
        	local road2 = Instance.new("Part")
        	road2.Size = Vector3.new(766.188, 5.496, 16.4)
        	road2.Anchored = true
        	road2.Archivable = true
        	road2.Position = Vector3.new(-252.73, -11.793, -379.689)
        	road2.Parent = workspace
        	road2.Material = "Concrete"
        	road2.Color = Color3.new(0.529412, 0.529412, 0.529412)
        	local road3 = Instance.new("Part")
        	road3.Size = Vector3.new(563.051, 1.796, 19.772)
        	road3.Anchored = true
        	road3.Archivable = true
        	road3.Position = Vector3.new(-354.694, -9.944, -322.653)
        	road3.Parent = workspace
        	road3.Material = "Concrete"
        	road3.Color = Color3.new(0.529412, 0.529412, 0.529412)
        	local road3 = Instance.new("Part")
        	road3.Size = Vector3.new(563.051, 1.796, 19.772)
        	road3.Anchored = true
        	road3.Archivable = true
        	road3.Position = Vector3.new(-354.694, -9.944, -322.653)
        	road3.Parent = workspace
        	road3.Material = "Concrete"
        	road3.Color = Color3.new(0.529412, 0.529412, 0.529412)
        	local road3 = Instance.new("Part")
        	road3.Size = Vector3.new(19.773, 1.796, 239.333)
        	road3.Anchored = true
        	road3.Archivable = true
        	road3.Position = Vector3.new(-83.056, -20.395, -194.468)
        	road3.Orientation = Vector3.new(5, 0, 0)
        	road3.Parent = workspace
        	road3.Material = "Concrete"
        	road3.Color = Color3.new(0.529412, 0.529412, 0.529412)
        	local road3 = Instance.new("Part")
        	road3.Size = Vector3.new(19.773, 1.796, 239.333)
        	road3.Anchored = true
        	road3.Archivable = true
        	road3.Position = Vector3.new(-19.256, -20.395, -194.468)
        	road3.Orientation = Vector3.new(5, 0, 0)
        	road3.Parent = workspace
        	road3.Material = "Concrete"
        	road3.Color = Color3.new(0.529412, 0.529412, 0.529412)
        	local road3 = Instance.new("Part")
        	road3.Size = Vector3.new(179.456, 1.796, 19.772)
        	road3.Anchored = true
        	road3.Archivable = true
        	road3.Position = Vector3.new(60.439, -9.944, -322.653)
        	road3.Orientation = Vector3.new(0, 0, 0)
        	road3.Parent = workspace
        	road3.Material = "Concrete"
        	road3.Color = Color3.new(0.529412, 0.529412, 0.529412)
        	local road3 = Instance.new("Part")
        	road3.Size = Vector3.new(47.792, 1.001, 60.939)
        	road3.Anchored = true
        	road3.Archivable = true
        	road3.Position = Vector3.new(-51.234, -9.808, -343.099)
        	road3.Orientation = Vector3.new(0, 0, 0)
        	road3.Parent = workspace
        	road3.Material = "Concrete"
        	road3.Color = Color3.new(0.223529, 0.223529, 0.223529)
        	local road3 = Instance.new("Part")
        	road3.Size = Vector3.new(47.792, 1.001, 262.574)
        	road3.Anchored = true
        	road3.Archivable = true
        	road3.Position = Vector3.new(-51.234, -21.234, -181.97)
        	road3.Orientation = Vector3.new(5, 0, 0)
        	road3.Parent = workspace
        	road3.Material = "Concrete"
        	road3.Color = Color3.new(0.223529, 0.223529, 0.223529)
        	local rt = Instance.new("Part")
        	rt.Size = Vector3.new(47.792, 1.001, 262.574)
        	rt.Anchored = true
        	rt.Archivable = true
        	rt.Position = Vector3.new(-193.438, 46.016, -490.664)
        	rt.Orientation = Vector3.new(25, 0, 0)
        	rt.Parent = workspace
        	rt.Material = "Concrete"
        	rt.Color = Color3.new(0.223529, 0.223529, 0.223529)
        	local rt = Instance.new("Part")
        	rt.Size = Vector3.new(0.965, 4.432, 262.5)
        	rt.Anchored = true
        	rt.Archivable = true
        	rt.Position = Vector3.new(-216.854, 48.471, -489.503)
        	rt.Orientation = Vector3.new(25, 0, 0)
        	rt.Parent = workspace
        	rt.Material = "Concrete"
        	local rt = Instance.new("Part")
        	rt.Size = Vector3.new(0.965, 4.432, 262.5)
        	rt.Anchored = true
        	rt.Archivable = true
        	rt.Position = Vector3.new(-170.157, 48.471, -489.503)
        	rt.Orientation = Vector3.new(25, 0, 0)
        	rt.Parent = workspace
        	rt.Material = "Concrete"
        	local rt = Instance.new("Part")
        	rt.Size = Vector3.new(47.792, 1.001, 92.834)
        	rt.Anchored = true
        	rt.Archivable = true
        	rt.Position = Vector3.new(-193.404, 101.593, -655.732)
        	rt.Orientation = Vector3.new(0, 0, 0)
        	rt.Parent = workspace
        	rt.Material = "Concrete"
        	rt.Color = Color3.new(0.223529, 0.223529, 0.223529)
        	local rt = Instance.new("Part")
        	rt.Size = Vector3.new(1853.465, 1.001, 44.169)
        	rt.Anchored = true
        	rt.Archivable = true
        	rt.Position = Vector3.new(695.76, 254.199, -680.065)
        	rt.Orientation = Vector3.new(0, 0, 10)
        	rt.Parent = workspace
        	rt.Material = "Concrete"
        	rt.Color = Color3.new(0.223529, 0.223529, 0.223529)
        	local function loop2()
        		while true do
        			wait(0.1)
        			local players = game:GetService("Players")
        			for _, player in pairs(players:GetPlayers()) do
        				local character = player.Character
        				if character then
        					local gta = character:FindFirstChild("grabPrompt")
        					if gta then
        						gta.ClickablePrompt = true
        						gta.MaxActivationDistance = 35
        						gta.RequiresLineOfSight = false
        						gta.HoldDuration = 0
        						gta.ActionText = "Charlie觉得你可以把Ta抓起来，或者踩死"
        						local leaderstats = Instance.new("IntValue")
        						leaderstats.Name = "leaderstats"
        						leaderstats.Value = player.stats.Money.Value
        
        						local Rank = Instance.new("NumberValue")
        						Rank.Name = "全服金钱"
        						Rank.Value = player.stats.Money.Value
        
        						local Health = Instance.new("NumberValue")
        						Health.Name = "血量"
        						Health.Value = player.Character.Humanoid.Health
        
        						leaderstats.Parent = player
        						Rank.Parent = leaderstats
        						Health.Parent = leaderstats
        					end
        				end
        			end
        
        		end
        	end
        	local thread1 = coroutine.create(loop1)
        	local thread2 = coroutine.create(loop2)
        	coroutine.resume(thread1)
        	coroutine.resume(thread2)
        end
    end
})

OrionLib:Init()
