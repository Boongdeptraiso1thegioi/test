local t16 = nil

loadstring(game:HttpGet("https://raw.githubusercontent.com/aslamdunk7/paypmboygang/refs/heads/main/BypassBF"))()

if getgenv().PayomboyZ_BloxFruits_Cleanup then
	pcall(getgenv().PayomboyZ_BloxFruits_Cleanup)
end

local u2 = true

getgenv().PayomboyZ_BloxFruits_Cleanup = function()
	-- upvalues: u2 (ref)
	u2 = false
end
pcall(function()
	local v101 = queue_on_teleport or syn and syn.queue_on_teleport or fluxus and fluxus.queue_on_teleport

	if v101 then
		v101("            repeat task.wait() until game:IsLoaded()\n            loadstring(game:HttpGet(\"https://raw.githubusercontent.com/aslamdunk7/paypmboygang/refs/heads/main/Start\"))()\n        ")
	end
end)

local v3 = getgenv()
local t1 = {
	Team = "Pirates"
}
local v5 = true

t1.AutoFarmLevel = v5
t1.FastAttack = v5
t1.BringMob = v5
t1.SkipFarmLevel = v5
t1.Saber = v5
t1.Pole = v5
t1.AutoHaki = v5
t1.AutoBuyMelee = v5
t1.AutoStats = v5
t1.AutoStoreFruit = v5
t1.AutoRandomFruit = v5
t1.SelectWeapon = "Melee"
v3.Configs = t1

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer

task.spawn(function()
	-- upvalues: u2 (ref), LocalPlayer (ref), ReplicatedStorage (ref)
	if not LocalPlayer.Team then
		repeat
			task.wait(0.5)
			pcall(function()
				-- upvalues: ReplicatedStorage (ref)
				if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
					ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", getgenv().Configs.Team)
				end
			end)
		until LocalPlayer.Team or not u2
	end
end)

local _game = game
local PlaceId = _game.PlaceId
local TweenService = _game:GetService("TweenService")
local CollectionService = game:GetService("CollectionService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local SoundService = game:GetService("SoundService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

game:GetService("VirtualUser")

local VirtualInputManager = game:GetService("VirtualInputManager")
local CommF_ = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
local u20 = game:GetAttribute("LEVEL_CAP") or 2800
local u21 = false
local u22 = false
local u23 = false

local function u24()
	-- upvalues: LocalPlayer (ref)
	if typeof(gethui) == "function" then
		local ok, result = pcall(gethui)

		if ok and result and typeof(result) == "Instance" then
			return result
		end
	end

	local CoreGui = game:GetService("CoreGui")

	if pcall(function()
		-- upvalues: CoreGui (ref)
		local ScreenGui = Instance.new("ScreenGui")

		ScreenGui.Name = "Obsidian_Perm_Test"
		ScreenGui.Parent = CoreGui
		ScreenGui:Destroy()
	end) then
		return CoreGui
	end

	return LocalPlayer:FindFirstChild("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui", 5)
end
local function u25(p1)
	-- upvalues: LocalPlayer (ref)
	pcall(function()
		-- upvalues: LocalPlayer (ref), p1 (ref)
		if typeof(gethui) == "function" then
			local v475 = gethui()

			if v475 and v475:FindFirstChild(p1) then
				v475[p1]:Destroy()
			end
		end

		local CoreGui = game:GetService("CoreGui")

		if CoreGui and CoreGui:FindFirstChild(p1) then
			CoreGui[p1]:Destroy()
		end

		if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild(p1) then
			LocalPlayer.PlayerGui[p1]:Destroy()
		end
	end)
end
local function u26(p2)
	local ok, result = pcall(function()
		-- upvalues: p2 (ref)
		return game:HttpGet(p2)
	end)

	if not ok or not result or type(result) ~= "string" then
		warn("[PayomboyZ Loader Error]: Failed to fetch script from URL: " .. tostring(p2))

		return false
	end

	if result:find("404: Not Found") or result:sub(1, 3) == "404" then
		warn("[PayomboyZ Loader Error]: Loader URL returned 404 Not Found: " .. tostring(p2))

		return false
	end

	local v111, v112 = loadstring(result)

	if not v111 then
		warn("[PayomboyZ Loader Error]: Syntax error during loader string parsing: " .. tostring(v112))

		return false
	end

	pcall(v111)

	return true
end
local function u27(p3)
	-- upvalues: ReplicatedStorage (ref), HttpService (ref), u27 (ref)
	local u114 = p3 or ""
	local PlaceId2 = game.PlaceId
	local ok, result = pcall(function()
		-- upvalues: u114 (ref), HttpService (ref), PlaceId2 (ref)
		return HttpService:JSONDecode(game:HttpGet(string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100&cursor=%s", tostring(PlaceId2), tostring(u114))))
	end)

	if not ok or not result or not result.data or #result.data == 0 then
		return false, ""
	end

	local id = nil

	for _, v in ipairs(result.data) do
		if v.playing < v.maxPlayers then
			id = v.id

			break
		end
	end

	if not id and result.nextPageCursor then
		return u27(result.nextPageCursor)
	end

	if not id then
		return false, ""
	end

	return true, (ReplicatedStorage.__ServerBrowser:InvokeServer("teleport", id))
end

local u28 = nil
local u29 = false
local n1 = 0
local u31 = nil
local zero = Vector3.zero

RunService.Stepped:Connect(function()
	-- upvalues: LocalPlayer (ref), u2 (ref)
	if not u2 then
		return
	end

	local _pcall = pcall
	local _sethiddenproperty = sethiddenproperty
	local v123 = LocalPlayer

	_pcall(_sethiddenproperty, v123, "SimulationRadius", math.huge)

	local Character = v123.Character

	if Character then
		local Humanoid = Character:FindFirstChild("Humanoid")

		if Humanoid and Humanoid.Sit then
			Humanoid.Sit = false
		end

		for _, child in ipairs(Character:GetChildren()) do
			if child:IsA("BasePart") then
				child.CanCollide = false
			end
		end
	end
end)
RunService.Heartbeat:Connect(function()
	-- upvalues: zero (ref), u2 (ref), LocalPlayer (ref), u29 (ref)
	if not u2 then
		return
	end

	local Character = LocalPlayer.Character

	if Character then
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		local Humanoid = Character:FindFirstChild("Humanoid")

		if HumanoidRootPart then
			local _StabilizerBG = HumanoidRootPart:FindFirstChild("_StabilizerBG")
			local fixvelo = HumanoidRootPart:FindFirstChild("fixvelo")

			if u29 then
				HumanoidRootPart.AssemblyLinearVelocity = zero
				HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero

				if not _StabilizerBG then
					local BodyGyro = Instance.new("BodyGyro")

					BodyGyro.Name = "_StabilizerBG"

					local n2 = 1000000000

					BodyGyro.MaxTorque = Vector3.new(n2, n2, n2)
					BodyGyro.D = 200
					BodyGyro.P = 10000
					BodyGyro.CFrame = HumanoidRootPart.CFrame
					BodyGyro.Parent = HumanoidRootPart
				else
					_StabilizerBG.CFrame = HumanoidRootPart.CFrame
				end

				if not fixvelo then
					local BodyVelocity = Instance.new("BodyVelocity")

					BodyVelocity.Name = "fixvelo"

					local n3 = 1000000000

					BodyVelocity.MaxForce = Vector3.new(n3, n3, n3)
					BodyVelocity.Velocity = zero
					BodyVelocity.Parent = HumanoidRootPart
				else
					local n4 = 1000000000

					fixvelo.MaxForce = Vector3.new(n4, n4, n4)
					fixvelo.Velocity = zero
				end

				if Humanoid then
					Humanoid.PlatformStand = true
				end
			else
				local _Vector3 = Vector3

				HumanoidRootPart.AssemblyLinearVelocity = _Vector3.zero
				HumanoidRootPart.AssemblyAngularVelocity = _Vector3.zero

				if _StabilizerBG then
					_StabilizerBG:Destroy()
				end

				if fixvelo then
					fixvelo:Destroy()
				end

				if Humanoid then
					Humanoid.PlatformStand = false
				end
			end
		end
	end
end)

local function u33(p4)
	-- upvalues: u2 (ref), LocalPlayer (ref)
	local v140 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local v141 = v140 and v140:FindFirstChild("HumanoidRootPart")

	if not v141 then
		return
	end

	local Magnitude = (v141.Position - p4.Position).Magnitude

	if Magnitude <= 5 then
		v141.CFrame = p4

		return
	end

	local v143 = math.max(1, math.floor(Magnitude / 120))
	local Position = v141.Position
	local p4Position = p4.Position
	local Unit = (p4Position - Position).Unit
	local n5 = 1

	for i = n5, v143, n5 do
		if not u2 or not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			break
		end

		local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart
		local v150 = Position:Lerp(p4Position, i / v143)

		HumanoidRootPart.CFrame = CFrame.new(v150, p4Position)
		HumanoidRootPart.AssemblyLinearVelocity = Unit * 300
		task.wait(0.02)
	end

	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local v151 = LocalPlayer

		v151.Character.HumanoidRootPart.CFrame = p4
		v151.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
	end
end
local function u34(p5, p6)
	-- upvalues: t16 (ref), CommF_ (ref), u28 (ref), u31 (ref), zero (ref), LocalPlayer (ref), TweenService (ref), u29 (ref), n1 (ref)
	local u155 = p6 or 350
	local HumanoidRootPart = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return nil
	end

	local Magnitude = (HumanoidRootPart.Position - p5.Position).Magnitude

	if Magnitude <= 15 then
		if u28 then
			pcall(function()
				-- upvalues: u28 (ref)
				u28:Cancel()
			end)
			u28 = nil
		end

		u29 = false
		zero = Vector3.zero
		HumanoidRootPart.CFrame = p5

		return nil
	end

	local u158 = nil
	local huge = math.huge

	for _, v in ipairs(t16) do
		local Magnitude2 = (v - p5.Position).Magnitude

		if Magnitude2 < huge then
			huge = Magnitude2
			u158 = v
		end
	end

	if u158 and huge < 800 and Magnitude > 1000 and (HumanoidRootPart.Position - u158).Magnitude > 250 and tick() - n1 > 3 then
		n1 = tick()
		u29 = true

		if u28 then
			pcall(function()
				-- upvalues: u28 (ref)
				u28:Cancel()
			end)
			u28 = nil
		end

		pcall(function()
			-- upvalues: u158 (ref), CommF_ (ref)
			CommF_:InvokeServer("requestEntrance", u158)
		end)
		task.wait(0.2)

		local Character = LocalPlayer.Character

		HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return nil
		end

		Magnitude = (HumanoidRootPart.Position - p5.Position).Magnitude
	end

	if not u28 or not u31 or not ((u31.Position - p5.Position).Magnitude < 10) or u28.PlaybackState ~= Enum.PlaybackState.Playing then
		if u28 then
			pcall(function()
				-- upvalues: u28 (ref)
				u28:Cancel()
			end)
			u28 = nil
		end

		u31 = p5
		zero = (p5.Position - HumanoidRootPart.Position).Unit * u155

		local tweenInfo = TweenInfo.new(Magnitude / u155, Enum.EasingStyle.Linear)
		local tween = TweenService:Create(HumanoidRootPart, tweenInfo, {
			CFrame = p5
		})

		u28 = tween
		u29 = true
		tween:Play()
		task.spawn(function()
			-- upvalues: p5 (ref), u28 (ref), u29 (ref), LocalPlayer (ref), zero (ref), tween (ref), u155 (ref)
			while tween and tween.PlaybackState == Enum.PlaybackState.Playing do
				u29 = true

				local v477 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

				if v477 then
					zero = (p5.Position - v477.Position).Unit * u155
				end

				task.wait(0.05)
			end

			if u28 == tween then
				u29 = false
				zero = Vector3.zero
				u28 = nil
			end
		end)

		return tween
	end

	u29 = true

	return u28
end
local function u35(p7)
	-- upvalues: LocalPlayer (ref)
	if not p7 then
		return nil
	end

	local Backpack = LocalPlayer:FindFirstChild("Backpack")

	if Backpack and Backpack:FindFirstChild(p7) then
		return Backpack:FindFirstChild(p7)
	end

	local v168 = nil

	if LocalPlayer.Character then
		for _, child in ipairs(LocalPlayer.Character:GetChildren()) do
			if child:IsA("Tool") and p7 == child.Name then
				v168 = child
			end
		end
	end

	return v168 or LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(p7)
end
local function u36(p8)
	-- upvalues: LocalPlayer (ref)
	if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Humanoid") then
		return
	end

	for _, child in pairs(LocalPlayer.Character:GetChildren()) do
		if child:IsA("Tool") and p8 == child.ToolTip then
			return
		end
	end

	local Backpack = LocalPlayer:FindFirstChild("Backpack")

	if not Backpack then
		return
	end

	for _, child in pairs(Backpack:GetChildren()) do
		if child:IsA("Tool") and p8 == child.ToolTip then
			LocalPlayer.Character.Humanoid:EquipTool(child)

			return
		end
	end
end
local function u37(p9)
	-- upvalues: LocalPlayer (ref)
	local Character = LocalPlayer.Character

	if not Character or not Character:FindFirstChild("Humanoid") then
		return
	end

	local Backpack = LocalPlayer:FindFirstChild("Backpack")
	local v180 = Character:FindFirstChild(p9) or Backpack and Backpack:FindFirstChild(p9)

	if not v180 then
		return
	end

	Character.Humanoid:EquipTool(v180)
end

local u38 = nil
local n6 = 0
local n7 = 0
local n8 = 0
local n9 = 0

local function u43()
	-- upvalues: n8 (ref), n9 (ref), u38 (ref), ReplicatedStorage (ref), n6 (ref)
	pcall(function()
		-- upvalues: n9 (ref), u38 (ref), ReplicatedStorage (ref), n6 (ref), n8 (ref)
		u38 = nil

		local t2 = {
			ReplicatedStorage:FindFirstChild("Util"),
			ReplicatedStorage:FindFirstChild("Remotes"),
			ReplicatedStorage:FindFirstChild("Assets"),
			ReplicatedStorage:FindFirstChild("Common"),
			ReplicatedStorage:FindFirstChild("FX")
		}

		for _, v in ipairs(t2) do
			if v then
				for _, child in ipairs(v:GetChildren()) do
					if child:GetAttribute("Id") and child:IsA("RemoteEvent") then
						u38 = child

						break
					end
				end
			end

			if u38 then
				break
			end
		end

		if ReplicatedStorage:FindFirstChild("Modules") and ReplicatedStorage.Modules:FindFirstChild("Net") and ReplicatedStorage.Modules.Net:FindFirstChild("seed") then
			n6 = ReplicatedStorage.Modules.Net.seed:InvokeServer() * 2
		end

		n8 = tick()
		n9 = 0
	end)
end

u43()
task.spawn(function()
	-- upvalues: u38 (ref), ReplicatedStorage (ref), n8 (ref), n9 (ref), n6 (ref), u2 (ref), u43 (ref)
	while u2 do
		task.wait(30)
		pcall(function()
			-- upvalues: n8 (ref), n9 (ref), n6 (ref), u38 (ref), u43 (ref), ReplicatedStorage (ref)
			if ReplicatedStorage:FindFirstChild("Modules") and ReplicatedStorage.Modules:FindFirstChild("Net") and ReplicatedStorage.Modules.Net:FindFirstChild("seed") then
				n6 = ReplicatedStorage.Modules.Net.seed:InvokeServer() * 2
			end

			if not u38 or not u38.Parent then
				u43()
			end

			n8 = tick()
			n9 = 0
		end)
	end
end)

local function u44()
	-- upvalues: u35 (ref), VirtualInputManager (ref), LocalPlayer (ref)
	pcall(function()
		-- upvalues: VirtualInputManager (ref), LocalPlayer (ref), u35 (ref)
		local v483 = LocalPlayer.PlayerGui:FindFirstChild("Main") and LocalPlayer.PlayerGui.Main:FindFirstChild("Skills")

		if not v483 then
			return
		end

		local v484 = v483:FindFirstChild("Death Step") or v483:FindFirstChild("Black Leg")

		if not v484 then
			return
		end

		local V = v484:FindFirstChild("V")

		if not V then
			return
		end

		local Cooldown = V:FindFirstChild("Cooldown")

		if Cooldown and Cooldown.AbsoluteSize.X <= 0.1 then
			local Name = v484.Name
			local v488 = u35(Name)
			local v489 = Name == "Death Step" and 400 or 150

			if v488 and v488:FindFirstChild("Level") and v489 <= v488.Level.Value then
				local v490 = VirtualInputManager
				local _game2 = game

				v490:SendKeyEvent(true, "V", false, _game2)

				local v492 = false

				VirtualInputManager:SendKeyEvent(v492, "V", v492, _game2)
			end
		end
	end)
end
local function u45(p10)
	-- upvalues: ReplicatedStorage (ref), n9 (ref), CommF_ (ref), n8 (ref), u44 (ref), n7 (ref), n6 (ref), LocalPlayer (ref), u43 (ref), u38 (ref)
	if not getgenv().Configs.FastAttack then
		return
	end

	local timestamp = tick()

	if timestamp - n7 < 0.15 then
		return
	end

	n7 = timestamp
	pcall(function()
		-- upvalues: CommF_ (ref), LocalPlayer (ref)
		local v493 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")

		if v493 then
			v493:Activate()
		end

		if LocalPlayer.Character and not LocalPlayer.Character:FindFirstChild("HasBuso") then
			CommF_:InvokeServer("Buso")
		end
	end)
	u44()

	if not u38 or not u38.Parent then
		u43()
	end

	n9 += 1

	if n9 > 50 or timestamp - n8 > 30 then
		pcall(function()
			-- upvalues: n6 (ref), ReplicatedStorage (ref)
			if ReplicatedStorage.Modules.Net:FindFirstChild("seed") then
				n6 = ReplicatedStorage.Modules.Net.seed:InvokeServer() * 2
			end
		end)
		n8 = timestamp
		n9 = 0
	end

	if not u38 then
		return
	end

	local ServerTimeNow = workspace:GetServerTimeNow()
	local n10 = 10
	local v186 = math.floor(ServerTimeNow / n10 % n10)
	local s1 = ""
	local n11 = 1

	for i = n11, 14, n11 do
		s1 ..= string.char(bit32.bxor(string.byte("RE/RegisterHit", i), v186 + 1))
	end

	local u190 = bit32.bxor((u38:GetAttribute("Id") or 0) + 909090, n6)
	local u191 = tostring(LocalPlayer.UserId):sub(2, 4) .. tostring(math.floor(ServerTimeNow % 10000))

	if type(p10) == "table" and p10[1] and p10[1]:FindFirstChild("Head") then
		pcall(function()
			-- upvalues: p10 (ref), u191 (ref), u38 (ref), s1 (ref), u190 (ref), ReplicatedStorage (ref)
			if ReplicatedStorage.Modules.Net:FindFirstChild("RE/RegisterAttack") then
				ReplicatedStorage.Modules.Net["RE/RegisterAttack"]:FireServer(0)
			end

			local v494 = u38
			local v495 = s1
			local v496 = u190
			local Head = p10[1].Head
			local t3 = {}
			local t4 = {}
			local v500 = p10
			local v501 = v500[1]
			local Head2 = v500[1].Head

			t4[1] = v501
			t4[2] = Head2

			local v503 = v500[1]

			t3[1] = t4
			t3[2] = v503
			v494:FireServer(v495, v496, Head, t3, nil, u191)

			local v504 = ReplicatedStorage.Modules.Net["RE/RegisterHit"]
			local Head3 = v500[1].Head
			local t5 = {}
			local t6 = {}
			local v508 = v500[1]
			local Head4 = v500[1].Head

			t6[1] = v508
			t6[2] = Head4

			local v510 = v500[1]

			t5[1] = t6
			t5[2] = v510
			v504:FireServer(Head3, t5, u191)
		end)
	elseif typeof(p10) == "Instance" and p10:FindFirstChild("Head") then
		pcall(function()
			-- upvalues: p10 (ref), u191 (ref), u38 (ref), s1 (ref), u190 (ref), ReplicatedStorage (ref)
			if ReplicatedStorage.Modules.Net:FindFirstChild("RE/RegisterAttack") then
				ReplicatedStorage.Modules.Net["RE/RegisterAttack"]:FireServer(0)
			end

			local v511 = u38
			local v512 = s1
			local v513 = u190
			local v514 = p10
			local Head = v514.Head
			local t7 = {}
			local t8 = {}
			local Head5 = v514.Head

			t8[1] = v514
			t8[2] = Head5
			t7[1] = t8
			t7[2] = v514
			v511:FireServer(v512, v513, Head, t7, u191)
			ReplicatedStorage.Modules.Net["RE/RegisterHit"]:FireServer(v514.Head, {
				{
					v514,
					v514.Head
				},
				v514
			}, u191)
		end)
	end
end
local function u46()
	-- upvalues: CommF_ (ref), LocalPlayer (ref)
	if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Humanoid") then
		return
	end

	if LocalPlayer.Character.Humanoid.Health == 0 or not LocalPlayer.Character:FindFirstChild("Head") then
		repeat
			task.wait()
		until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0

		if LocalPlayer.Character and not LocalPlayer.Character:FindFirstChild("HasBuso") then
			pcall(function()
				-- upvalues: CommF_ (ref)
				CommF_:InvokeServer("Buso")
			end)
		end
	end
end
local function u47()
	-- upvalues: u23 (ref), CommF_ (ref), u21 (ref), u22 (ref)
	local ok, result = pcall(function()
		-- upvalues: CommF_ (ref)
		return CommF_:InvokeServer("getInventory")
	end)

	if ok and type(result) == "table" then
		for _, v in pairs(result) do
			if type(v) == "table" then
				if v.Name == "Saber" and not u21 then
					u21 = true
				end

				if v.Name == "Pole (1st Form)" and not u22 then
					u22 = true
				end

				if v.Name == "Pole (2nd Form)" and not u23 then
					u23 = true
				end
			end
		end
	end
end

u25("Obsidian_HUD_Status")

local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Name = "Obsidian_HUD_Status"

if not pcall(function()
	-- upvalues: u24 (ref), ScreenGui (ref)
	ScreenGui.Parent = u24()
end) or not ScreenGui.Parent then
	pcall(function()
		-- upvalues: LocalPlayer (ref), ScreenGui (ref)
		ScreenGui.Parent = LocalPlayer:FindFirstChild("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui", 5)
	end)
end

local Frame = Instance.new("Frame")
local n12 = 0

Frame.Size = UDim2.new(n12, 500, n12, 75)
Frame.Position = UDim2.new(0.5, -250, 0, 30)
Frame.BackgroundColor3 = Color3.fromRGB(20, 10, 14)
Frame.BackgroundTransparency = 0.2
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")

UIStroke.Color = Color3.fromRGB(255, 45, 85)
UIStroke.Thickness = 1.5
UIStroke.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")

UIListLayout.Parent = Frame

local _Enum = Enum

UIListLayout.HorizontalAlignment = _Enum.HorizontalAlignment.Center
UIListLayout.VerticalAlignment = _Enum.VerticalAlignment.Center
UIListLayout.SortOrder = _Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

local TextLabel = Instance.new("TextLabel")

TextLabel.Size = UDim2.new(1, -20, 0, 30)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Idling"
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextSize = 18

local n13 = 255

TextLabel.TextColor3 = Color3.fromRGB(n13, n13, n13)
TextLabel.LayoutOrder = 1
TextLabel.Parent = Frame

local TextLabel2 = Instance.new("TextLabel")

TextLabel2.Size = UDim2.new(1, -20, 0, 25)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Text = "No Subtask"
TextLabel2.Font = Enum.Font.GothamSemibold
TextLabel2.TextSize = 14
TextLabel2.TextColor3 = Color3.fromRGB(242, 218, 228)
TextLabel2.LayoutOrder = 2
TextLabel2.Parent = Frame

local TextLabel3 = Instance.new("TextLabel")
local n14 = 0

TextLabel3.Size = UDim2.new(n14, 500, n14, 25)

local n15 = 0

TextLabel3.Position = UDim2.new(0.5, -250, n15, n15)
TextLabel3.BackgroundColor3 = Color3.fromRGB(20, 10, 14)
TextLabel3.BackgroundTransparency = 0.2
TextLabel3.Text = ""
TextLabel3.Font = Enum.Font.GothamBold
TextLabel3.TextSize = 13
TextLabel3.TextColor3 = Color3.fromRGB(255, 55, 85)
TextLabel3.Parent = ScreenGui

local UICorner2 = Instance.new("UICorner")

UICorner2.CornerRadius = UDim.new(0, 8)
UICorner2.Parent = TextLabel3

local UIStroke2 = Instance.new("UIStroke")

UIStroke2.Color = Color3.fromRGB(255, 45, 85)
UIStroke2.Thickness = 1.5
UIStroke2.Parent = TextLabel3
task.spawn(function()
	-- upvalues: TextLabel3 (ref)
	while task.wait(1) do
		local v204 = os.date("*t")

		TextLabel3.Text = string.format("%02d:%02d:%02d  |  %s, %s %d, %d", v204.hour, v204.min, v204.sec, os.date("%A"), os.date("%B"), v204.day, v204.year)
	end
end)
pcall(function()
	-- upvalues: ReplicatedStorage (ref)
	if not identifyexecutor or identifyexecutor() ~= "Solara" then
		require(ReplicatedStorage.Util.CameraShaker):Stop()
	end
end)

local t9 = {
	backdrop = Color3.fromRGB(12, 5, 8),
	shell = Color3.fromRGB(20, 10, 14),
	glass = Color3.fromRGB(32, 14, 20),
	glassDeep = Color3.fromRGB(25, 11, 16),
	glassRaised = Color3.fromRGB(48, 18, 28),
	userPanel = Color3.fromRGB(28, 12, 18),
	surface = Color3.fromRGB(42, 18, 26),
	surfaceRaised = Color3.fromRGB(58, 24, 34),
	surfaceHover = Color3.fromRGB(78, 30, 44),
	surfacePressed = Color3.fromRGB(34, 14, 20),
	input = Color3.fromRGB(20, 9, 13),
	inputFocus = Color3.fromRGB(36, 14, 22),
	divider = Color3.fromRGB(140, 40, 60),
	primary = Color3.fromRGB(255, 45, 85),
	primaryHover = Color3.fromRGB(255, 75, 110),
	primaryPressed = Color3.fromRGB(210, 30, 65),
	secondary = Color3.fromRGB(52, 18, 28)
}
local n16 = 255

t9.text = Color3.fromRGB(n16, n16, n16)
t9.textMuted = Color3.fromRGB(242, 218, 228)
t9.textFaint = Color3.fromRGB(210, 168, 182)
t9.cyan = Color3.fromRGB(255, 55, 85)
t9.success = Color3.fromRGB(46, 224, 140)
t9.warning = Color3.fromRGB(255, 185, 70)

local n17 = 60

t9.danger = Color3.fromRGB(255, n17, n17)
t9.disabled = Color3.fromRGB(50, 25, 32)

local u66 = t9
local _ = {
	Tabs = {},
	ActiveTab = nil,
	CurrentLanguage = "th",
	LangElements = {}
}

local function u68()
	local _pcall = pcall

	_pcall(function()
		local t10 = {
			"PayomboyZ_LuarmorKey.txt",
			"PayomboyZ_VVIPKey.txt",
			"PayomboyZ_SavedKey.txt"
		}

		if LuarmorConfig and type(LuarmorConfig) == "table" and LuarmorConfig.SavedKeyFile then
			table.insert(t10, LuarmorConfig.SavedKeyFile)
		end

		local u520 = type(delfile) == "function" and delfile or type(deletefile) == "function" and deletefile

		for _, v in ipairs(t10) do
			pcall(function()
				-- upvalues: u520 (ref), v (ref)
				if isfile and isfile(v) then
					if u520 then
						u520(v)
					elseif type(writefile) == "function" then
						writefile(v, "")
					end
				end
			end)
		end
	end)
	_pcall(function()
		if getgenv then
			getgenv().script_key = nil
			getgenv().PayomboyZ_InputKey = nil
			getgenv().PayomboyZ_LoggedOut = true
		end

		if getrenv then
			pcall(function()
				getrenv().script_key = nil
			end)
		end

		if getfenv then
			pcall(function()
				getfenv().script_key = nil
			end)
		end

		if _G then
			_G.script_key = nil
		end

		if shared then
			shared.script_key = nil
		end

		script_key = nil
	end)
end
local function u69()
	if getgenv and getgenv().Configs then
		for k, _ in pairs(getgenv().Configs) do
			if type(getgenv().Configs[k]) == "boolean" then
				getgenv().Configs[k] = false
			end
		end
	end

	if _G.GakuranCleanup then
		pcall(_G.GakuranCleanup)
	end

	if _G.ScriptCleanup then
		pcall(_G.ScriptCleanup)
	end

	if _G.PayomboyZCleanup then
		pcall(_G.PayomboyZCleanup)
	end
end
local function u70()
	-- upvalues: SoundService (ref)
	pcall(function()
		-- upvalues: SoundService (ref)
		local Sound = Instance.new("Sound")

		Sound.SoundId = "rbxassetid://6895079853"
		Sound.Volume = 0.3
		Sound.Parent = SoundService
		Sound:Play()
		Sound.Ended:Connect(function()
			-- upvalues: Sound (ref)
			Sound:Destroy()
		end)
	end)
end

function t9.Notify(_, p12)
	-- upvalues: u70 (ref), TweenService (ref), u24 (ref), u66 (ref)
	pcall(function()
		-- upvalues: TweenService (ref), p12 (ref), u24 (ref), u66 (ref), u70 (ref)
		local v524 = p12.Title or "System"
		local v525 = p12.Content or ""

		if not p12.Duration then
		end

		local v526 = u24()
		local ObsidianGlass_NotifHolder = v526:FindFirstChild("ObsidianGlass_NotifHolder")

		if not ObsidianGlass_NotifHolder then
			ObsidianGlass_NotifHolder = Instance.new("ScreenGui")
			ObsidianGlass_NotifHolder.Name = "ObsidianGlass_NotifHolder"
			ObsidianGlass_NotifHolder.ResetOnSpawn = false
			ObsidianGlass_NotifHolder.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			ObsidianGlass_NotifHolder.Parent = v526
		end

		local Frame2 = Instance.new("Frame")
		local n18 = 0

		Frame2.Size = UDim2.new(n18, 300, n18, 65)

		local n19 = 1

		Frame2.Position = UDim2.new(n19, 20, n19, -85)
		Frame2.BackgroundColor3 = u66.glass
		Frame2.BackgroundTransparency = 0.15
		Frame2.BorderSizePixel = 0
		Frame2.Parent = ObsidianGlass_NotifHolder

		local UICorner3 = Instance.new("UICorner")

		UICorner3.CornerRadius = UDim.new(0, 10)
		UICorner3.Parent = Frame2

		local UIStroke3 = Instance.new("UIStroke")

		UIStroke3.Color = u66.cyan
		UIStroke3.Thickness = 1.5
		UIStroke3.Parent = Frame2

		local TextLabel4 = Instance.new("TextLabel")

		TextLabel4.Size = UDim2.new(1, -20, 0, 22)

		local n20 = 0

		TextLabel4.Position = UDim2.new(n20, 10, n20, 6)
		TextLabel4.BackgroundTransparency = 1
		TextLabel4.Text = v524
		TextLabel4.TextColor3 = u66.cyan

		local _Enum2 = Enum

		TextLabel4.Font = _Enum2.Font.GothamBold
		TextLabel4.TextSize = 13
		TextLabel4.TextXAlignment = _Enum2.TextXAlignment.Left
		TextLabel4.Parent = Frame2

		local TextLabel5 = Instance.new("TextLabel")

		TextLabel5.Size = UDim2.new(1, -20, 0, 32)

		local n21 = 0

		TextLabel5.Position = UDim2.new(n21, 10, n21, 26)
		TextLabel5.BackgroundTransparency = 1
		TextLabel5.Text = v525
		TextLabel5.TextColor3 = u66.text

		local _Enum3 = Enum

		TextLabel5.Font = _Enum3.Font.Gotham
		TextLabel5.TextSize = 11
		TextLabel5.TextWrapped = true
		TextLabel5.TextXAlignment = _Enum3.TextXAlignment.Left
		TextLabel5.Parent = Frame2
		u70()

		local v539 = TweenService
		local v540 = Frame2
		local new = TweenInfo.new
		local _Enum4 = Enum
		local v543 = new(0.3, _Enum4.EasingStyle.Quart, _Enum4.EasingDirection.Out)
		local t11 = {}
		local n22 = 1

		t11.Position = UDim2.new(n22, -320, n22, -85)
		v539:Create(v540, v543, t11):Play()
		task:delay(function()
			-- upvalues: TweenService (ref), Frame2 (ref)
			if Frame2 and Frame2.Parent then
				local v614 = TweenService
				local v615 = Frame2
				local new2 = TweenInfo.new
				local _Enum5 = Enum
				local v618 = new2(0.3, _Enum5.EasingStyle.Quart, _Enum5.EasingDirection.In)
				local t12 = {}
				local n23 = 1

				t12.Position = UDim2.new(n23, 20, n23, -85)

				local v621 = v614:Create(v615, v618, t12)

				v621:Play()
				v621.Completed:Connect(function()
					-- upvalues: Frame2 (ref)
					Frame2:Destroy()
				end)
			end
		end)
	end)
end
function t9.CreateWindow(_, p14)
	-- upvalues: TweenService (ref), u69 (ref), u24 (ref), UserInputService (ref), t9 (ref), u25 (ref), u70 (ref), LocalPlayer (ref), RunService (ref), u2 (ref), u68 (ref), Stats (ref), u26 (ref), u66 (ref)
	u25("ObsidianGlass2_BloxFruits")

	local ScreenGui2 = Instance.new("ScreenGui")

	ScreenGui2.Name = "ObsidianGlass2_BloxFruits"
	ScreenGui2.ResetOnSpawn = false
	ScreenGui2.IgnoreGuiInset = true
	ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	if not pcall(function()
		-- upvalues: u24 (ref), ScreenGui2 (ref)
		ScreenGui2.Parent = u24()
	end) or not ScreenGui2.Parent then
		pcall(function()
			-- upvalues: LocalPlayer (ref), ScreenGui2 (ref)
			ScreenGui2.Parent = LocalPlayer:FindFirstChild("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui", 5)
		end)
	end

	local UIScale = Instance.new("UIScale")
	local CurrentCamera = workspace.CurrentCamera

	local function v216()
		-- upvalues: UIScale (ref), CurrentCamera (ref)
		if CurrentCamera and CurrentCamera.ViewportSize then
			local ViewportSize = CurrentCamera.ViewportSize
			local v547 = (ViewportSize.X - 24) / 920
			local v548 = (ViewportSize.Y - 24) / 600
			local v549 = UIScale
			local _math = math

			v549.Scale = _math.clamp(_math.min(v547, v548), 0.45, 1)
		end
	end

	v216()

	if CurrentCamera then
		CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v216)
	end

	UIScale.Parent = ScreenGui2

	local Frame3 = Instance.new("Frame")

	Frame3.Name = "MainShell"
	Frame3.Size = UDim2.fromOffset(920, 600)

	local n24 = 0.5

	Frame3.AnchorPoint = Vector2.new(n24, n24)

	local n25 = 0.5
	local n26 = 0

	Frame3.Position = UDim2.new(n25, n26, n25, n26)
	Frame3.BackgroundColor3 = u66.shell
	Frame3.BackgroundTransparency = 0.2
	Frame3.BorderSizePixel = 0
	Frame3.ClipsDescendants = true
	Frame3.Parent = ScreenGui2

	local UICorner4 = Instance.new("UICorner")

	UICorner4.CornerRadius = UDim.new(0, 18)
	UICorner4.Parent = Frame3

	local UIStroke4 = Instance.new("UIStroke")

	UIStroke4.Color = u66.cyan
	UIStroke4.Thickness = 1.5
	UIStroke4.Transparency = 0.3
	UIStroke4.Parent = Frame3

	local Frame4 = Instance.new("Frame")

	Frame4.Name = "SnowLayer"

	local n27 = 1

	Frame4.Size = UDim2.fromScale(n27, n27)
	Frame4.BackgroundTransparency = 1
	Frame4.ZIndex = 2
	Frame4.Parent = Frame3
	task.spawn(function()
		-- upvalues: ScreenGui2 (ref), Frame4 (ref), u2 (ref)
		local t13 = {}
		local n28 = 1

		for _ = n28, 30, n28 do
			local Frame5 = Instance.new("Frame")

			Frame5.Size = UDim2.fromOffset(math.random(2, 4), math.random(2, 4))
			Frame5.Position = UDim2.new(math.random(), 0, math.random(), 0)
			Frame5.BackgroundColor3 = Color3.fromRGB(220, 240, 255)
			Frame5.BackgroundTransparency = math.random(30, 70) / 100
			Frame5.BorderSizePixel = 0
			Frame5.Parent = Frame4

			local UICorner5 = Instance.new("UICorner")

			UICorner5.CornerRadius = UDim.new(1, 0)
			UICorner5.Parent = Frame5
			t13[#t13 + 1] = {
				frame = Frame5,
				speed = math.random(15, 35) / 10000,
				drift = math.random(-10, 10) / 10000,
				pos = Frame5.Position.Y.Scale
			}
		end

		while u2 and task.wait(0.03) and (ScreenGui2 and ScreenGui2.Parent) do
			for _, v in ipairs(t13) do
				v.pos = v.pos + v.speed

				if v.pos > 1.05 then
					v.pos = -0.05
				end

				local v558 = (v.frame.Position.X.Scale + v.drift) % 1
				local n29 = 0

				v.frame.Position = UDim2.new(v558, n29, v.pos, n29)
			end
		end
	end)

	local Frame6 = Instance.new("Frame")

	Frame6.Name = "ObsidianToggleCapsule"
	Frame6.Size = UDim2.fromOffset(230, 58)
	Frame6.Position = UDim2.new(0, 15, 0.5, -29)
	Frame6.BackgroundColor3 = u66.shell
	Frame6.BackgroundTransparency = 0.18
	Frame6.BorderSizePixel = 0
	Frame6.ClipsDescendants = true
	Frame6.ZIndex = 99999
	Frame6.Parent = ScreenGui2

	local UICorner6 = Instance.new("UICorner")

	UICorner6.CornerRadius = UDim.new(0, 16)
	UICorner6.Parent = Frame6

	local UIStroke5 = Instance.new("UIStroke")

	UIStroke5.Color = u66.cyan
	UIStroke5.Thickness = 1.5
	UIStroke5.Transparency = 0.2
	UIStroke5.Parent = Frame6

	local Frame7 = Instance.new("Frame")
	local n30 = 42

	Frame7.Size = UDim2.fromOffset(n30, n30)
	Frame7.Position = UDim2.new(0, 8, 0.5, -21)
	Frame7.BackgroundColor3 = u66.glassDeep
	Frame7.BorderSizePixel = 0
	Frame7.ZIndex = 3
	Frame7.Parent = Frame6

	local UICorner7 = Instance.new("UICorner")

	UICorner7.CornerRadius = UDim.new(1, 0)
	UICorner7.Parent = Frame7

	local ImageLabel = Instance.new("ImageLabel")
	local n31 = 1

	ImageLabel.Size = UDim2.fromScale(n31, n31)
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
	ImageLabel.ZIndex = 4
	ImageLabel.Parent = Frame7

	local UICorner8 = Instance.new("UICorner")

	UICorner8.CornerRadius = UDim.new(1, 0)
	UICorner8.Parent = ImageLabel

	local TextLabel6 = Instance.new("TextLabel")

	TextLabel6.Size = UDim2.new(1, -58, 0, 18)

	local n32 = 0

	TextLabel6.Position = UDim2.new(n32, 56, n32, 10)
	TextLabel6.BackgroundTransparency = 1
	TextLabel6.Text = "@" .. LocalPlayer.Name
	TextLabel6.TextColor3 = u66.text

	local _Enum6 = Enum

	TextLabel6.Font = _Enum6.Font.GothamBold
	TextLabel6.TextSize = 12
	TextLabel6.TextXAlignment = _Enum6.TextXAlignment.Left
	TextLabel6.ZIndex = 3
	TextLabel6.Parent = Frame6

	local TextLabel7 = Instance.new("TextLabel")

	TextLabel7.Size = UDim2.new(1, -58, 0, 16)

	local n33 = 0

	TextLabel7.Position = UDim2.new(n33, 56, n33, 28)
	TextLabel7.BackgroundTransparency = 1
	TextLabel7.Text = "⚡ 60 FPS  •  📡 0 ms"
	TextLabel7.TextColor3 = u66.cyan

	local _Enum7 = Enum

	TextLabel7.Font = _Enum7.Font.GothamBold
	TextLabel7.TextSize = 10
	TextLabel7.TextXAlignment = _Enum7.TextXAlignment.Left
	TextLabel7.ZIndex = 3
	TextLabel7.Parent = Frame6
	task.spawn(function()
		-- upvalues: TextLabel7 (ref), RunService (ref), u2 (ref), ScreenGui2 (ref), Stats (ref)
		local n34 = 0
		local timestamp = tick()
		local n35 = 60
		local RenderStepped = RunService.RenderStepped

		RenderStepped:Connect(function()
			-- upvalues: n35 (ref), n34 (ref), timestamp (ref)
			n34 += 1

			local timestamp2 = tick()

			if timestamp2 - timestamp >= 1 then
				n35 = n34
				n34 = 0
				timestamp = timestamp2
			end
		end)

		while true do
			if not u2 or not task.wait(0.8) or (not ScreenGui2 or not ScreenGui2.Parent) then
				break
			end

			RenderStepped = 0
			pcall(function()
				-- upvalues: Stats (ref), RenderStepped (ref)
				RenderStepped = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
			end)
			TextLabel7.Text = string.format("⚡ %d FPS  •  📡 %d ms", n35, RenderStepped)
		end
	end)

	local TextButton = Instance.new("TextButton")
	local n36 = 1

	TextButton.Size = UDim2.fromScale(n36, n36)
	TextButton.BackgroundTransparency = 1
	TextButton.Text = ""
	TextButton.ZIndex = 10
	TextButton.Parent = Frame6

	local u242 = nil
	local u243 = nil
	local inputPosition = nil
	local Frame6Position = nil
	local u246 = false

	TextButton.InputBegan:Connect(function(input)
		-- upvalues: Frame6 (ref), u242 (ref), u246 (ref), inputPosition (ref), Frame6Position (ref)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			u242 = true
			u246 = false
			inputPosition = input.Position
			Frame6Position = Frame6.Position
			input.Changed:Connect(function()
				-- upvalues: u242 (ref), input (ref)
				if input.UserInputState == Enum.UserInputState.End then
					u242 = false
				end
			end)
		end
	end)
	TextButton.InputChanged:Connect(function(input)
		-- upvalues: u243 (ref)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			u243 = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		-- upvalues: Frame6 (ref), Frame6Position (ref), u242 (ref), inputPosition (ref), u246 (ref), u243 (ref)
		if input == u243 and u242 then
			local v568 = input.Position - inputPosition

			if math.abs(v568.X) > 3 or math.abs(v568.Y) > 3 then
				u246 = true
			end

			local v569 = Frame6
			local new = UDim2.new
			local v571 = Frame6Position

			v569.Position = new(v571.X.Scale, v571.X.Offset + v568.X, v571.Y.Scale, v571.Y.Offset + v568.Y)
		end
	end)
	TextButton.MouseButton1Click:Connect(function()
		-- upvalues: Frame3 (ref), u246 (ref), u70 (ref)
		if not u246 then
			u70()

			local v572 = Frame3

			v572.Visible = not v572.Visible
		end
	end)
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		-- upvalues: Frame3 (ref)
		if gameProcessed then
			return
		end

		if input.KeyCode == Enum.KeyCode.K or input.KeyCode == Enum.KeyCode.RightControl then
			local v575 = Frame3

			v575.Visible = not v575.Visible
		end
	end)

	local Frame8 = Instance.new("Frame")

	Frame8.Name = "UserPanel"

	local n37 = 0

	Frame8.Size = UDim2.new(n37, 240, 1, n37)
	Frame8.BackgroundColor3 = u66.userPanel
	Frame8.BackgroundTransparency = 0.2
	Frame8.BorderSizePixel = 0
	Frame8.ZIndex = 5
	Frame8.Parent = Frame3

	local Frame9 = Instance.new("Frame")
	local n38 = 44

	Frame9.Size = UDim2.fromOffset(n38, n38)

	local n39 = 0
	local n40 = 14

	Frame9.Position = UDim2.new(n39, n40, n39, n40)
	Frame9.BackgroundColor3 = u66.glassDeep
	Frame9.BorderSizePixel = 0
	Frame9.ZIndex = 10
	Frame9.Parent = Frame8

	local UICorner9 = Instance.new("UICorner")

	UICorner9.CornerRadius = UDim.new(1, 0)
	UICorner9.Parent = Frame9

	local ImageLabel2 = Instance.new("ImageLabel")
	local n41 = 1

	ImageLabel2.Size = UDim2.fromScale(n41, n41)
	ImageLabel2.BackgroundTransparency = 1
	ImageLabel2.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
	ImageLabel2.ZIndex = 11
	ImageLabel2.Parent = Frame9

	local TextLabel8 = Instance.new("TextLabel")

	TextLabel8.Size = UDim2.new(1, -75, 0, 18)

	local n42 = 0

	TextLabel8.Position = UDim2.new(n42, 66, n42, 15)
	TextLabel8.BackgroundTransparency = 1
	TextLabel8.Text = LocalPlayer.DisplayName
	TextLabel8.TextColor3 = u66.text

	local _Enum8 = Enum

	TextLabel8.Font = _Enum8.Font.GothamBold
	TextLabel8.TextSize = 13
	TextLabel8.TextXAlignment = _Enum8.TextXAlignment.Left
	TextLabel8.ZIndex = 10
	TextLabel8.Parent = Frame8

	local TextLabel9 = Instance.new("TextLabel")

	TextLabel9.Size = UDim2.new(1, -75, 0, 14)

	local n43 = 0

	TextLabel9.Position = UDim2.new(n43, 66, n43, 33)
	TextLabel9.BackgroundTransparency = 1
	TextLabel9.Text = "@" .. LocalPlayer.Name
	TextLabel9.TextColor3 = u66.textMuted

	local _Enum9 = Enum

	TextLabel9.Font = _Enum9.Font.Gotham
	TextLabel9.TextSize = 10
	TextLabel9.TextXAlignment = _Enum9.TextXAlignment.Left
	TextLabel9.ZIndex = 10
	TextLabel9.Parent = Frame8

	local TextButton2 = Instance.new("TextButton")

	TextButton2.Name = "LogoutButton"
	TextButton2.Size = UDim2.fromOffset(62, 24)
	TextButton2.Position = UDim2.new(1, -74, 0, 20)

	local v263 = u66

	TextButton2.BackgroundColor3 = v263.surfacePressed
	TextButton2.BackgroundTransparency = 0.2
	TextButton2.Text = "Log out"
	TextButton2.TextColor3 = v263.danger
	TextButton2.Font = Enum.Font.GothamBold
	TextButton2.TextSize = 11
	TextButton2.ZIndex = 12
	TextButton2.Parent = Frame8

	local UICorner10 = Instance.new("UICorner")

	UICorner10.CornerRadius = UDim.new(0, 6)
	UICorner10.Parent = TextButton2

	local UIStroke6 = Instance.new("UIStroke")

	UIStroke6.Color = u66.danger
	UIStroke6.Thickness = 1
	UIStroke6.Transparency = 0.4
	UIStroke6.Parent = TextButton2
	TextButton2.MouseEnter:Connect(function()
		-- upvalues: UIStroke6 (ref), TweenService (ref), TextButton2 (ref), u66 (ref)
		TweenService:Create(TextButton2, TweenInfo.new(0.2), {
			BackgroundColor3 = u66.danger,
			BackgroundTransparency = 0.15
		}):Play()
		TweenService:Create(UIStroke6, TweenInfo.new(0.2), {
			Transparency = 0
		}):Play()

		local n44 = 255

		TextButton2.TextColor3 = Color3.fromRGB(n44, n44, n44)
	end)
	TextButton2.MouseLeave:Connect(function()
		-- upvalues: UIStroke6 (ref), TweenService (ref), TextButton2 (ref), u66 (ref)
		local v577 = TweenService
		local v578 = TextButton2
		local tweenInfo = TweenInfo.new(0.2)
		local t14 = {}
		local v581 = u66

		t14.BackgroundColor3 = v581.surfacePressed
		t14.BackgroundTransparency = 0.2
		v577:Create(v578, tweenInfo, t14):Play()
		TweenService:Create(UIStroke6, TweenInfo.new(0.2), {
			Transparency = 0.4
		}):Play()
		TextButton2.TextColor3 = v581.danger
	end)
	TextButton2.MouseButton1Click:Connect(function()
		-- upvalues: u26 (ref), u70 (ref), u69 (ref), u68 (ref), ScreenGui2 (ref)
		u70()
		u69()
		u68()

		if ScreenGui2 then
			pcall(function()
				-- upvalues: ScreenGui2 (ref)
				ScreenGui2:Destroy()
			end)
		end

		u26("https://raw.githubusercontent.com/aslamdunk7/paypmboygang/refs/heads/main/Start")
	end)

	local ScrollingFrame = Instance.new("ScrollingFrame")

	ScrollingFrame.Name = "VerticalTabScroll"

	local n45 = 1

	ScrollingFrame.Size = UDim2.new(n45, -20, n45, -120)

	local n46 = 0

	ScrollingFrame.Position = UDim2.new(n46, 10, n46, 70)
	ScrollingFrame.BackgroundTransparency = 1
	ScrollingFrame.ScrollBarThickness = 3
	ScrollingFrame.ScrollBarImageColor3 = u66.cyan

	local n47 = 0

	ScrollingFrame.CanvasSize = UDim2.new(n47, n47, n47, n47)
	ScrollingFrame.ZIndex = 10
	ScrollingFrame.Parent = Frame8

	local UIListLayout2 = Instance.new("UIListLayout")

	UIListLayout2.FillDirection = Enum.FillDirection.Vertical
	UIListLayout2.Padding = UDim.new(0, 6)
	UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout2.Parent = ScrollingFrame
	UIListLayout2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		-- upvalues: UIListLayout2 (ref), ScrollingFrame (ref)
		local n48 = 0

		ScrollingFrame.CanvasSize = UDim2.new(n48, n48, n48, UIListLayout2.AbsoluteContentSize.Y + 10)
	end)

	local Frame10 = Instance.new("Frame")

	Frame10.Name = "MainPanel"

	local n49 = 1

	Frame10.Size = UDim2.new(n49, -240, n49, 0)

	local n50 = 0

	Frame10.Position = UDim2.new(n50, 240, n50, n50)
	Frame10.BackgroundTransparency = 1
	Frame10.ZIndex = 5
	Frame10.Parent = Frame3

	local Frame11 = Instance.new("Frame")
	local n51 = 0

	Frame11.Size = UDim2.new(1, n51, n51, 48)
	Frame11.BackgroundTransparency = 1
	Frame11.Parent = Frame10

	local TextLabel10 = Instance.new("TextLabel")
	local n52 = 0

	TextLabel10.Size = UDim2.new(n52, 300, n52, 22)

	local n53 = 0

	TextLabel10.Position = UDim2.new(n53, 20, n53, 8)
	TextLabel10.BackgroundTransparency = 1
	TextLabel10.Text = p14.Title or "Blox Fruits Kaitun Hub"
	TextLabel10.TextColor3 = u66.text

	local _Enum10 = Enum

	TextLabel10.Font = _Enum10.Font.GothamBold
	TextLabel10.TextSize = 18
	TextLabel10.TextXAlignment = _Enum10.TextXAlignment.Left
	TextLabel10.Parent = Frame11

	local TextLabel11 = Instance.new("TextLabel")
	local n54 = 0

	TextLabel11.Size = UDim2.new(n54, 350, n54, 16)

	local n55 = 0

	TextLabel11.Position = UDim2.new(n55, 20, n55, 28)
	TextLabel11.BackgroundTransparency = 1
	TextLabel11.Text = p14.SubTitle or "Obsidian Glassmorphic 2 Engine"
	TextLabel11.TextColor3 = u66.textMuted

	local _Enum11 = Enum

	TextLabel11.Font = _Enum11.Font.Gotham
	TextLabel11.TextSize = 11
	TextLabel11.TextXAlignment = _Enum11.TextXAlignment.Left
	TextLabel11.Parent = Frame11

	local TextButton3 = Instance.new("TextButton")

	TextButton3.Size = UDim2.fromOffset(80, 28)
	TextButton3.Position = UDim2.new(1, -125, 0, 10)

	local v285 = u66

	TextButton3.BackgroundColor3 = v285.glass
	TextButton3.BackgroundTransparency = 0.2
	TextButton3.Text = "🇹🇭 ภาษาไทย"
	TextButton3.TextColor3 = v285.cyan
	TextButton3.Font = Enum.Font.GothamBold
	TextButton3.TextSize = 11
	TextButton3.Parent = Frame11

	local UICorner11 = Instance.new("UICorner")

	UICorner11.CornerRadius = UDim.new(0, 8)
	UICorner11.Parent = TextButton3

	local u287 = t9.CurrentLanguage == "th"

	TextButton3.MouseButton1Click:Connect(function()
		-- upvalues: TextLabel11 (ref), u70 (ref), u287 (ref), t9 (ref), TextButton3 (ref)
		u70()
		u287 = not u287
		t9.CurrentLanguage = u287 and "th" or "en"
		TextButton3.Text = u287 and "🇹🇭 ภาษาไทย" or "🇬🇧 English"
		TextLabel11.Text = u287 and "สคริปต์ออโต้ฟาร์มไก่ตัน Blox Fruits | Obsidian Glassmorphic 2 Engine" or "Blox Fruits Kaitun Hub | Obsidian Glassmorphic 2 Engine"

		for _, v in ipairs(t9.LangElements) do
			if v.instance and v.instance.Parent then
				v.instance.Text = u287 and v.th or v.en
			end
		end

		t9:Notify({
			Title = "PayomboyZ HUB",
			Content = u287 and "เปลี่ยนภาษาเป็น ภาษาไทย เรียบร้อยแล้ว!" or "Switched language to English!"
		})
	end)

	local TextButton4 = Instance.new("TextButton")
	local n56 = 28

	TextButton4.Size = UDim2.fromOffset(n56, n56)
	TextButton4.Position = UDim2.new(1, -38, 0, 10)

	local v290 = u66

	TextButton4.BackgroundColor3 = v290.glass
	TextButton4.BackgroundTransparency = 0.2
	TextButton4.Text = "X"
	TextButton4.TextColor3 = v290.textMuted
	TextButton4.Font = Enum.Font.GothamBold
	TextButton4.TextSize = 14
	TextButton4.Parent = Frame11

	local UICorner12 = Instance.new("UICorner")

	UICorner12.CornerRadius = UDim.new(0, 8)
	UICorner12.Parent = TextButton4
	TextButton4.MouseButton1Click:Connect(function()
		-- upvalues: Frame3 (ref), u70 (ref)
		u70()
		Frame3.Visible = false
	end)

	local Frame12 = Instance.new("Frame")

	Frame12.Name = "PageContainer"

	local n57 = 1

	Frame12.Size = UDim2.new(n57, -20, n57, -58)

	local n58 = 0

	Frame12.Position = UDim2.new(n58, 10, n58, 48)

	local n59 = 1

	Frame12.BackgroundTransparency = n59
	Frame12.Parent = Frame10

	function n59.CreateTab(_, p16)
		-- upvalues: u70 (ref), TweenService (ref), u66 (ref), ScrollingFrame (ref), Frame12 (ref), t9 (ref)
		local u587 = p16.NameTH or p16.Name or "Tab"
		local v588 = p16.NameEN or p16.Name or "Tab"
		local v589 = p16.Icon or ""
		local v590 = v589 ~= "" and v589 .. "  " or ""
		local v591 = v590 .. (t9.CurrentLanguage == "th" and u587 or v588)
		local TextButton5 = Instance.new("TextButton")
		local n60 = 0

		TextButton5.Size = UDim2.new(1, n60, n60, 36)

		local v594 = u66

		TextButton5.BackgroundColor3 = v594.surface
		TextButton5.BackgroundTransparency = 0.5
		TextButton5.Text = v591
		TextButton5.TextColor3 = v594.textMuted

		local _Enum12 = Enum

		TextButton5.Font = _Enum12.Font.GothamBold
		TextButton5.TextSize = 13
		TextButton5.TextXAlignment = _Enum12.TextXAlignment.Left
		TextButton5.Parent = ScrollingFrame
		table.insert(t9.LangElements, {
			instance = TextButton5,
			th = v590 .. u587,
			en = v590 .. v588
		})

		local UIPadding = Instance.new("UIPadding")

		UIPadding.PaddingLeft = UDim.new(0, 12)
		UIPadding.Parent = TextButton5

		local UICorner13 = Instance.new("UICorner")

		UICorner13.CornerRadius = UDim.new(0, 10)
		UICorner13.Parent = TextButton5

		local ScrollingFrame2 = Instance.new("ScrollingFrame")

		ScrollingFrame2.Name = "Page_" .. u587

		local n61 = 1

		ScrollingFrame2.Size = UDim2.fromScale(n61, n61)
		ScrollingFrame2.BackgroundTransparency = 1
		ScrollingFrame2.Visible = false
		ScrollingFrame2.ScrollBarThickness = 4
		ScrollingFrame2.ScrollBarImageColor3 = u66.cyan

		local n62 = 0

		ScrollingFrame2.CanvasSize = UDim2.new(n62, n62, n62, n62)
		ScrollingFrame2.Parent = Frame12

		local UIListLayout3 = Instance.new("UIListLayout")

		UIListLayout3.FillDirection = Enum.FillDirection.Vertical
		UIListLayout3.Padding = UDim.new(0, 8)
		UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout3.Parent = ScrollingFrame2
		UIListLayout3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			-- upvalues: UIListLayout3 (ref), ScrollingFrame2 (ref)
			local n63 = 0

			ScrollingFrame2.CanvasSize = UDim2.new(n63, n63, n63, UIListLayout3.AbsoluteContentSize.Y + 15)
		end)

		local function u602()
			-- upvalues: u587 (ref), t9 (ref), u66 (ref), TextButton5 (ref), ScrollingFrame2 (ref)
			for _, v in ipairs(t9.Tabs) do
				local btn = v.btn
				local v627 = u66

				btn.BackgroundColor3 = v627.surface
				v.btn.BackgroundTransparency = 0.5
				v.btn.TextColor3 = v627.textMuted
				v.page.Visible = false
			end

			local v628 = TextButton5
			local v629 = u66

			v628.BackgroundColor3 = v629.primary
			v628.BackgroundTransparency = 0.2
			v628.TextColor3 = v629.text
			ScrollingFrame2.Visible = true
			t9.ActiveTab = u587
		end

		TextButton5.MouseButton1Click:Connect(function()
			-- upvalues: u602 (ref), u70 (ref)
			u70()
			u602()
		end)
		table.insert(t9.Tabs, {
			btn = TextButton5,
			page = ScrollingFrame2
		})

		if #t9.Tabs == 1 then
			u602()
		end

		return {
			AddToggle = function(_, p18)
				-- upvalues: u70 (ref), u66 (ref), ScrollingFrame2 (ref), t9 (ref), TweenService (ref)
				local v632 = p18.NameTH or p18.Name or "Toggle"
				local v633 = p18.NameEN or p18.Name or "Toggle"
				local v634 = p18.Default or false
				local u635 = p18.Callback or function()
				end
				local Frame13 = Instance.new("Frame")

				Frame13.Size = UDim2.new(1, -10, 0, 42)
				Frame13.BackgroundColor3 = u66.glassDeep
				Frame13.BackgroundTransparency = 0.2
				Frame13.Parent = ScrollingFrame2

				local UICorner14 = Instance.new("UICorner")

				UICorner14.CornerRadius = UDim.new(0, 8)
				UICorner14.Parent = Frame13

				local TextLabel12 = Instance.new("TextLabel")
				local n64 = 1

				TextLabel12.Size = UDim2.new(n64, -60, n64, 0)

				local n65 = 0

				TextLabel12.Position = UDim2.new(n65, 12, n65, n65)
				TextLabel12.BackgroundTransparency = 1
				TextLabel12.Text = t9.CurrentLanguage == "th" and v632 or v633
				TextLabel12.TextColor3 = u66.text

				local _Enum13 = Enum

				TextLabel12.Font = _Enum13.Font.GothamBold
				TextLabel12.TextSize = 13
				TextLabel12.TextXAlignment = _Enum13.TextXAlignment.Left
				TextLabel12.Parent = Frame13
				table.insert(t9.LangElements, {
					instance = TextLabel12,
					th = v632,
					en = v633
				})

				local TextButton6 = Instance.new("TextButton")

				TextButton6.Size = UDim2.fromOffset(40, 22)
				TextButton6.Position = UDim2.new(1, -48, 0.5, -11)
				TextButton6.BackgroundColor3 = v634 and u66.primary or u66.surface
				TextButton6.Text = ""
				TextButton6.Parent = Frame13

				local UICorner15 = Instance.new("UICorner")

				UICorner15.CornerRadius = UDim.new(1, 0)
				UICorner15.Parent = TextButton6

				local Frame14 = Instance.new("Frame")
				local n66 = 16

				Frame14.Size = UDim2.fromOffset(n66, n66)
				Frame14.Position = v634 and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
				Frame14.BackgroundColor3 = u66.text
				Frame14.Parent = TextButton6

				local UICorner16 = Instance.new("UICorner")

				UICorner16.CornerRadius = UDim.new(1, 0)
				UICorner16.Parent = Frame14

				local u647 = v634

				TextButton6.MouseButton1Click:Connect(function()
					-- upvalues: TweenService (ref), u635 (ref), u647 (ref), TextButton6 (ref), u66 (ref), u70 (ref), Frame14 (ref)
					u70()
					u647 = not u647
					TextButton6.BackgroundColor3 = u647 and u66.primary or u66.surface
					TweenService:Create(Frame14, TweenInfo.new(0.2), {
						Position = u647 and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
					}):Play()
					pcall(u635, u647)
				end)
			end,
			AddButton = function(_, p20)
				-- upvalues: u70 (ref), u66 (ref), t9 (ref), ScrollingFrame2 (ref)
				local v650 = p20.NameTH or p20.Name or "Button"
				local v651 = p20.NameEN or p20.Name or "Button"
				local u652 = p20.Callback or function()
				end
				local TextButton7 = Instance.new("TextButton")

				TextButton7.Size = UDim2.new(1, -10, 0, 38)
				TextButton7.BackgroundColor3 = u66.surfaceRaised
				TextButton7.BackgroundTransparency = 0.2
				TextButton7.Text = t9.CurrentLanguage == "th" and v650 or v651
				TextButton7.TextColor3 = u66.text
				TextButton7.Font = Enum.Font.GothamBold
				TextButton7.TextSize = 13
				TextButton7.Parent = ScrollingFrame2
				table.insert(t9.LangElements, {
					instance = TextButton7,
					th = v650,
					en = v651
				})

				local UICorner17 = Instance.new("UICorner")

				UICorner17.CornerRadius = UDim.new(0, 8)
				UICorner17.Parent = TextButton7
				TextButton7.MouseButton1Click:Connect(function()
					-- upvalues: u652 (ref), u70 (ref)
					u70()
					pcall(u652)
				end)
			end
		}
	end

	return n59
end

local v71 = t9:CreateWindow({
	Title = "PayomboyZ HUB",
	SubTitle = "สคริปต์ออโต้ฟาร์มไก่ตัน Blox Fruits | Obsidian Glassmorphic 2 Engine"
})
local v72 = v71:CreateTab({
	NameTH = "⚔\239\184\143 ออโต้ฟาร์ม (Auto Farm)",
	NameEN = "⚔\239\184\143 Auto Farm",
	Icon = ""
})
local v73 = v71:CreateTab({
	NameTH = "🥋 สำนักหมัด & ไก่ตัน",
	NameEN = "🥋 Kaitun & Melee",
	Icon = ""
})
local v74 = v71:CreateTab({
	NameTH = "🧩 ปริศนา & เควสต์เปิดโลก",
	NameEN = "🧩 Puzzles & World",
	Icon = ""
})
local v75 = v71:CreateTab({
	NameTH = "🍎 ผลไม้ & ไอเทม",
	NameEN = "🍎 Fruits & Items",
	Icon = ""
})
local v76 = v71:CreateTab({
	NameTH = "📊 อัปสเตตัส (Auto Stats)",
	NameEN = "📊 Auto Stats",
	Icon = ""
})
local v77 = v71:CreateTab({
	NameTH = "⚡ ตั้งค่า & อื่นๆ",
	NameEN = "⚡ Misc & Options",
	Icon = ""
})

v72:AddToggle({
	NameTH = "ออโต้ฟาร์มเลเวล (Auto Farm Level)",
	NameEN = "Auto Farm Level",
	Default = getgenv().Configs.AutoFarmLevel,
	Callback = function(p21)
		getgenv().Configs.AutoFarmLevel = p21
	end
})
v72:AddToggle({
	NameTH = "โจมตีเร็ว (Fast Attack)",
	NameEN = "Fast Attack",
	Default = getgenv().Configs.FastAttack,
	Callback = function(p22)
		getgenv().Configs.FastAttack = p22
	end
})
v72:AddToggle({
	NameTH = "ดึงมอนสเตอร์มารวมกัน (Bring Mob)",
	NameEN = "Bring Mob",
	Default = getgenv().Configs.BringMob,
	Callback = function(p23)
		getgenv().Configs.BringMob = p23
	end
})
v72:AddToggle({
	NameTH = "ข้ามเลเวลฟาร์ม (Skip Level Farm)",
	NameEN = "Skip Level Farming (Dark Master/Royal Squad)",
	Default = getgenv().Configs.SkipFarmLevel,
	Callback = function(p24)
		getgenv().Configs.SkipFarmLevel = p24
	end
})
v73:AddToggle({
	NameTH = "ซื้อ & อัปเกรดหมัดอัตโนมัติ (Godhuman Chain)",
	NameEN = "Auto Buy & Upgrade Melee (Godhuman Chain)",
	Default = getgenv().Configs.AutoBuyMelee,
	Callback = function(p25)
		getgenv().Configs.AutoBuyMelee = p25
	end
})
v73:AddToggle({
	NameTH = "ซื้อฮาคิอัตโนมัติ (Buso, Geppo, Soru, Ken)",
	NameEN = "Auto Buy Haki (Buso, Geppo, Soru, Ken)",
	Default = getgenv().Configs.AutoHaki,
	Callback = function(p26)
		getgenv().Configs.AutoHaki = p26
	end
})
v74:AddToggle({
	NameTH = "ทำเควสต์ดาบเซเบอร์ (Auto Saber Quest)",
	NameEN = "Auto Saber Quest (Sea 1)",
	Default = getgenv().Configs.Saber,
	Callback = function(p27)
		getgenv().Configs.Saber = p27
	end
})
v74:AddToggle({
	NameTH = "ทำเควสต์กระบองเอเนล (Auto Pole V1)",
	NameEN = "Auto Pole V1 (Thunder God)",
	Default = getgenv().Configs.Pole,
	Callback = function(p28)
		getgenv().Configs.Pole = p28
	end
})
v75:AddToggle({
	NameTH = "เก็บผลปีศาจลงกระเป๋าอัตโนมัติ",
	NameEN = "Auto Store Fruit to Inventory",
	Default = getgenv().Configs.AutoStoreFruit,
	Callback = function(p29)
		getgenv().Configs.AutoStoreFruit = p29
	end
})
v75:AddToggle({
	NameTH = "สุ่มผลปีศาจอัตโนมัติ (Auto Random Fruit)",
	NameEN = "Auto Buy Random Fruit (Cousin)",
	Default = getgenv().Configs.AutoRandomFruit,
	Callback = function(p30)
		getgenv().Configs.AutoRandomFruit = p30
	end
})
v76:AddToggle({
	NameTH = "อัปสเตตัสอัตโนมัติ (Auto Stats Points)",
	NameEN = "Auto Allocate Stats Points",
	Default = getgenv().Configs.AutoStats,
	Callback = function(p31)
		getgenv().Configs.AutoStats = p31
	end
})
v77:AddButton({
	NameTH = "🎁 รับโค้ดของขวัญทั้งหมด (Redeem Codes)",
	NameEN = "🎁 Redeem All Promo Codes",
	Callback = function()
		-- upvalues: CommF_ (ref), t9 (ref)
		task.spawn(function()
			-- upvalues: t9 (ref), CommF_ (ref)
			for _, v in ipairs({
				"BANEXPLOIT",
				"NOMOREHACKS",
				"WildDares",
				"BossBuild",
				"GetPranked",
				"EARN_FRUITS",
				"Sub2UncleKizaru",
				"FIGHT4FRUIT",
				"kittgaming",
				"TRIPLEABUSE",
				"Sub2CaptainMaui",
				"Sub2Fer999",
				"Enyu_is_Pro",
				"Magicbus",
				"JCWK",
				"Starcodeheo",
				"Bluxxy",
				"SUB2GAMERROBOT_EXP1",
				"Sub2NoobMaster123",
				"Sub2Daigrock",
				"Axiore",
				"TantaiGaming",
				"StrawHatMaine",
				"Sub2OfficialNoobie",
				"TheGreatAce",
				"SEATROLLIN",
				"24NOADMIN",
				"ADMIN_TROLL",
				"NEWTROLL",
				"SECRET_ADMIN",
				"staffbattle",
				"NOEXPLOIT",
				"NOOB2ADMIN",
				"CODESLIDE",
				"fruitconcepts"
			}) do
				pcall(function()
					-- upvalues: v (ref), CommF_ (ref)
					CommF_:InvokeServer("Redeem", v)
				end)
				task.wait(0.05)
			end

			local v605 = t9
			local t15 = {
				Title = "PayomboyZ HUB"
			}

			t15.Content = v605.CurrentLanguage == "th" and "รับโค้ดของขวัญสำเร็จทั้งหมดแล้ว!" or "Successfully redeemed all promo codes!"
			v605:Notify(t15)
		end)
	end
})
v77:AddButton({
	NameTH = "🌐 ย้ายเซิร์ฟเวอร์ (Server Hop)",
	NameEN = "🌐 Server Hop",
	Callback = function()
		-- upvalues: u27 (ref)
		pcall(function()
			-- upvalues: u27 (ref)
			u27()
		end)
	end
})
v77:AddButton({
	NameTH = "🔄 เข้าเกมใหม่อีกครั้ง (Rejoin Game)",
	NameEN = "🔄 Rejoin Game",
	Callback = function()
		-- upvalues: LocalPlayer (ref), TeleportService (ref)
		local v307 = TeleportService
		local _game3 = game

		v307:TeleportToPlaceInstance(_game3.PlaceId, _game3.JobId, LocalPlayer)
	end
})

local n67 = nil
local s2 = nil
local s3 = nil
local s4 = nil
local cFrame = nil
local cFrame2 = nil
local u84 = false
local u85 = u84
local u86 = u85

if PlaceId == 2753915549 then
	u84 = true
	t16 = {
		Vector3.new(61163.8515625, 11.6796875, 1819.7841796875),
		Vector3.new(3864.8515625, 6.6796875, -1926.7841796875),
		Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656),
		Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047)
	}
elseif PlaceId == 4442272183 or PlaceId == 79091703265657 then
	u85 = true
	t16 = {
		Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
		Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422),
		Vector3.new(2284, 15, 905),
		Vector3.new(-286.98907470703125, 306.1379089355469, 597.8827514648438)
	}
elseif PlaceId == 7449423635 then
	u86 = true
end

local function u87()
	-- upvalues: u86 (ref), u84 (ref), u85 (ref)
	if u84 then
		return 1
	end

	if u85 then
		return 2
	end

	if u86 then
		return 3
	end

	return 0
end
local function u88()
	-- upvalues: u86 (ref), cFrame (ref), u84 (ref), cFrame2 (ref), s3 (ref), LocalPlayer (ref), u85 (ref), s2 (ref), s4 (ref), n67 (ref)
	local v309 = LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Level") and LocalPlayer.Data.Level.Value or 1

	if u84 then
		if v309 == 1 or v309 <= 9 then
			s2 = "Bandit"
			s3 = "BanditQuest1"
			n67 = 1
			s4 = "Bandit"
			cFrame = CFrame.new(1060, 17, 1547)
			cFrame2 = CFrame.new(1145, 17, 1634)
		elseif v309 == 10 or v309 <= 14 then
			s2 = "Monkey"
			s3 = "JungleQuest"
			n67 = 1
			s4 = "Monkey"
			cFrame = CFrame.new(-1602, 37, 152)
			cFrame2 = CFrame.new(-1496, 39, 35)
		elseif v309 == 15 or v309 <= 29 then
			s2 = "Gorilla"
			s3 = "JungleQuest"
			n67 = 2
			s4 = "Gorilla"
			cFrame = CFrame.new(-1602, 37, 152)
			cFrame2 = CFrame.new(-1237, 6, -486)
		elseif v309 == 30 or v309 <= 39 then
			s2 = "Pirate"
			s3 = "BuggyQuest1"
			n67 = 1
			s4 = "Pirate"
			cFrame = CFrame.new(-1140, 5, 3828)
			cFrame2 = CFrame.new(-1115, 14, 3938)
		elseif v309 == 40 or v309 <= 59 then
			s2 = "Brute"
			s3 = "BuggyQuest1"
			n67 = 2
			s4 = "Brute"
			cFrame = CFrame.new(-1140, 5, 3828)
			cFrame2 = CFrame.new(-1145, 15, 4350)
		elseif v309 == 60 or v309 <= 74 then
			s2 = "Desert Bandit"
			s3 = "DesertQuest"
			n67 = 1
			s4 = "Desert Bandit"
			cFrame = CFrame.new(897, 7, 4388)
			cFrame2 = CFrame.new(932, 7, 4484)
		elseif v309 == 75 or v309 <= 89 then
			s2 = "Desert Officer"
			s3 = "DesertQuest"
			n67 = 2
			s4 = "Desert Officers"
			cFrame = CFrame.new(897, 7, 4388)
			cFrame2 = CFrame.new(1572, 10, 4373)
		elseif v309 == 90 or v309 <= 99 then
			s2 = "Snow Bandit"
			s3 = "SnowQuest"
			n67 = 1
			s4 = "Snow Bandits"
			cFrame = CFrame.new(1386, 87, -1297)
			cFrame2 = CFrame.new(1289, 150, -1442)
		elseif v309 == 100 or v309 <= 119 then
			s2 = "Snowman"
			s3 = "SnowQuest"
			n67 = 2
			s4 = "Snowman"
			cFrame = CFrame.new(1386, 87, -1297)
			cFrame2 = CFrame.new(1289, 150, -1442)
		elseif v309 == 120 or v309 <= 149 then
			s2 = "Chief Petty Officer"
			s3 = "MarineQuest2"
			n67 = 1
			s4 = "Chief Petty Officer"
			cFrame = CFrame.new(-5036, 29, 4325)
			cFrame2 = CFrame.new(-4855, 23, 4308)
		elseif v309 == 150 or v309 <= 174 then
			s2 = "Sky Bandit"
			s3 = "SkyQuest"
			n67 = 1
			s4 = "Sky Bandit"
			cFrame = CFrame.new(-4842, 718, -2623)
			cFrame2 = CFrame.new(-4981, 278, -2830)
		elseif v309 == 175 or v309 <= 189 then
			s2 = "Dark Master"
			s3 = "SkyQuest"
			n67 = 2
			s4 = "Dark Master"
			cFrame = CFrame.new(-4842, 718, -2623)
			cFrame2 = CFrame.new(-5250, 389, -2272)
		elseif v309 == 190 or v309 <= 209 then
			s2 = "Prisoner"
			s3 = "PrisonerQuest"
			n67 = 1
			s4 = "Prisoners"
			cFrame = CFrame.new(5308, 2, 474)
			cFrame2 = CFrame.new(5411, 96, 690)
		elseif v309 == 210 or v309 <= 249 then
			s2 = "Dangerous Prisoner"
			s3 = "PrisonerQuest"
			n67 = 2
			s4 = "Dangerous Prisoner"
			cFrame = CFrame.new(5308, 2, 474)
			cFrame2 = CFrame.new(5411, 96, 690)
		elseif v309 == 250 or v309 <= 299 then
			s2 = "Toga Warrior"
			s3 = "ColosseumQuest"
			n67 = 1
			s4 = "Toga Warrior"
			cFrame = CFrame.new(-1576, 8, -2985)
			cFrame2 = CFrame.new(-1641.4344482421875, 7.415142059326172, -2864.462646484375)
		elseif v309 == 300 or v309 <= 329 then
			s2 = "Military Soldier"
			s3 = "MagmaQuest"
			n67 = 1
			s4 = "Military Soldier"
			cFrame = CFrame.new(-5316, 12, 8517)
			cFrame2 = CFrame.new(-5408, 11, 8447)
		elseif v309 == 330 or v309 <= 374 then
			s2 = "Military Spy"
			s3 = "MagmaQuest"
			n67 = 2
			s4 = "Military Spy"
			cFrame = CFrame.new(-5316, 12, 8517)
			cFrame2 = CFrame.new(-5815, 84, 8820)
		elseif v309 == 375 or v309 <= 399 then
			s2 = "Fishman Warrior"
			s3 = "FishmanQuest"
			n67 = 1
			s4 = "Fishman Warrior"
			cFrame = CFrame.new(61123, 19, 1569)
			cFrame2 = CFrame.new(60859, 19, 1501)
		elseif v309 == 400 or v309 <= 449 then
			s2 = "Fishman Commando"
			s3 = "FishmanQuest"
			n67 = 2
			s4 = "Fishman Commando"
			cFrame = CFrame.new(61123, 19, 1569)
			cFrame2 = CFrame.new(61891, 19, 1470)
		elseif v309 == 450 or v309 <= 474 then
			s2 = "God's Guard"
			s3 = "SkyExp1Quest"
			n67 = 1
			s4 = "God's Guards"
			cFrame = CFrame.new(-4722, 845, -1954)
			cFrame2 = CFrame.new(-4698, 845, -1912)
		elseif v309 == 475 or v309 <= 524 then
			s2 = "Shanda"
			s3 = "SkyExp1Quest"
			n67 = 2
			s4 = "Shandas"
			cFrame = CFrame.new(-7862, 5546, -380)
			cFrame2 = CFrame.new(-7685, 5567, -502)
		elseif v309 == 525 or v309 <= 549 then
			s2 = "Royal Squad"
			s3 = "SkyExp2Quest"
			n67 = 1
			s4 = "Royal Squad"
			cFrame = CFrame.new(-7904, 5636, -1412)
			cFrame2 = CFrame.new(-7670, 5607, -1460)
		elseif v309 == 550 or v309 <= 624 then
			s2 = "Royal Soldier"
			s3 = "SkyExp2Quest"
			n67 = 2
			s4 = "Royal Soldier"
			cFrame = CFrame.new(-7904, 5636, -1412)
			cFrame2 = CFrame.new(-7828, 5607, -1744)
		elseif v309 == 625 or v309 <= 649 then
			s2 = "Galley Pirate"
			s3 = "FountainQuest"
			n67 = 1
			s4 = "Galley Pirate"
			cFrame = CFrame.new(5256, 39, 4050)
			cFrame2 = CFrame.new(5589, 45, 3996)
		elseif v309 >= 650 then
			s2 = "Galley Captain"
			s3 = "FountainQuest"
			n67 = 2
			s4 = "Galley Captain"
			cFrame = CFrame.new(5256, 39, 4050)
			cFrame2 = CFrame.new(5649, 39, 4936)
		end
	end

	if u85 then
		if v309 == 700 or v309 <= 724 then
			s2 = "Raider"
			s3 = "Area1Quest"
			n67 = 1
			s4 = "Raider"
			cFrame = CFrame.new(-425, 73, 1837)
			cFrame2 = CFrame.new(-746, 39, 2390)
		elseif v309 == 725 or v309 <= 774 then
			s2 = "Mercenary"
			s3 = "Area1Quest"
			n67 = 2
			s4 = "Mercenary"
			cFrame = CFrame.new(-425, 73, 1837)
			cFrame2 = CFrame.new(-874, 141, 1312)
		elseif v309 == 775 or v309 <= 799 then
			s2 = "Swan Pirate"
			s3 = "Area2Quest"
			n67 = 1
			s4 = "Swan Pirate"
			cFrame = CFrame.new(634, 73, 918)
			cFrame2 = CFrame.new(878, 122, 1235)
		elseif v309 == 800 or v309 <= 874 then
			s2 = "Factory Staff"
			s3 = "Area2Quest"
			n67 = 2
			s4 = "Factory Staff"
			cFrame = CFrame.new(634, 73, 918)
			cFrame2 = CFrame.new(295, 73, -56)
		elseif v309 == 875 or v309 <= 899 then
			s2 = "Marine Lieutenant"
			s3 = "MarineQuest3"
			n67 = 1
			s4 = "Marine Lieutenant"
			cFrame = CFrame.new(-2443, 73, -3219)
			cFrame2 = CFrame.new(-2806, 73, -3038)
		elseif v309 == 900 or v309 <= 949 then
			s2 = "Marine Captain"
			s3 = "MarineQuest3"
			n67 = 2
			s4 = "Marine Captain"
			cFrame = CFrame.new(-2443, 73, -3219)
			cFrame2 = CFrame.new(-1869, 73, -3320)
		elseif v309 == 950 or v309 <= 974 then
			s2 = "Zombie"
			s3 = "ZombieQuest"
			n67 = 1
			s4 = "Zombie"
			cFrame = CFrame.new(-5494, 49, -795)
			cFrame2 = CFrame.new(-5736, 126, -728)
		elseif v309 == 975 or v309 <= 999 then
			s2 = "Vampire"
			s3 = "ZombieQuest"
			n67 = 2
			s4 = "Vampire"
			cFrame = CFrame.new(-5494, 49, -795)
			cFrame2 = CFrame.new(-6033, 7, -1317)
		elseif v309 == 1000 or v309 <= 1049 then
			s2 = "Snow Trooper"
			s3 = "SnowMountainQuest"
			n67 = 1
			s4 = "Snow Trooper"
			cFrame = CFrame.new(605, 402, -5371)
			cFrame2 = CFrame.new(478, 402, -5362)
		elseif v309 == 1050 or v309 <= 1099 then
			s2 = "Winter Warrior"
			s3 = "SnowMountainQuest"
			n67 = 2
			s4 = "Winter Warrior"
			cFrame = CFrame.new(605, 402, -5371)
			cFrame2 = CFrame.new(1157, 430, -5188)
		elseif v309 == 1100 or v309 <= 1124 then
			s2 = "Lab Subordinate"
			s3 = "IceSideQuest"
			n67 = 1
			s4 = "Lab Subordinate"
			cFrame = CFrame.new(-6060, 16, -4905)
			cFrame2 = CFrame.new(-5782, 42, -4484)
		elseif v309 == 1125 or v309 <= 1174 then
			s2 = "Horned Warrior"
			s3 = "IceSideQuest"
			n67 = 2
			s4 = "Horned Warrior"
			cFrame = CFrame.new(-6060, 16, -4905)
			cFrame2 = CFrame.new(-6406, 24, -5805)
		elseif v309 == 1175 or v309 <= 1199 then
			s2 = "Magma Ninja"
			s3 = "FireSideQuest"
			n67 = 1
			s4 = "Magma Ninja"
			cFrame = CFrame.new(-5430, 16, -5295)
			cFrame2 = CFrame.new(-5428, 78, -5959)
		elseif v309 == 1200 or v309 <= 1249 then
			s2 = "Lava Pirate"
			s3 = "FireSideQuest"
			n67 = 2
			s4 = "Lava Pirate"
			cFrame = CFrame.new(-5430, 16, -5295)
			cFrame2 = CFrame.new(-5270, 42, -4800)
		elseif v309 == 1250 or v309 <= 1274 then
			s2 = "Ship Deckhand"
			s3 = "ShipQuest1"
			n67 = 1
			s4 = "Ship Deckhand"
			cFrame = CFrame.new(1038, 125, 32913)
			cFrame2 = CFrame.new(1198, 126, 33031)
		elseif v309 == 1275 or v309 <= 1299 then
			s2 = "Ship Engineer"
			s3 = "ShipQuest1"
			n67 = 2
			s4 = "Ship Engineer"
			cFrame = CFrame.new(1038, 125, 32913)
			cFrame2 = CFrame.new(918, 44, 32787)
		elseif v309 == 1300 or v309 <= 1324 then
			s2 = "Ship Steward"
			s3 = "ShipQuest2"
			n67 = 1
			s4 = "Ship Steward"
			cFrame = CFrame.new(969, 125, 33245)
			cFrame2 = CFrame.new(915, 130, 33419)
		elseif v309 == 1325 or v309 <= 1349 then
			s2 = "Ship Officer"
			s3 = "ShipQuest2"
			n67 = 2
			s4 = "Ship Officer"
			cFrame = CFrame.new(969, 125, 33245)
			cFrame2 = CFrame.new(916, 181, 33335)
		elseif v309 == 1350 or v309 <= 1374 then
			s2 = "Arctic Warrior"
			s3 = "FrostQuest"
			n67 = 1
			s4 = "Arctic Warrior"
			cFrame = CFrame.new(5669, 28, -6482)
			cFrame2 = CFrame.new(6038, 29, -6231)
		elseif v309 == 1375 or v309 <= 1424 then
			s2 = "Snow Lurker"
			s3 = "FrostQuest"
			n67 = 2
			s4 = "Snow Lurker"
			cFrame = CFrame.new(5669, 28, -6482)
			cFrame2 = CFrame.new(5560, 42, -6826)
		elseif v309 == 1425 or v309 <= 1449 then
			s2 = "Sea Soldier"
			s3 = "ForgottenQuest"
			n67 = 1
			s4 = "Sea Soldier"
			cFrame = CFrame.new(-3054, 237, -10148)
			cFrame2 = CFrame.new(-3022, 16, -9722)
		elseif v309 >= 1450 then
			s2 = "Water Fighter"
			s3 = "ForgottenQuest"
			n67 = 2
			s4 = "Water Fighter"
			cFrame = CFrame.new(-3054, 237, -10148)
			cFrame2 = CFrame.new(-3385, 239, -10542)
		end
	end

	if u86 then
		if v309 == 1500 or v309 <= 1524 then
			s2 = "Pirate Millionaire"
			s3 = "PiratePortQuest"
			n67 = 1
			s4 = "Pirate Millionaire"
			cFrame = CFrame.new(-290, 44, 5580)
			cFrame2 = CFrame.new(-373, 75, 5552)
		elseif v309 == 1525 or v309 <= 1574 then
			s2 = "Pistol Billionaire"
			s3 = "PiratePortQuest"
			n67 = 2
			s4 = "Pistol Billionaire"
			cFrame = CFrame.new(-290, 44, 5580)
			cFrame2 = CFrame.new(-469, 74, 5952)
		elseif v309 == 1575 or v309 <= 1599 then
			s2 = "Dragon Crew Warrior"
			s3 = "AmazonQuest"
			n67 = 1
			s4 = "Dragon Crew Warrior"
			cFrame = CFrame.new(5832, 52, -1105)
			cFrame2 = CFrame.new(6157, 52, -1112)
		elseif v309 == 1600 or v309 <= 1624 then
			s2 = "Dragon Crew Archer"
			s3 = "AmazonQuest"
			n67 = 2
			s4 = "Dragon Crew Archer"
			cFrame = CFrame.new(5832, 52, -1105)
			cFrame2 = CFrame.new(6633, 47, -197)
		elseif v309 == 1625 or v309 <= 1649 then
			s2 = "Female Islander"
			s3 = "AmazonQuest2"
			n67 = 1
			s4 = "Female Islander"
			cFrame = CFrame.new(5446, 602, 749)
			cFrame2 = CFrame.new(4714, 602, 232)
		elseif v309 == 1650 or v309 <= 1699 then
			s2 = "Giant Islander"
			s3 = "AmazonQuest2"
			n67 = 2
			s4 = "Giant Islander"
			cFrame = CFrame.new(5446, 602, 749)
			cFrame2 = CFrame.new(5207, 583, -29)
		elseif v309 == 1700 or v309 <= 1724 then
			s2 = "Marine Commodore"
			s3 = "MarineTreeIsland"
			n67 = 1
			s4 = "Marine Commodore"
			cFrame = CFrame.new(2180, 29, -6740)
			cFrame2 = CFrame.new(2462, 73, -6789)
		elseif v309 == 1725 or v309 <= 1749 then
			s2 = "Marine Rear Admiral"
			s3 = "MarineTreeIsland"
			n67 = 2
			s4 = "Marine Rear Admiral"
			cFrame = CFrame.new(2180, 29, -6740)
			cFrame2 = CFrame.new(2887, 73, -7198)
		elseif v309 == 1750 or v309 <= 1774 then
			s2 = "Fishman Raider"
			s3 = "DeepForestIsland1"
			n67 = 1
			s4 = "Fishman Raider"
			cFrame = CFrame.new(-10584, 332, -8758)
			cFrame2 = CFrame.new(-10357, 332, -8973)
		elseif v309 == 1775 or v309 <= 1799 then
			s2 = "Fishman Captain"
			s3 = "DeepForestIsland1"
			n67 = 2
			s4 = "Fishman Captain"
			cFrame = CFrame.new(-10584, 332, -8758)
			cFrame2 = CFrame.new(-10994, 332, -8936)
		elseif v309 == 1800 or v309 <= 1824 then
			s2 = "Forest Pirate"
			s3 = "DeepForestIsland2"
			n67 = 1
			s4 = "Forest Pirate"
			cFrame = CFrame.new(-13233, 332, -7626)
			cFrame2 = CFrame.new(-13437, 332, -7916)
		elseif v309 == 1825 or v309 <= 1849 then
			s2 = "Mythological Pirate"
			s3 = "DeepForestIsland2"
			n67 = 2
			s4 = "Mythological Pirate"
			cFrame = CFrame.new(-13233, 332, -7626)
			cFrame2 = CFrame.new(-13535, 471, -6907)
		elseif v309 == 1850 or v309 <= 1899 then
			s2 = "Jungle Pirate"
			s3 = "DeepForestIsland3"
			n67 = 1
			s4 = "Jungle Pirate"
			cFrame = CFrame.new(-12684, 391, -9902)
			cFrame2 = CFrame.new(-12117, 332, -10477)
		elseif v309 == 1900 or v309 <= 1924 then
			s2 = "Musketeer Pirate"
			s3 = "DeepForestIsland3"
			n67 = 2
			s4 = "Musketeer Pirate"
			cFrame = CFrame.new(-12684, 391, -9902)
			cFrame2 = CFrame.new(-13342, 332, -9879)
		elseif v309 == 1925 or v309 <= 1974 then
			s2 = "Reborn Skeleton"
			s3 = "HauntedQuest1"
			n67 = 1
			s4 = "Reborn Skeleton"
			cFrame = CFrame.new(-9482, 142, 5565)
			cFrame2 = CFrame.new(-8786, 142, 6023)
		elseif v309 == 1975 or v309 <= 1999 then
			s2 = "Living Zombie"
			s3 = "HauntedQuest1"
			n67 = 2
			s4 = "Living Zombie"
			cFrame = CFrame.new(-9482, 142, 5565)
			cFrame2 = CFrame.new(-10137, 140, 5932)
		elseif v309 == 2000 or v309 <= 2024 then
			s2 = "Demonic Soul"
			s3 = "HauntedQuest2"
			n67 = 1
			s4 = "Demonic Soul"
			cFrame = CFrame.new(-9513, 172, 6079)
			cFrame2 = CFrame.new(-9507, 172, 6158)
		elseif v309 == 2025 or v309 <= 2074 then
			s2 = "Posessed Mummy"
			s3 = "HauntedQuest2"
			n67 = 2
			s4 = "Posessed Mummy"
			cFrame = CFrame.new(-9513, 172, 6079)
			cFrame2 = CFrame.new(-9582, 6, 6205)
		elseif v309 == 2075 or v309 <= 2099 then
			s2 = "Peanut Scout"
			s3 = "NutsIslandQuest"
			n67 = 1
			s4 = "Peanut Scout"
			cFrame = CFrame.new(-2104, 38, -10192)
			cFrame2 = CFrame.new(-2143, 38, -10355)
		elseif v309 == 2100 or v309 <= 2124 then
			s2 = "Peanut President"
			s3 = "NutsIslandQuest"
			n67 = 2
			s4 = "Peanut President"
			cFrame = CFrame.new(-2104, 38, -10192)
			cFrame2 = CFrame.new(-2143, 38, -10355)
		elseif v309 == 2125 or v309 <= 2149 then
			s2 = "Ice Cream Chef"
			s3 = "IceCreamIslandQuest"
			n67 = 1
			s4 = "Ice Cream Chef"
			cFrame = CFrame.new(-824, 66, -10965)
			cFrame2 = CFrame.new(-641, 66, -11258)
		elseif v309 == 2150 or v309 <= 2199 then
			s2 = "Ice Cream Commander"
			s3 = "IceCreamIslandQuest"
			n67 = 2
			s4 = "Ice Cream Commander"
			cFrame = CFrame.new(-824, 66, -10965)
			cFrame2 = CFrame.new(-641, 66, -11258)
		elseif v309 == 2200 or v309 <= 2224 then
			s2 = "Cookie Crafter"
			s3 = "CakeQuest1"
			n67 = 1
			s4 = "Cookie Crafter"
			cFrame = CFrame.new(-2020, 38, -12025)
			cFrame2 = CFrame.new(-2374, 38, -12119)
		elseif v309 == 2225 or v309 <= 2249 then
			s2 = "Cake Guard"
			s3 = "CakeQuest1"
			n67 = 2
			s4 = "Cake Guard"
			cFrame = CFrame.new(-2020, 38, -12025)
			cFrame2 = CFrame.new(-1595, 38, -12285)
		elseif v309 == 2250 or v309 <= 2299 then
			s2 = "Baking Staff"
			s3 = "CakeQuest2"
			n67 = 1
			s4 = "Baking Staff"
			cFrame = CFrame.new(-1926, 38, -12850)
			cFrame2 = CFrame.new(-1832, 38, -13010)
		elseif v309 == 2300 or v309 <= 2324 then
			s2 = "Head Baker"
			s3 = "CakeQuest2"
			n67 = 2
			s4 = "Head Baker"
			cFrame = CFrame.new(-1926, 38, -12850)
			cFrame2 = CFrame.new(-2125, 38, -12940)
		elseif v309 == 2325 or v309 <= 2349 then
			s2 = "Cocoa Warrior"
			s3 = "ChocQuest1"
			n67 = 1
			s4 = "Cocoa Warrior"
			cFrame = CFrame.new(231, 24, -12195)
			cFrame2 = CFrame.new(231, 24, -12195)
		elseif v309 == 2350 or v309 <= 2399 then
			s2 = "Chocolate Bar Battler"
			s3 = "ChocQuest1"
			n67 = 2
			s4 = "Chocolate Bar Battler"
			cFrame = CFrame.new(231, 24, -12195)
			cFrame2 = CFrame.new(231, 24, -12195)
		elseif v309 == 2400 or v309 <= 2424 then
			s2 = "Sweet Thief"
			s3 = "ChocQuest2"
			n67 = 1
			s4 = "Sweet Thief"
			cFrame = CFrame.new(151, 24, -12775)
			cFrame2 = CFrame.new(151, 24, -12775)
		elseif v309 == 2425 or v309 <= 2449 then
			s2 = "Candy Rebel"
			s3 = "ChocQuest2"
			n67 = 2
			s4 = "Candy Rebel"
			cFrame = CFrame.new(151, 24, -12775)
			cFrame2 = CFrame.new(151, 24, -12775)
		elseif v309 == 2450 or v309 <= 2499 then
			s2 = "Candy Pirate"
			s3 = "CandyQuest1"
			n67 = 1
			s4 = "Candy Pirate"
			cFrame = CFrame.new(-1149, 14, -14445)
			cFrame2 = CFrame.new(-1149, 14, -14445)
		elseif v309 == 2500 or v309 <= 2549 then
			s2 = "Snow Demon"
			s3 = "CandyQuest1"
			n67 = 2
			s4 = "Snow Demon"
			cFrame = CFrame.new(-1149, 14, -14445)
			cFrame2 = CFrame.new(-1149, 14, -14445)
		elseif v309 == 2550 or v309 <= 2599 then
			s2 = "Isle Outlaw"
			s3 = "TikiQuest1"
			n67 = 1
			s4 = "Isle Outlaw"

			local n68 = 0
			local n69 = 1

			cFrame = CFrame.new(-16535, 54, -175, n68, n68, -1, n68, n69, n68, n69, n68, n68)
			cFrame2 = CFrame.new(-16535, 54, -175)
		elseif v309 == 2600 or v309 <= 2649 then
			s2 = "Island Boy"
			s3 = "TikiQuest1"
			n67 = 2
			s4 = "Island Boy"

			local n70 = 0
			local n71 = 1

			cFrame = CFrame.new(-16535, 54, -175, n70, n70, -1, n70, n71, n70, n71, n70, n70)
			cFrame2 = CFrame.new(-16535, 54, -175)
		elseif v309 == 2650 or v309 <= 2699 then
			s2 = "Sun-kissed Warrior"
			s3 = "TikiQuest2"
			n67 = 1
			s4 = "Sun-kissed Warrior"

			local n72 = 0
			local n73 = 1

			cFrame = CFrame.new(-16535, 54, -175, n72, n72, -1, n72, n73, n72, n73, n72, n72)
			cFrame2 = CFrame.new(-16535, 54, -175)
		elseif v309 >= 2700 then
			s2 = "Isle Champion"
			s3 = "TikiQuest2"
			n67 = 2
			s4 = "Isle Champion"

			local n74 = 0
			local n75 = 1

			cFrame = CFrame.new(-16535, 54, -175, n74, n74, -1, n74, n75, n74, n75, n74, n74)
			cFrame2 = CFrame.new(-16535, 54, -175)
		end
	end
end

task.spawn(function()
	-- upvalues: CommF_ (ref)
	for _, v in ipairs({
		"BANEXPLOIT",
		"NOMOREHACKS",
		"WildDares",
		"BossBuild",
		"GetPranked",
		"EARN_FRUITS",
		"Sub2UncleKizaru",
		"FIGHT4FRUIT",
		"kittgaming",
		"TRIPLEABUSE",
		"Sub2CaptainMaui",
		"Sub2Fer999",
		"Enyu_is_Pro",
		"Magicbus",
		"JCWK",
		"Starcodeheo",
		"Bluxxy",
		"SUB2GAMERROBOT_EXP1",
		"Sub2NoobMaster123",
		"Sub2Daigrock",
		"Axiore",
		"TantaiGaming",
		"StrawHatMaine",
		"Sub2OfficialNoobie",
		"TheGreatAce",
		"SEATROLLIN",
		"24NOADMIN",
		"ADMIN_TROLL",
		"NEWTROLL",
		"SECRET_ADMIN",
		"staffbattle",
		"NOEXPLOIT",
		"NOOB2ADMIN",
		"CODESLIDE",
		"fruitconcepts"
	}) do
		pcall(function()
			-- upvalues: v (ref), CommF_ (ref)
			CommF_:InvokeServer("Redeem", v)
		end)
	end
end)

local function u89(p32, p33)
	if not p32 or not p32:FindFirstChild("HumanoidRootPart") then
		return nil
	end

	local v322 = nil
	local huge = math.huge

	for _, child in ipairs(workspace.Enemies:GetChildren()) do
		if child ~= p32 and child.Name == p32.Name and child.Parent and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 then
			local Magnitude = (child.HumanoidRootPart.Position - p32.HumanoidRootPart.Position).Magnitude

			if Magnitude <= p33 and Magnitude < huge then
				v322 = child
				huge = Magnitude
			end
		end
	end

	return v322
end
local function u90(p34, _, _, p37, p38)
	-- upvalues: u34 (ref), u45 (ref), LocalPlayer (ref), TextLabel (ref), u89 (ref), s4 (ref), u36 (ref)
	if p37 == nil then
	end

	if not p38 then
		local _ = s4
	end

	pcall(sethiddenproperty, LocalPlayer, "SimulationRadius", math.huge)

	if not p34 or not p34.Parent or not p34:FindFirstChild("Humanoid") or not p34:FindFirstChild("HumanoidRootPart") then
		return false
	end

	local Humanoid = p34.Humanoid
	local HumanoidRootPart = p34.HumanoidRootPart
	local n76 = 0

	Humanoid.JumpPower = n76
	Humanoid.WalkSpeed = n76
	HumanoidRootPart.CanCollide = false

	if getgenv().Configs.BringMob then
		local BringVelocity = HumanoidRootPart:FindFirstChild("BringVelocity")

		if not BringVelocity then
			BringVelocity = Instance.new("BodyVelocity")
			BringVelocity.Name = "BringVelocity"

			local n77 = 100000

			BringVelocity.MaxForce = Vector3.new(n77, n77, n77)
			BringVelocity.Parent = HumanoidRootPart
		end

		BringVelocity.Velocity = Vector3.zero
	end

	local v338 = nil
	local v339 = nil

	repeat
		task.wait()
		TextLabel.Text = "Auto Farming Level | Kill " .. p34.Name

		if not v338 and getgenv().Configs.BringMob then
			v338 = u89(p34, 350)
		end

		if v338 and v338.Parent and v338:FindFirstChild("Humanoid") and v338.Humanoid.Health > 0 and v338:FindFirstChild("HumanoidRootPart") then
			v338.HumanoidRootPart.CFrame = HumanoidRootPart.CFrame

			local n78 = 0

			v338.Humanoid.JumpPower = n78
			v338.Humanoid.WalkSpeed = n78
			v338.HumanoidRootPart.CanCollide = false

			local BringVelocity = v338.HumanoidRootPart:FindFirstChild("BringVelocity")

			if not BringVelocity then
				BringVelocity = Instance.new("BodyVelocity")
				BringVelocity.Name = "BringVelocity"

				local n79 = 100000

				BringVelocity.MaxForce = Vector3.new(n79, n79, n79)
				BringVelocity.Parent = v338.HumanoidRootPart
			end

			BringVelocity.Velocity = Vector3.zero
		else
			v338 = nil
		end

		local v343 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

		if not v343 then
			break
		end

		local n80 = 0
		local v345 = HumanoidRootPart.Position + Vector3.new(n80, 7.5, n80)

		if (v343.Position - HumanoidRootPart.Position).Magnitude > 45 then
			if not v339 or v339.PlaybackState ~= Enum.PlaybackState.Playing then
				v339 = u34(CFrame.lookAt(v345, HumanoidRootPart.Position), 350)
			end
		else
			if v339 then
				v339:Cancel()
				v339 = nil
			end

			u36(getgenv().Configs.SelectWeapon or "Melee")
			v343.CFrame = CFrame.lookAt(v345, HumanoidRootPart.Position)

			if v338 then
				u45({
					p34,
					v338
				})
			else
				u45(p34)
			end
		end
	until not p34 or not p34.Parent or not p34:FindFirstChild("Humanoid") or p34.Humanoid.Health <= 0 or not getgenv().Configs.AutoFarmLevel

	if v339 then
		v339:Cancel()
	end

	return Humanoid.Health <= 0
end
local function u91(p39, p40, p41)
	-- upvalues: u37 (ref), u22 (ref), TextLabel (ref), LocalPlayer (ref), s3 (ref), u47 (ref), u33 (ref), CommF_ (ref), u35 (ref), u34 (ref), cFrame (ref), n67 (ref), s2 (ref), u90 (ref), u21 (ref), ReplicatedStorage (ref), cFrame2 (ref)
	u47()

	if p41 >= 700 then
		TextLabel.Text = "Doing Second Sea Puzzle"

		if not CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") then
			if CommF_:InvokeServer("DressrosaQuestProgress").TalkedDetective and CommF_:InvokeServer("DressrosaQuestProgress").UsedKey then
				if workspace.Enemies:FindFirstChild("Ice Admiral") then
					for _, child in workspace.Enemies:GetChildren() do
						if child:IsA("Model") and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 and child.Name == "Ice Admiral" then
							u90(child, p40, p39, false)
							TextLabel.Text = "Travel To Second Sea"
							CommF_:InvokeServer("TravelDressrosa")
						end
					end
				else
					local v351 = u34(CFrame.new(1382.562255859375, 26.999441146850586, -1458.77783203125), 350)

					if v351 then
						v351.Completed:Wait()
					end
				end
			elseif u35("Key") then
				CommF_:InvokeServer("DressrosaQuestProgress", "UseKey")
			elseif not u35("Key") then
				CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
			end
		else
			TextLabel.Text = "Travel To Second Sea"
			CommF_:InvokeServer("TravelDressrosa")
		end
	elseif p41 >= 200 and getgenv().Configs.Saber and workspace.Map:FindFirstChild("Jungle") and workspace.Map.Jungle:FindFirstChild("Final") and workspace.Map.Jungle.Final:FindFirstChild("Part") and workspace.Map.Jungle.Final.Part.CanCollide and not u21 then
		TextLabel.Text = "Saber Quest | Solve Puzzle"

		if not workspace.Map.Jungle.QuestPlates.Door.CanCollide then
			if CommF_:InvokeServer("ProQuestProgress").UsedTorch then
				if CommF_:InvokeServer("ProQuestProgress", "SickMan") == 0 then
					if CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
						if workspace.Enemies:FindFirstChild("Mob Leader") then
							for _, child in workspace.Enemies:GetChildren() do
								if child:IsA("Model") and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 and child.Name == "Mob Leader" then
									u90(child, p40, p39, false)
								end
							end
						else
							local v354 = nil

							if (CFrame.new(-2848, 8, 5342).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
								u34(CFrame.new(-2848, 8, 5342), 350)
							elseif (CFrame.new(-2848, 8, 5342).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
								if v354 then
									v354:Cancel()
								end

								u33(CFrame.new(-2848, 8, 5342))
							end
						end
					elseif CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
						CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
					else
						CommF_:InvokeServer("ProQuestProgress", "RichSon")
					end
				else
					CommF_:InvokeServer("ProQuestProgress", "GetCup")
					task.wait(0.2)
					u37("Cup")
					task.wait(0.2)

					local v355 = u35("Cup")

					CommF_:InvokeServer("ProQuestProgress", "FillCup", v355)
					CommF_:InvokeServer("ProQuestProgress", "SickMan")
				end
			elseif u35("Torch") then
				CommF_:InvokeServer("ProQuestProgress", "DestroyTorch")
			elseif not u35("Torch") then
				CommF_:InvokeServer("ProQuestProgress", "GetTorch")
			end
		else
			for i, child in workspace.Map.Jungle.QuestPlates:GetChildren() do
				if child:IsA("Model") and child.Button.BrickColor ~= BrickColor.new("Camo") then
					TextLabel.Text = "Doing Saber Quest | Touching Plates " .. i .. "/5"

					local v358 = u34(child.Button.CFrame, 350)

					if v358 then
						v358.Completed:Wait()
					end

					task.wait(0.5)
				end
			end
		end
	elseif p41 >= 200 and getgenv().Configs.Saber and not u21 and (ReplicatedStorage:FindFirstChild("Saber Expert") or workspace.Enemies:FindFirstChild("Saber Expert")) then
		TextLabel.Text = "Saber Quest | Kill Saber Expert"

		if workspace.Enemies:FindFirstChild("Saber Expert") then
			for _, child in workspace.Enemies:GetChildren() do
				if child.Name == "Saber Expert" and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
					u90(child, p40, p39, false)
				end
			end
		elseif ReplicatedStorage:FindFirstChild("Saber Expert") then
			local v361 = nil

			if (CFrame.new(-1458.89502, 29.8870335, -50.633564).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
				u34(CFrame.new(-1458.89502, 29.8870335, -50.633564), 350)
			elseif (CFrame.new(-1458.89502, 29.8870335, -50.633564).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
				if v361 then
					v361:Cancel()
				end

				u33(CFrame.new(-1458.89502, 29.8870335, -50.633564))
			end

			CommF_:InvokeServer("SetSpawnPoint")
		end
	elseif p41 >= 200 and getgenv().Configs.Pole and not u22 and (ReplicatedStorage:FindFirstChild("Thunder God") or workspace.Enemies:FindFirstChild("Thunder God")) then
		TextLabel.Text = "Get Pole | Kill Thunder God"

		if workspace.Enemies:FindFirstChild("Thunder God") then
			for _, child in workspace.Enemies:GetChildren() do
				if child.Name == "Thunder God" and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
					u90(child, p40, p39, false)
				end
			end
		elseif ReplicatedStorage:FindFirstChild("Thunder God") then
			local v364 = nil

			if (CFrame.new(-7795.9287109375, 5605.951171875, -2231.444580078125).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
				u34(CFrame.new(-7795.9287109375, 5605.951171875, -2231.444580078125), 350)
			elseif (CFrame.new(-7795.9287109375, 5605.951171875, -2231.444580078125).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
				if v364 then
					v364:Cancel()
				end

				u33(CFrame.new(-7795.9287109375, 5605.951171875, -2231.444580078125))
			end

			CommF_:InvokeServer("SetSpawnPoint")
		end
	elseif getgenv().Configs.SkipFarmLevel and (p41 >= 0 and p41 <= 24) then
		if workspace.Enemies:FindFirstChild("Dark Master") then
			for _, child in pairs(workspace.Enemies:GetChildren()) do
				if LocalPlayer.Data.Level.Value >= 25 then
					return
				end

				if child.Name == "Dark Master" and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
					u90(child, p40, p39, false)
				end
			end
		else
			TextLabel.Text = "Skip Farming Level | Waiting"

			local v367 = u34(CFrame.new(-5250, 389, -2272), 350)

			if (CFrame.new(-5250, 389, -2272).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
				if v367 then
					v367:Cancel()
				end

				u33(CFrame.new(-5250, 389, -2272))
			end
		end
	elseif getgenv().Configs.SkipFarmLevel and (p41 >= 25 and p41 <= 59) then
		if workspace.Enemies:FindFirstChild("Royal Squad") then
			for _, child in pairs(workspace.Enemies:GetChildren()) do
				if LocalPlayer.Data.Level.Value >= 60 then
					return
				end

				if child.Name == "Royal Squad" and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
					u90(child, p40, p39, false)
				end
			end
		else
			TextLabel.Text = "Skip Farming Level | Waiting"

			local v370 = u34(CFrame.new(-7670, 5607, -1460), 350)

			if (CFrame.new(-7670, 5607, -1460).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
				if v370 then
					v370:Cancel()
				end

				u33(CFrame.new(-7670, 5607, -1460))
			end
		end
	elseif not p39.Visible then
		TextLabel.Text = "Auto Farming Level | Get Quest"

		local v371 = nil

		if (cFrame.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
			u34(cFrame, 350)
		elseif (cFrame.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
			if v371 then
				v371:Cancel()
			end

			u33(cFrame)
			CommF_:InvokeServer("StartQuest", s3, n67)
			CommF_:InvokeServer("SetSpawnPoint")
		end
	elseif p39.Visible then
		local v372 = false

		if workspace.Enemies:FindFirstChild(s2) then
			for _, child in pairs(workspace.Enemies:GetChildren()) do
				if child.Name == s2 and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
					v372 = true
					u90(child, p40, p39)
				end
			end
		end

		if not v372 then
			TextLabel.Text = "Auto Farming Level | Wait For " .. tostring(s2)

			local v375 = nil

			if (cFrame2.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
				u34(cFrame2, 350)
			elseif (cFrame2.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
				if v375 then
					v375:Cancel()
				end

				u33(cFrame2)
			end
		end
	end
end
local function u92(p42, p43, p44)
	-- upvalues: s3 (ref), s2 (ref), TextLabel (ref), ReplicatedStorage (ref), LocalPlayer (ref), u47 (ref), cFrame (ref), CommF_ (ref), u34 (ref), u90 (ref), cFrame2 (ref), u33 (ref), n67 (ref)
	u47()

	if p44 >= 1500 then
		TextLabel.Text = "Doing Third Sea Puzzle / Transition"

		local v379 = CommF_:InvokeServer("TravelThirdSea", "Progress")

		if type(v379) == "number" and v379 >= 3 then
			TextLabel.Text = "Travel To Third Sea"
			CommF_:InvokeServer("TravelThirdSea")
		elseif CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") ~= 3 then
			if CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
				if LocalPlayer.PlayerGui.Main.Quest.Visible then
					if string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50 Swan Pirates") then
						if workspace.Enemies:FindFirstChild("Swan Pirate") then
							for _, child in pairs(workspace.Enemies:GetChildren()) do
								if child.Name == "Swan Pirate" and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
									u90(child, p43, p42, false, "Swan Pirate")
								end
							end
						else
							TextLabel.Text = "Doing Bartilo Quest | Wait For Swan Pirates"

							local v382 = nil

							if (CFrame.new(878, 122, 1235).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
								u34(CFrame.new(878, 122, 1235), 350)
							elseif (CFrame.new(878, 122, 1235).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
								if v382 then
									v382:Cancel()
								end

								u33(CFrame.new(878, 122, 1235))
							end
						end
					else
						CommF_:InvokeServer("AbandonQuest")
					end
				else
					CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
				end
			elseif CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 and (workspace.Enemies:FindFirstChild("Jeremy") or ReplicatedStorage:FindFirstChild("Jeremy")) then
				if workspace.Enemies:FindFirstChild("Jeremy") then
					for _, child in pairs(workspace.Enemies:GetChildren()) do
						if child.Name == "Jeremy" and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
							u90(child, p43, p42, false)
						end
					end
				elseif ReplicatedStorage:FindFirstChild("Jeremy") then
					local v385 = nil

					if (CFrame.new(2099.88159, 448.931, 648.997375).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
						u34(CFrame.new(2099.88159, 448.931, 648.997375), 350)
					elseif (CFrame.new(2099.88159, 448.931, 648.997375).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
						if v385 then
							v385:Cancel()
						end

						u33(CFrame.new(2099.88159, 448.931, 648.997375))
					end

					CommF_:InvokeServer("SetSpawnPoint")
				end
			elseif CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
				local n81 = 0.999881566

				u33(CFrame.new(-1837.46155, 44.2921753, 1656.1987, n81, -1.03885048E-22, -0.0153914848, 1.07805858E-22, 1, 2.53909284E-22, 0.0153914848, -2.55538502E-22, n81))
				task.wait(0.5)
				u33(CFrame.new(-1836, 11, 1714))
				task.wait(0.3)
				u33(CFrame.new(-1850.49329, 13.1789551, 1750.89685))
				task.wait(0.5)
				u33(CFrame.new(-1858.87305, 19.3777466, 1712.01807))
				task.wait(0.5)
				u33(CFrame.new(-1803.94324, 16.5789185, 1750.89685))
				task.wait(0.5)
				u33(CFrame.new(-1858.55835, 16.8604317, 1724.79541))
				task.wait(0.5)
				u33(CFrame.new(-1869.54224, 15.987854, 1681.00659))
				task.wait(0.5)
				u33(CFrame.new(-1800.0979, 16.4978027, 1684.52368))
				task.wait(0.5)
				u33(CFrame.new(-1819.26343, 14.795166, 1717.90625))
				task.wait(0.5)
				u33(CFrame.new(-1813.51843, 14.8604736, 1724.79541))
			end
		elseif not CommF_:InvokeServer("TravelThirdSea", "TalkedTrevor") then
			TextLabel.Text = "Talking to Trevor / Don Swan"

			local v387 = u34(CFrame.new(2284, 15, 905), 350)

			if v387 then
				v387.Completed:Wait()
			end

			CommF_:InvokeServer("TravelThirdSea", "TalkedTrevor")
		elseif workspace.Enemies:FindFirstChild("rip_indra") or ReplicatedStorage:FindFirstChild("rip_indra") then
			TextLabel.Text = "Defeating Rip Indra Boss"

			if workspace.Enemies:FindFirstChild("rip_indra") then
				for _, child in pairs(workspace.Enemies:GetChildren()) do
					if child.Name == "rip_indra" and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
						u90(child, p43, p42, false)
					end
				end
			else
				u34(CFrame.new(5308, 2, 474), 350)
			end
		else
			TextLabel.Text = "Travel To Third Sea (Red Head NPC)"
			CommF_:InvokeServer("TravelThirdSea")
		end
	elseif workspace.Enemies:FindFirstChild("Core") or ReplicatedStorage:FindFirstChild("Core") then
		if workspace.Enemies:FindFirstChild("Core") then
			for _, child in pairs(workspace.Enemies:GetChildren()) do
				if child.Name == "Core" and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") then
					u90(child, p43, p42, false)
				end
			end
		elseif ReplicatedStorage:FindFirstChild("Core") then
			u34(CFrame.new(448.46756, 199.356781, -441.389252), 350)
		end
	elseif p44 >= 850 and (CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 or CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 or CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 and (workspace.Enemies:FindFirstChild("Jeremy") or ReplicatedStorage:FindFirstChild("Jeremy"))) then
		if CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
			if LocalPlayer.PlayerGui.Main.Quest.Visible then
				if string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50 Swan Pirates") then
					if workspace.Enemies:FindFirstChild("Swan Pirate") then
						for _, child in pairs(workspace.Enemies:GetChildren()) do
							if child.Name == "Swan Pirate" and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
								u90(child, p43, p42, false, "Swan Pirate")
							end
						end
					else
						TextLabel.Text = "Doing Bartilo Quest | Wait For Swan Pirates"

						local v394 = nil

						if (CFrame.new(878, 122, 1235).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
							u34(CFrame.new(878, 122, 1235), 350)
						elseif (CFrame.new(878, 122, 1235).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
							if v394 then
								v394:Cancel()
							end

							LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(878, 122, 1235)
						end
					end
				else
					CommF_:InvokeServer("AbandonQuest")
				end
			else
				CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
			end
		elseif CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 and (workspace.Enemies:FindFirstChild("Jeremy") or ReplicatedStorage:FindFirstChild("Jeremy")) then
			if workspace.Enemies:FindFirstChild("Jeremy") then
				for _, child in pairs(workspace.Enemies:GetChildren()) do
					if child.Name == "Jeremy" and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
						u90(child, p43, p42, false)
					end
				end
			elseif ReplicatedStorage:FindFirstChild("Jeremy") then
				local v397 = nil

				if (CFrame.new(2099.88159, 448.931, 648.997375).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
					u34(CFrame.new(2099.88159, 448.931, 648.997375), 350)
				elseif (CFrame.new(2099.88159, 448.931, 648.997375).Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
					if v397 then
						v397:Cancel()
					end

					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2099.88159, 448.931, 648.997375)
				end

				CommF_:InvokeServer("SetSpawnPoint")
			end
		elseif CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
			local n82 = 0.999881566

			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1837.46155, 44.2921753, 1656.1987, n82, -1.03885048E-22, -0.0153914848, 1.07805858E-22, 1, 2.53909284E-22, 0.0153914848, -2.55538502E-22, n82)
			task.wait(1)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1836, 11, 1714)
			task.wait(0.5)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
			task.wait(1)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
			task.wait(1)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
			task.wait(1)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
			task.wait(1)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)
			task.wait(1)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
			task.wait(1)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)
			task.wait(1)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
		end
	elseif not p42.Visible then
		TextLabel.Text = "Auto Farming Level | Get Quest"

		local v399 = nil

		if (cFrame.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
			u34(cFrame, 350)
		elseif (cFrame.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
			if v399 then
				v399:Cancel()
			end

			LocalPlayer.Character.HumanoidRootPart.CFrame = cFrame
			CommF_:InvokeServer("StartQuest", s3, n67)
			CommF_:InvokeServer("SetSpawnPoint")
		end
	elseif p42.Visible then
		local v400 = false

		if workspace.Enemies:FindFirstChild(s2) then
			for _, child in pairs(workspace.Enemies:GetChildren()) do
				if child.Name == s2 and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
					v400 = true
					u90(child, p43, p42)
				end
			end
		end

		if not v400 then
			TextLabel.Text = "Auto Farming Level | Wait For " .. tostring(s2)

			local v403 = nil

			if (cFrame2.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
				u34(cFrame2, 350)
			elseif (cFrame2.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
				if v403 then
					v403:Cancel()
				end

				LocalPlayer.Character.HumanoidRootPart.CFrame = cFrame2
			end
		end
	end
end
local function u93(p45, p46, _)
	-- upvalues: u90 (ref), s3 (ref), TextLabel (ref), n67 (ref), LocalPlayer (ref), u47 (ref), s2 (ref), cFrame (ref), CommF_ (ref), u34 (ref), cFrame2 (ref)
	u47()

	if not p45.Visible then
		TextLabel.Text = "Auto Farming Level (Sea 3) | Get Quest"

		local v407 = nil

		if (cFrame.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
			u34(cFrame, 350)
		elseif (cFrame.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
			if v407 then
				v407:Cancel()
			end

			LocalPlayer.Character.HumanoidRootPart.CFrame = cFrame
			CommF_:InvokeServer("StartQuest", s3, n67)
			CommF_:InvokeServer("SetSpawnPoint")
		end
	elseif p45.Visible then
		local v408 = false

		if workspace.Enemies:FindFirstChild(s2) then
			for _, child in pairs(workspace.Enemies:GetChildren()) do
				if child.Name == s2 and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
					v408 = true
					u90(child, p46, p45)
				end
			end
		end

		if not v408 then
			TextLabel.Text = "Auto Farming Level (Sea 3) | Wait For " .. tostring(s2)

			local v411 = nil

			if (cFrame2.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
				u34(cFrame2, 350)
			elseif (cFrame2.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
				if v411 then
					v411:Cancel()
				end

				LocalPlayer.Character.HumanoidRootPart.CFrame = cFrame2
			end
		end
	end
end

local t17 = {
	["Black Leg"] = {
		NPC = "Dark Step Teacher",
		Price = {
			Beli = 150000,
			Fragments = 0
		},
		BuyID = "BuyBlackLeg",
		RequiredMastery = 400,
		IsCompleted = false,
		World = 1
	},
	Electro = {
		NPC = "Mad Scientist",
		Price = {
			Beli = 500000,
			Fragments = 0
		},
		BuyID = "BuyElectro",
		RequiredMastery = 400,
		IsCompleted = false,
		World = 1
	}
}
local t18 = {
	NPC = "Water Kung-fu Teacher"
}
local t19 = {
	Beli = 750000
}
local n83 = 0

t19.Fragments = n83
t18.Price = t19
t18.BuyID = "BuyFishmanKarate"
t18.RequiredMastery = 400
t18.IsCompleted = false
t18.World = 1
t17["Fishman Karate"] = t18
t17["Dragon Claw"] = {
	NPC = "Sabi",
	Price = {
		Beli = n83,
		Fragments = 1500
	},
	BuyID = "BuyDragonClaw",
	RequiredMastery = 400,
	IsCompleted = false,
	World = 2
}
t17.Superhuman = {
	NPC = "Martial Arts Master",
	Price = {
		Beli = 3000000,
		Fragments = 0
	},
	BuyID = "BuySuperhuman",
	RequiredMastery = 300,
	IsCompleted = false,
	World = 2
}
t17["Death Step"] = {
	NPC = "Phoeyu, the Reformed",
	Price = {
		Beli = 2500000,
		Fragments = 5000
	},
	BuyID = "BuyDeathStep",
	RequiredMastery = 400,
	IsCompleted = false,
	World = 2
}
t17["Sharkman Karate"] = {
	NPC = "Sharkman Teacher",
	Price = {
		Beli = 2500000,
		Fragments = 5000
	},
	BuyID = "BuySharkmanKarate",
	RequiredMastery = 400,
	IsCompleted = false,
	World = 2
}
t17["Electric Claw"] = {
	NPC = "Previous Hero",
	Price = {
		Beli = 3000000,
		Fragments = 5000
	},
	BuyID = "BuyElectricClaw",
	RequiredMastery = 400,
	IsCompleted = false,
	World = 3
}
t17["Dragon Talon"] = {
	NPC = "Uzoth",
	Price = {
		Beli = 3000000,
		Fragments = 5000
	},
	BuyID = "BuyDragonTalon",
	RequiredMastery = 400,
	IsCompleted = false,
	World = 3
}
t17.Godhuman = {
	NPC = "Ancient Monk",
	Price = {
		Beli = 5000000,
		Fragments = 5000
	},
	BuyID = "BuyGodhuman",
	RequiredMastery = 400,
	IsCompleted = false,
	World = 3
}

local u98 = t17
local t20 = {
	["Death Step"] = { "Black Leg" },
	["Sharkman Karate"] = { "Fishman Karate" },
	["Electric Claw"] = { "Electro" },
	["Dragon Talon"] = { "Dragon Claw" },
	Godhuman = {
		"Superhuman",
		"Death Step",
		"Sharkman Karate",
		"Electric Claw",
		"Dragon Talon"
	}
}
local t21 = {
	"Black Leg",
	"Electro",
	"Fishman Karate",
	"Dragon Claw",
	"Superhuman",
	"Death Step",
	"Sharkman Karate",
	"Electric Claw",
	"Dragon Talon",
	"Godhuman"
}

task.spawn(function()
	-- upvalues: t20 (ref), t21 (ref), u98 (ref), CommF_ (ref)
	local u412 = nil

	for _, v in ipairs(t21) do
		u412 = u98[v]
		pcall(function()
			-- upvalues: u98 (ref), CommF_ (ref), u412 (ref), t20 (ref), v (ref)
			if CommF_:InvokeServer(u412.BuyID, true) == 1 and t20[v] then
				for _, v2 in ipairs(t20[v]) do
					if u98[v2] then
						u98[v2].IsCompleted = true
					end
				end
			end
		end)
		task.wait(0.05)
	end
end)
task.spawn(function()
	-- upvalues: u35 (ref), t21 (ref), u46 (ref), u86 (ref), ReplicatedStorage (ref), u2 (ref), u88 (ref), CommF_ (ref), TextLabel (ref), u85 (ref), u87 (ref), TextLabel2 (ref), u84 (ref), LocalPlayer (ref), u93 (ref), u92 (ref), u91 (ref), u34 (ref), u98 (ref), u37 (ref), u33 (ref)
	local AutoFarmLevel = nil

	v = nil

	local u417 = nil

	while true do
		if not u2 or not task.wait() then
			break
		end

		AutoFarmLevel = getgenv().Configs.AutoFarmLevel

		if AutoFarmLevel then
			AutoFarmLevel = u46
			AutoFarmLevel()

			local t22 = {}
			local v419 = true

			t22.kitsune = v419
			t22.leopard = v419
			t22.dragon = v419
			t22.dough = v419
			t22["t-rex"] = v419
			t22.mammoth = v419
			t22.venom = v419
			t22.control = v419
			t22.spirit = v419
			t22.shadow = v419
			t22.portal = v419
			t22.buddha = v419
			t22.blizzard = v419
			t22.sound = v419
			t22.rumble = v419
			t22.magma = v419
			t22.light = v419

			local function v420(p48)
				-- upvalues: AutoFarmLevel (ref)
				if not p48 then
					return false
				end

				local v610 = string.lower(p48)

				for k in pairs(AutoFarmLevel) do
					if string.find(v610, k, 1, true) then
						return true
					end
				end

				return false
			end

			if getgenv().Configs.AutoStoreFruit then
				for _, child in workspace:GetChildren() do
					if string.find(child.Name:lower(), "fruit") and child:IsA("Model") and child:FindFirstChild("Handle") then
						local v423 = child:GetAttribute("OriginalName") or child.Name

						if v420(v423) then
							local v424 = CommF_:InvokeServer("getInventory")
							local v425 = true

							if type(v424) == "table" then
								for _, v in ipairs(v424) do
									v = v.Name

									if v423 == v then
										v425 = false

										break
									end
								end
							end

							if v425 and child and child:FindFirstChild("Handle") then
								local HandlePosition = child.Handle.Position

								u417 = LocalPlayer
								v = u417.Character

								if (HandlePosition - v.HumanoidRootPart.Position).Magnitude > 150 then
									local v429 = u34(child.Handle.CFrame, 350)

									TextLabel.Text = "Get " .. child.Name

									if v429 then
										v429.Completed:Wait()
									end

									task.wait(0.25)
								else
									local HandlePosition2 = child.Handle.Position

									u417 = LocalPlayer
									v = u417.Character

									if (HandlePosition2 - v.HumanoidRootPart.Position).Magnitude <= 150 then
										u33(child.Handle.CFrame)
										TextLabel.Text = "Get " .. child.Name
										task.wait(0.1)
									end
								end
							end
						end
					end
				end

				for _, child in LocalPlayer.Character:GetChildren() do
					if string.find(child.Name:lower(), "fruit") and child:IsA("Tool") and child:FindFirstChild("Handle") then
						local v433 = child:GetAttribute("OriginalName") or child.Name

						if v420(v433) then
							local v434 = CommF_:InvokeServer("getInventory")
							local v435 = true

							if type(v434) == "table" then
								for _, v in ipairs(v434) do
									v = v.Name

									if v433 == v then
										v435 = false

										break
									end
								end
							end

							if v435 and child then
								CommF_:InvokeServer("StoreFruit", v433, child)
							end
						end
					end
				end

				local Backpack = LocalPlayer:FindFirstChild("Backpack")

				if Backpack then
					for _, child in Backpack:GetChildren() do
						if string.find(child.Name:lower(), "fruit") and child:IsA("Tool") and child:FindFirstChild("Handle") then
							local v441 = child:GetAttribute("OriginalName") or child.Name

							if v420(v441) then
								local v442 = CommF_:InvokeServer("getInventory")
								local v443 = true

								if type(v442) == "table" then
									for _, v in ipairs(v442) do
										u417 = v.Name

										if v441 == u417 then
											v443 = false

											break
										end
									end
								end

								if v443 and child then
									u37(child.Name)

									local v445 = CommF_

									v = child
									v445:InvokeServer("StoreFruit", v441, v)
								end
							end
						end
					end
				end
			end

			u88()

			local Quest = LocalPlayer.PlayerGui.Main.Quest
			local QuestTitleTitle = Quest.Container.QuestTitle.Title
			local v448 = LocalPlayer
			local LevelValue = v448.Data.Level.Value
			local childName = nil
			local Backpack = v448:FindFirstChild("Backpack")

			if Backpack then
				for _, child in Backpack:GetChildren() do
					if child:IsA("Tool") and child.ToolTip == "Melee" then
						childName = child.Name

						break
					end
				end
			end

			if not childName and LocalPlayer.Character then
				for _, child in LocalPlayer.Character:GetChildren() do
					if child:IsA("Tool") and child.ToolTip == "Melee" then
						childName = child.Name

						break
					end
				end
			end

			if getgenv().Configs.AutoBuyMelee and childName then
				local v456 = u35(childName)
				local v457 = v456 and v456:FindFirstChild("Level") and tonumber(v456.Level.Value) or 0
				local v458 = u98[childName]

				if childName == "Combat" or v458 and v457 >= v458.RequiredMastery then
					for _, v in ipairs(t21) do
						v = u98[v]
						u417 = v.IsCompleted

						if u417 then
							continue
						end

						if not (u87() < v.World) then
							u417 = false
							pcall(function()
								-- upvalues: v (ref), u417 (ref), CommF_ (ref)
								u417 = CommF_:InvokeServer(v.BuyID, true) == 1
							end)

							if u417 then
								local v461 = nil
								local v462 = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild(v.NPC) or ReplicatedStorage:FindFirstChild("NPCs") and ReplicatedStorage.NPCs:FindFirstChild(v.NPC)

								if v462 and v462:FindFirstChild("HumanoidRootPart") then
									v461 = u34(v462.HumanoidRootPart.CFrame, 350)
								end

								if v461 then
									TextLabel.Text = "Switching to " .. v
									v461.Completed:Wait()
								end

								pcall(function()
									-- upvalues: v (ref), CommF_ (ref)
									CommF_:InvokeServer(v.BuyID)
								end)

								local v463 = u35(v)
								local v464 = v463 and v463:FindFirstChild("Level") and tonumber(v463.Level.Value) or 0

								if v464 >= v.RequiredMastery then
									v.IsCompleted = true

									continue
								end

								TextLabel2.Text = "Farming " .. v .. " Mastery " .. v464 .. "/" .. v.RequiredMastery

								break
							end

							local v465 = LocalPlayer.Data.Beli.Value >= v.Price.Beli
							local v466 = not (v.Price.Fragments > 0) or LocalPlayer.Data.Fragments.Value >= v.Price.Fragments

							if v465 and v466 then
								local v467 = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild(v.NPC) or ReplicatedStorage:FindFirstChild("NPCs") and ReplicatedStorage.NPCs:FindFirstChild(v.NPC)

								if v467 and v467:FindFirstChild("HumanoidRootPart") then
									local v468 = u34(v467.HumanoidRootPart.CFrame, 350)

									if v468 then
										TextLabel.Text = "Buying " .. v
										v468.Completed:Wait()
									end
								end

								pcall(function()
									-- upvalues: v (ref), CommF_ (ref)
									CommF_:InvokeServer(v.BuyID)
								end)

								break
							end

							TextLabel2.Text = "Need Resources: " .. v .. " ($" .. v.Price.Beli .. " / " .. v.Price.Fragments .. " Frags)"

							break
						end

						u417 = true
						v.IsCompleted = u417
					end
				elseif v458 then
					local v469 = TextLabel2

					v = " Mastery "
					u417 = v457 .. "/" .. v458.RequiredMastery
					v469.Text = "Farming " .. childName .. v .. u417
				end
			end

			if u84 then
				u91(Quest, QuestTitleTitle, LevelValue)
			elseif u85 then
				u92(Quest, QuestTitleTitle, LevelValue)
			elseif u86 then
				u93(Quest, QuestTitleTitle, LevelValue)
			end
		end
	end
end)
task.spawn(function()
	-- upvalues: u84 (ref), CollectionService (ref), LocalPlayer (ref), u20 (ref), CommF_ (ref), u2 (ref)
	while u2 and task.wait(1.5) do
		local Configs = getgenv().Configs
		local AutoStats = Configs.AutoStats

		if AutoStats then
			Configs = LocalPlayer
			AutoStats = Configs.Data
		end

		if AutoStats then
			local Data = LocalPlayer.Data

			Configs = Data
			AutoStats = Data.FindFirstChild(Configs, "Points")
		end

		if AutoStats then
			Configs = LocalPlayer.Data.Points.Value
			AutoStats = Configs > 0
		end

		if AutoStats then
			local v473 = LocalPlayer

			AutoStats = v473.Data.Stats.Melee.Level.Value
			Configs = v473.Data.Stats.Defense.Level.Value
			pcall(function()
				-- upvalues: u20 (ref), CommF_ (ref), LocalPlayer (ref), AutoStats (ref), Configs (ref)
				local v612 = CommF_
				local v613 = LocalPlayer

				v612:InvokeServer("AddPoint", "Melee", v613.Data.Level.Value * 2 - AutoStats)
				CommF_:InvokeServer("AddPoint", "Defense", v613.Data.Level.Value - Configs)

				if AutoStats == u20 and Configs == u20 then
					CommF_:InvokeServer("AddPoint", "Sword", LocalPlayer.Data.Level.Value * 3 - u20 * 2)
				end
			end)
		end

		if getgenv().Configs.AutoHaki and LocalPlayer.Character and LocalPlayer.Data and LocalPlayer.Data:FindFirstChild("Beli") then
			pcall(function()
				-- upvalues: u84 (ref), CollectionService (ref), LocalPlayer (ref), CommF_ (ref)
				if not CollectionService:HasTag(LocalPlayer.Character, "Buso") and LocalPlayer.Data.Beli.Value >= 25000 then
					CommF_:InvokeServer("BuyHaki", "Buso")
				end

				if not CollectionService:HasTag(LocalPlayer.Character, "Geppo") and LocalPlayer.Data.Beli.Value >= 10000 then
					CommF_:InvokeServer("BuyHaki", "Geppo")
				end

				if not CollectionService:HasTag(LocalPlayer.Character, "Soru") and LocalPlayer.Data.Beli.Value >= 100000 then
					CommF_:InvokeServer("BuyHaki", "Soru")
				end

				if not CollectionService:HasTag(LocalPlayer.Character, "Ken") and u84 and LocalPlayer.Data.Beli.Value >= 750000 then
					CommF_:InvokeServer("KenTalk", "Buy")
				end

				if getgenv().Configs.AutoRandomFruit then
					CommF_:InvokeServer("Cousin", "Buy")
				end
			end)
		end
	end
end)
t9:Notify({
	Title = "Obsidian Glass Hub",
	Content = "Blox Fruits Engine Running (Smooth Flight & Instant Attack Fixed)!",
	Duration = 5
})

