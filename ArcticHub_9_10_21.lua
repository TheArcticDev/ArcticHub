function sendRoulette()

    local PLRIDD = string.reverse(tostring(game.Players.LocalPlayer.Name.."/"..game.Players.LocalPlayer.UserId))
    local RSLT = game:GetService("HttpService"):UrlEncode(PLRIDD)


        local response = http_request(
        {
            Url = ('https://bonfirerbx.000webhostapp.com/Roulette.php?ArcticHubKey=' .. RSLT),  -- This website helps debug HTTP requests
        }
    )
end

getgenv().BuildingOn = true
getgenv().AUTOFARMS = true
getgenv().AUTOFARM = true
getgenv().LoopOn = true
getgenv().AutoAl = true
getgenv().AutoOCLoop = true
getgenv().AntiBLL = true
getgenv().BLALL = true
getgenv().AntiLag = true
getgenv().BREAK = true
if getgenv().CurrentLooping then
getgenv().CurrentLooping:Disconnect()
getgenv().CurrentLooping = nil
end

if game.CoreGui:FindFirstChild("ArcticHub") then
    getgenv().BREAK = true
    getgenv().LoopOn = false
	wait(0.3)
	game.CoreGui:FindFirstChild("ArcticHub"):Destroy()
end

if not game:IsLoaded() then
	local notLoaded = Instance.new("Message",workspace)
	notLoaded.Text = 'Please wait for the game to load!'
	game.Loaded:Wait()
	notLoaded:Destroy()
end

getgenv().BuildingOn = true
getgenv().AUTOFARMS = true
getgenv().AUTOFARM = false
getgenv().LoopOn = true
getgenv().AutoAl = false
getgenv().AutoOCLoop = false
getgenv().AntiBLL = false
getgenv().BLALL = false
getgenv().BREAK = false
getgenv().AntiLag = false
--Get the ui lib and add pages according to the scripts I have
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Deno-OwO/RPM-Hub/main/UILib.lua"))()

local WS = game:GetService("Workspace")

local LP = game:GetService("Players").LocalPlayer

local Slots = Instance.new("Folder")
Slots.Parent = game:GetService("ReplicatedStorage")

local positionHolder = Instance.new("StringValue")
positionHolder.Parent = game:GetService("ReplicatedStorage")
positionHolder.Value = "0"

--Create new UI
local RPM = lib.new("ArcticHub")
---------------------------------------------------------------

--Player stats
local WS = "16"
local JP = "50"
local GR = "196.2"
local FarmingBoost = "1H Mining Boost"
---------------------------------------------------------------

--Local player functions
local M = RPM:addPage("Local", 5012544693)
local Player = M:addSection("Local stuff")
local QAP = M:addSection("Quick Access")

QAP:addButton("Roulette (1/6 chance of being banned)", function()
	local triggernumber = math.random(1,6)
	local sent = math.random(1,6)
	if triggernumber == sent then
		game:GetService("ReplicatedStorage").Events:FindFirstChild("BanMe"):FireServer()
		wait(0.1)
		game:GetService("GuiService"):ClearError()
		game:GetService("Players").LocalPlayer:Kick("get nae nae'd")
		sendRoulette()
	else
	end
end)

Player:addSlider("Walkspeed", 16, 16, 1000, function(v)
    WS = tostring(v)
end)

Player:addSlider("Jump Power", 50, 0, 1000, function(v)
    JP = tostring(v)
end)

Player:addSlider("Gravity", 196.2, 0, 10000, function(v)
    GR = tostring(v)
end)
---------------------------------------------------------------

--Teleports
local Teleports = RPM:addPage("Teleports", 5012544693)
local BaseHome = Teleports:addSection("Base")
local Teleport = Teleports:addSection("Teleport")

local PTP = BaseHome:addButton("Unlock TP Gamepass", function()
    unlockTPG()
end)

local Base = BaseHome:addButton("Return To Base", function()
    FindBase()
end)
---------------------------------------------------------------

--Codes

local ABPG = RPM:addPage("Codes/Quests", 5012544693)
local CODES = ABPG:addSection("Codes")

local RedC = CODES:addButton("Redeem Codes", function()
	callBackCodes()
end)

function callBackCodes()
for i,v in pairs(game.Workspace:GetDescendants()) do
    if v:IsA("TextLabel") then
        local oldSTR = v.Text
        local newSTR = oldSTR:split(": ")
        if tostring(newSTR[1]) == "Code" then  
        	wait(0.5)   	
			game:GetService("ReplicatedStorage").Events.CodeRedem:InvokeServer(tostring(newSTR[2]))	
			end
		end
	end
end

function addCodes()
	local num = 1
	for i,v in pairs(game.Workspace:GetDescendants()) do
		if v:IsA("TextLabel") then
			local oldSTR = v.Text
			local newSTR = oldSTR:split(":")
			if tostring(newSTR[1]) == "Code" then
				local newSlot = CODES:addTextLabel("Code "..num..": ".. tostring(newSTR[2]), tostring(newSTR[2]), function()
				end)
				num = num + 1
			end
		end
	end
end
addCodes()

local Quests = ABPG:addSection("Quests")

local ToQMan = Quests:addButton("Go to quest giver", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(187.689728, 6.03164291, 72.2543869, 0.0958411396, 5.37516343e-08, -0.995396614, 3.72814046e-09, 1, 5.43591767e-08, 0.995396614, -8.92082408e-09, 0.0958411396)
end)

local QuestsTP = ABPG:addSection("Quest Teleports")

local Fishy = QuestsTP:addButton("Fish", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-26.5870438, 10.948987, -67.6271896, -0.139131501, -2.93790325e-08, 0.990273893, 3.35829986e-09, 1, 3.01394145e-08, -0.990273893, 7.51897922e-09, -0.139131501)
end)

local Diamond = QuestsTP:addButton("Diamond", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(155.517624, 17.1508198, -506.099915, 0.727396548, 2.45655372e-08, 0.686217368, -6.21378149e-08, 1, 3.00681648e-08, -0.686217368, -6.4511525e-08, 0.727396548)
end)

local Bear = QuestsTP:addButton("Teddy Bear", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-297.320007, 33.7319679, 144.944611, 0.989875555, 3.52737228e-10, 0.141938135, 7.12619075e-09, 1, -5.21831538e-08, -0.141938135, 5.26663051e-08, 0.989875555)
end)

--Misc functions
local Misc = RPM:addPage("Misc", 5012544693)


local Autoblacklsit = Misc:addSection("Blacklist")

local ABL = Autoblacklsit:addToggle("Blacklist", false, function()
	if getgenv().BLALL == true then
		getgenv().BLALL = false
		elseif getgenv().BLALL == false then
			getgenv().BLALL = true
		end
	local Players = game:GetService("Players")
	for _, plr in pairs(Players:GetChildren()) do
		if plr ~= game.Players.LocalPlayer then
		game:GetService("ReplicatedStorage").Events.BlacklistPlayer:FireServer(plr)
	end
	end
	
		Players.PlayerAdded:Connect(function(plr)
			if getgenv().BLALL == true then
		game:GetService("ReplicatedStorage").Events.BlacklistPlayer:FireServer(plr)
	end
	end)
end)

local Whitelist = Misc:addSection("Force Whitelist")

local FWL = Whitelist:addToggle("Whitelist", false, function()
    if getgenv().AntiBLL == true then
    getgenv().AntiBLL = false
    elseif getgenv().AntiBLL == false then
        getgenv().AntiBLL = true
        end
end)

local NoLag = Misc:addSection("Hide Bases")

local BaseHide = NoLag:addToggle("Hide bases", false, function()
    if getgenv().AntiLag == true then
        getgenv().AntiLag = false
        unhideBase()
    elseif getgenv().AntiLag == false then
        getgenv().AntiLag = true
        hideBase()
    end
end)

function unhideBase()
	if getgenv().AntiLag == false then
        local PLRS = game:GetService("Players")
        local Me = PLRS.LocalPlayer
        local Buildings = game.Workspace.Buildings
        
        for g,p in pairs(Me.BuildsCached:GetChildren()) do
            if p.Name == Me.Name then
                else
                p.Parent = Buildings
            end
        end
	end
end

function hideBase()
	if getgenv().AntiLag == true then
        local PLRS = game:GetService("Players")
        local Me = PLRS.LocalPlayer
        local Buildings = game.Workspace.Buildings
        
        for g,p in pairs(Buildings:GetChildren()) do
            if p.Name == Me.Name then
                else
                p.Parent = Me.BuildsCached
            end
        end
	end
end

local RMB = Misc:addSection("Remove Barriers")

RMB:addButton("Remove", function()
	findBarriers()
end)


function findBarriers()
	for i,v in pairs(game.Workspace:GetDescendants()) do
		if v.Name == "Script" and v.Parent:FindFirstChild("SufaceGui") then
			v:remove()
		end
	end
end

---------------------------------------------------------------

--Misc functions
local Plot = RPM:addPage("Plot", 5012544693)


local PlotC = Plot:addSection("Plot Color")

PlotC:addColorPicker("Plot Color", Color3.fromRGB(99, 95, 98), function()
	
end)

PlotC:addButton("Set Color", function()
	local plotColor = game:GetService("CoreGui").ArcticHub.Main.Plot["Plot Color"].Container.ColorPicker.Button.ImageColor3
	
	game:GetService("ReplicatedStorage").Events.ChangePlotCol:FireServer(plotColor)	
end)

local CPlot = Plot:addSection("Quick-Load Plot")

local function checkPlots()
	local OwnedPlots = {"1"}
	local plr = game.Players.LocalPlayer
	if plr.OwnSecPlot.Value == true then
		table.insert(OwnedPlots, "2")
		if plr.OwnTrPlot.Value == true then
			table.insert(OwnedPlots, "3")
			if plr.OwnQdPlot.Value == true then
				table.insert(OwnedPlots, "4")
			end
		end
	end
	return OwnedPlots
end


CPlot:addDropdown("Choose Plot", checkPlots(), function()
	
end)

CPlot:addButton("Load!", function()
	local ToLoad = game:GetService("CoreGui").ArcticHub.Main.Plot["Quick-Load Plot"].Container.Dropdown.Search.TextBox.Text
	
	game:GetService("ReplicatedStorage").Events.LoadPlot:InvokeServer(tonumber(ToLoad))	
end)

---------------------------------------------------------------
--Save Plot

local AutobuilderPage = RPM:addPage("Autobuilder", 5012544693)
local ABSP = AutobuilderPage:addSection("Save Plot")

function makePlrTable()
	local Plrs = game:GetService("Players"):GetChildren()
	local PlrTable = {}
	for i=1, #Plrs do
		table.insert(PlrTable, Plrs[i].Name)
	end
	return PlrTable
end

ABSP:addDropdown("Select Player", makePlrTable(), function()
end)
ABSP:addTextbox("Name of file", "New Build", function()
end)

ABSP:addButton("Save to file", function()
	local ArcticHub = game:GetService("CoreGui").ArcticHub.Main.Autobuilder["Save Plot"].Container
	local FileName = ArcticHub.Textbox.Button.Textbox.Text
	local savingPLR = ArcticHub.Dropdown.Search.TextBox.Text
	
	local Buildings = game:GetService("Workspace"):FindFirstChild("Buildings")
	
	local NameFile = tostring(FileName..".ArcticBuild")
	
	local stringifiedPlayer = ""
	if isfile(NameFile) then
		sendNotificationQ("Confirm", "File already exists. Overwrite?", "", math.huge)
		else
		SaveFile()
	end
end)

function SaveFile()
	local ArcticHub = game:GetService("CoreGui").ArcticHub.Main.Autobuilder["Save Plot"].Container
	local FileName = ArcticHub.Textbox.Button.Textbox.Text
	local savingPLR = ArcticHub.Dropdown.Search.TextBox.Text
	
	local Buildings = game:GetService("Workspace"):FindFirstChild("Buildings")
	
	local NameFile = tostring(FileName..".ArcticBuild")
	
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Name == tostring(savingPLR) then
			stringifiedPlayer = v.Name
		end
	end
	local Found = Buildings:FindFirstChild(stringifiedPlayer)
	
	if Found then
		writefile(NameFile, "")
		for _,a in pairs(Found:GetChildren()) do
			if a.ClassName == "Model" and a.PrimaryPart ~= nil then
				local LP = game:GetService("Players"):FindFirstChild(tostring(a.Owner.Value))
				local myPlot = game:GetService("Workspace"):FindFirstChild("Plot_"..tostring(LP.PlotNum.Value)).Floor
				
				local X = a.PrimaryPart.Position.X - myPlot.Position.X
				local Y = a.PrimaryPart.Position.Y
				local Z = a.PrimaryPart.Position.Z - myPlot.Position.Z
				
				local x,y,z = a.PrimaryPart.CFrame:ToOrientation();
    
				local realY = math.floor(math.deg(y)+0);
				
				appendfile(NameFile, tostring(a.Name..":"..X..", "..Y..", "..Z..":"..realY..":"))
			end
		end
	end	
	local fuck = readfile(NameFile)
	local newFile = fuck:sub(0, -2)
	writefile(NameFile, newFile)
	sendNotification("Success!", "File saved!", "", 5)
end
---------------------------------------------------------------

--Load Plot

local loadPlot = AutobuilderPage:addSection("Load Plot")

loadPlot:addTextbox("Name of file", "New Build", function()
	
end)

loadPlot:addButton("Preview", function()
	if not game.Workspace:FindFirstChild("PreviewBase") then
		local folder = Instance.new("Folder")
		folder.Parent = game.Workspace
		folder.Name = "PreviewBase"
		else 
		local cjh = game.Workspace:FindFirstChild("PreviewBase"):GetChildren()
		for i=1, #cjh do
			cjh[i]:remove()
		end
	end
	local LP = game.Players.LocalPlayer

	local myPlot = game:GetService("Workspace"):FindFirstChild("Plot_"..tostring(LP.PlotNum.Value)).Floor
	
	local nameofFile = game:GetService("CoreGui").ArcticHub.Main.Autobuilder["Load Plot"].Container.Textbox.Button.Textbox.Text
	if isfile(nameofFile..".ArcticBuild") then
	local readstring = readfile(nameofFile..".ArcticBuild")
	local RawrX3 = string.split(readstring, ":")
	local obj = game:GetService("ReplicatedStorage").Objects
	
	local HTTPService = game:GetService("HttpService")
	
	local encoded = HTTPService:JSONEncode(RawrX3)
	
	local newSTR = HTTPService:JSONDecode(encoded)
	
	repeat

	local newobj = obj:FindFirstChild(newSTR[1]):Clone()
	newobj.Parent = game.Workspace:FindFirstChild("PreviewBase")
	newobj.Name = newSTR[1]
	for i,v in pairs(newobj:GetChildren()) do
		if v.Name == "Part" then	
			newobj.PrimaryPart = v
		end
		if v:IsA("MeshPart") or v:IsA("Part") and v.Name ~= "Part" then
			v.Transparency = 0.5
		end
	end
	local text = tostring(newSTR[2])
	local saved = Vector3.new(text:match("(.+), (.+), (.+)"))
	local X = saved.X + myPlot.Position.X
	local Y = saved.Y
	local Z = saved.Z + myPlot.Position.Z
	local newVec = Vector3.new(X,Y,Z)
	newobj:SetPrimaryPartCFrame(CFrame.new(newVec))
	newobj:SetPrimaryPartCFrame(newobj:GetPrimaryPartCFrame()*CFrame.fromEulerAnglesXYZ(0,math.rad(tonumber(newSTR[3])),0))
	table.remove(newSTR, 1)
	table.remove(newSTR, 1)
	table.remove(newSTR, 1)
	until newSTR[1] == nil
	sendNotification("Notice!", "Your preview is loaded!", "", 3)
		else
	sendNotification("Oops!", "This file does not exist", "", 5)
	end
end)


loadPlot:addButton("Build!", function()
    if game:GetService("Workspace"):FindFirstChild("PreviewBase") then
        game:GetService("Workspace"):FindFirstChild("PreviewBase"):remove()
    end
    
    local nameofFile = game:GetService("CoreGui").ArcticHub.Main.Autobuilder["Load Plot"].Container.Textbox.Button.Textbox.Text
    if isfile(nameofFile..".ArcticBuild") then
    local readstring = readfile(nameofFile..".ArcticBuild")
    local RawrX3 = string.split(readstring, ":")
    local obj = game:GetService("ReplicatedStorage").Objects
    
    local HTTPService = game:GetService("HttpService")
    
	local encoded = HTTPService:JSONEncode(RawrX3)
	
	local newSTR = HTTPService:JSONDecode(encoded)
	
    repeat
    if getgenv().BuildingOn == false then
    	break;
    	else
    local text = tostring(newSTR[2])
    local saved = Vector3.new(text:match("(.+), (.+), (.+)"))

    local LP = game.Players.LocalPlayer
    
	local chara = LP.Character
	
	local myPlot = game:GetService("Workspace"):FindFirstChild("Plot_"..tostring(LP.PlotNum.Value)).Floor
	
	local XX = saved.X + myPlot.Position.X
	local ZZ = saved.Z + myPlot.Position.Z
	chara:SetPrimaryPartCFrame(CFrame.new(Vector3.new(XX, 1, ZZ)))
    local args = {
        [1] = newSTR[1],
        [2] = XX,
        [3] = saved.Y,
        [4] = ZZ,
        [5] = newSTR[3]
    }

    game:GetService("ReplicatedStorage").Events.Place:FireServer(unpack(args))
    chara:SetPrimaryPartCFrame(CFrame.new(Vector3.new(XX, 1, ZZ)))
    wait(0.5)
    game:GetService("ReplicatedStorage").Events.Place:FireServer(unpack(args))
    wait(0.4)
    chara:SetPrimaryPartCFrame(CFrame.new(Vector3.new(XX, 1, ZZ)))
    table.remove(newSTR, 1)
    table.remove(newSTR, 1)
    table.remove(newSTR, 1)
end
    until newSTR[1] == nil
    FindBase()
    sendNotification("Done!", "Your plot is done!", "", 10)
    else
    sendNotification("Oops!", "This file does not exist", "", 5)
		end
end)


loadPlot:addButton("CANCEL", function()
	getgenv().BuildingOn = false
	
	wait(2)
	
	getgenv().BuildingOn = true
	
	FindBase()
end)

local function callback(text)
    if text == "Yes" then
        SaveFile()
    elseif text == "No" then
    end
end

local bindableFunction = Instance.new("BindableFunction")
bindableFunction.OnInvoke = callback

function sendNotificationQ(title, text, icon, duration)
	game.StarterGui:SetCore("SendNotification", {
		Title = title;
		Text = text;
		Icon = icon;
		Duration = duration;
		Callback = bindableFunction;
		Button1 = "Yes";
		Button2 = "No";
	})
end

function sendNotification(title, text, icon, duration)
	game.StarterGui:SetCore("SendNotification", {
		Title = title;
		Text = text;
		Icon = icon;
		Duration = duration;
	})
end

---------------------------------------------------------------

--Money functions

local Money = RPM:addPage("Money stuff", 5012544693)

local AutoAlg = Money:addSection("Auto Algorithm")

local AAL = AutoAlg:addToggle("Algorithm", false, function()
    FireAuto()
    if getgenv().AutoAl == true then
    getgenv().AutoAl = false
    elseif getgenv().AutoAl == false then
        getgenv().AutoAl = true
        end
end)

local AutoOC = Money:addSection("Auto Overclock")

local AOC = AutoOC:addToggle("Overclock", false, function()
    AutoOCFunc()
    if getgenv().AutoOCLoop == true then
    getgenv().AutoOCLoop = false
    elseif getgenv().AutoOCLoop == false then
        getgenv().AutoOCLoop = true
        end
end)

local SellC = Money:addSection("Exchange")
local SellcU = SellC:addButton("Exchange Currency", function()
    Sell()
end)

---------------------------------------------------------------

--Boost stars!
local BOOSTST = RPM:addPage("Boost Stars", 5012544693)

local AUBOOSTS = BOOSTST:addSection("Auto Use Boosts")

local boostTable = {"5 min Super Mining Boost", "15 min Mining Boost","30 min Mining Boost","1H Mining Boost"}
AUBOOSTS:addDropdown("1H Mining Boost", boostTable, function()
    
end)

AUBOOSTS:addButton("Set", function()
    FarmingBoost = tostring(game.CoreGui.ArcticHub.Main["Boost Stars"]["Auto Use Boosts"].Container.Dropdown.Search.TextBox.Text)
end)

AUBOOSTS:addToggle("On/Off", false, function()
    if getgenv().AUTOFARM == true then
        getgenv().AUTOFARM = false
    elseif getgenv().AUTOFARM == false then
        getgenv().AUTOFARM = true 
    end
end)

local ACBSTR = BOOSTST:addSection("Collect Boost Stars (On With Autofarm)")

ACBSTR:addToggle("On/Off", true, function()
    if getgenv().AUTOFARMS == true then
        getgenv().AUTOFARMS = false
    elseif getgenv().AUTOFARMS == false then
        getgenv().AUTOFARMS = true 
    end
end)
---------------------------------------------------------------

--Switch games
local games = RPM:addPage("Games", 5012544693)
local CMS = games:addSection("These are all coming soon!")
local List = games:addSection("Games")

local BCM = List:addButton("BitcoinMiner", function()
end)
local UDU = List:addButton("Coming soon: Ultimate Driving", function()
end)
local CC2 = List:addButton("Coming soon: Car Crushers 2", function()
end)
local SSC = List:addButton("Coming soon: Supercharged", function()
end)
local BAB = List:addButton("Build A Boat For Treasure", function()
    game:GetService("TeleportService"):Teleport(537413528, LocalPlayer) 
end)
---------------------------------------------------------------

--Credits
local Creds = RPM:addPage("Credits", 5012544693)

local Cont = Creds:addSection("Contributors")

local Scripter = Cont:addTextLabel("Scripter: ArcticDev", "Scripter", function()
end)

local UIDev = Cont:addTextLabel("UILib Dev: Luzu", "UILIBD", function()
end)

local Invite = Cont:addButton("Copy Server Invite (discord.gg/Dus8XEDup5)", function()
	if write_clipboard then
		write_clipboard("https://discord.gg/Dus8XEDup5")
		else
		setclipboard("https://discord.gg/Dus8XEDup5")
	end
end)

local Rem = Creds:addSection("Make sure to use common sense!")
---------------------------------------------------------------

--functions

--Find the players base

function FindBase()
	local name = game:GetService("Players").LocalPlayer.Character.Name
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if v:IsA("TextLabel") and v.Text == tostring(name .. "'s" .. " plot") then
			local plot = v.Parent.Parent.Parent.Parent.Floor
			local CF = plot.CFrame + Vector3.new(0, 15, 0)
			game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(CF)
		end
	end
end

---------------------------

--Unlock TP's
function unlockTPG()
	local plr = game:GetService("Players").LocalPlayer
	local plrGui = plr:FindFirstChild("PlayerGui")
	local Phone = plrGui:WaitForChild("Phone")
	local Warp = Phone.Frame.Apps.Warp
	if Warp.Locked.Visible == false then
	Warp.Locked.Visible = true
else
	if Warp.Locked.Visible == true then
		Warp.Locked.Visible = false
end
	end
end

---------------------------
--Add the teleport buttons
function addTeleports()
    local LPNAME = game:GetService("Players").LocalPlayer.Name
    local values_table = {}
    local dir = "Out"
    local Stype = "Quad"
    local dur = 0.5
    local CFrame_Table = {}

    local function add()
    	
        local Children = game:GetService("Workspace"):GetDescendants()
        
        for c = 1, #Children do
            if values_table[Children[c].Name] == nil then
                if Children[c].Name == "Trigger" then
                    local desc = Children[c]:GetDescendants()
                    for d = 1, #desc do
                        if desc[d].Name == "TouchInterest" then
                            if desc[d].Parent:IsA("Part") then
                                local uwu = desc[d].Parent.Parent.Parent
                                local OwO = desc[d].Parent.Position
                                values_table[uwu.Name] = 1
                                local Slot =
                                    Teleport:addButton(
                                    uwu.Name,
                                    function()
                                        local lp = game.Players.LocalPlayer.Character.HumanoidRootPart

                                        positionHolder.Name = tostring(uwu.Name)

                                        positionHolder.Value = tostring(OwO)

                                        local input = positionHolder.Value

                                        local values = input:split(",")

                                        local tpPoint = values[1], values[2], values[3]

                                        local position_string = values[1] .. ", " .. values[2] .. ", " .. values[3]

                                        local http = game:GetService("HttpService")

                                        local position_table = http:JSONDecode("[" .. position_string .. "]")

                                        local position = Vector3.new(unpack(position_table))

                                        lp.CFrame = CFrame.new(position)
                                        for key in pairs(position_table) do
                                            position_table[key] = nil
                                        end
                                    end
                                )
                            end
                        end
                    end
                end
            end
        end
    end
    add()
end


---------------------------

--antiblacklist
function AntiBlacklist()
	if getgenv().AntiBLL == true then
local ws = game:GetService("Workspace")
for i,v in pairs(ws:GetDescendants()) do
    if v:IsA("Part") then
        if v.Name == "Block" then
            v:remove()
        end
    end
end
end
end
---------------------------
--Autoblacklist
function AutoBlacklist()
    if getgenv().BLALL == true then
    	local Players = game:GetService("Players")
    	local phone = Players.LocalPlayer.PlayerGui.Phone.Frame:WaitForChild("PlotMang").ScrollingFrame

        for i,v in pairs(phone:GetChildren()) do
        	if v:IsA("TextButton") then
				if v.Bx.Tick.Visible == false then
					game:GetService("ReplicatedStorage").Events.BlacklistPlayer:FireServer(tostring(v.Parent.Parent.Title.Text))
					v.Bx.Tick.Visible = true
					else
				end
			end
		end
	end
end

--Sell
function Sell()
local pos = Vector3.new(248.9167175293, 6.3824172019958, 62.623783111572)
local saved = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
local args = {
    [1] = false
}
game:GetService("ReplicatedStorage").Events.ExchangeMoney:FireServer(unpack(args))

wait(0.6)

local args = {
    [1] = true
}

game:GetService("ReplicatedStorage").Events.ExchangeMoney:FireServer(unpack(args))
wait(0.2)
game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new((saved)))
end
---------------------------

--Auto Algorithm

function getHighest()
	local numberTable = {}
	for i,v in pairs(game.ReplicatedStorage.Algo:GetChildren()) do
		table.insert(numberTable, v.Value)
	end
	local highestnumber = 0
	for i, v in pairs(numberTable) do
		local number = tonumber(v)
		if number > highestnumber then
			highestnumber = number
		end
	end
	return highestnumber
end

function GetCorrect()
	local toReturn = tostring(getHighest())
	local toFire = tonumber(string.match(toReturn, "%d+"))
	local cantBe = tostring("Al"..toFire)
    local highest = tostring("Al"..toFire)
    local repl = game:GetService("ReplicatedStorage").Algo
    local Names = {["Al1"]="SHA-512",["Al2"]="Dagger",["Al3"]="Scrypt",["Al4"]="xs"}
    local findChild
    
    for i,v in pairs(repl:GetChildren()) do
        if v.Value == tonumber(toReturn) then
            findChild = Names[tostring(v.Name)]
        end
    end
    return findChild
end

function clickButton(v)
    local ButtonClick = game:GetService("Players")["ACC_Studios"].PlayerGui.Phone.Frame.MiningAlgorithms:FindFirstChild(v).But
    
    if ButtonClick then
        for a,b in pairs(getconnections(ButtonClick.MouseButton1Click)) do
            b:Fire()
        end
    end
end

function FireAuto()
	if getgenv().AutoAl == true then
		local Ticky = game:GetService("Players")["ACC_Studios"].PlayerGui.Phone.Frame.MiningAlgorithms:FindFirstChild("Tick", true)
	
		if Ticky.Parent.Name ~= tostring(GetCorrect()) then
			local v = tostring(GetCorrect())
			clickButton(v)
		end
    end
end

---------------------------

--Autofarm Boost Stars
function ClaimBoostStar()
    local Plr = game.Players.LocalPlayer
    local Boosts = Plr.PlayerGui.Boosts
    local bottomBoost = Boosts.TextButton.Bs
    local Claim = Boosts.Bar.TextLabel.TextButton
    local TEST = game:GetService("Players").LocalPlayer.InvenStack:GetChildren()
    local REPL = game:GetService("ReplicatedStorage").Objects:GetChildren()
    while wait(2) do
        if getgenv().AUTOFARM == true then
            if Claim.Visible == true then
                game:GetService("ReplicatedStorage").Events.ClaimFreeBoostStar:FireServer()
            end
        end
    end
end

function CalculateBoost()
    local FarmingBoost = "5 min Super Mining Boost"
    local Plr = game.Players.LocalPlayer
    local Boosts = Plr.PlayerGui.Boosts
    local bottomBoost = Boosts.TextButton.Bs
    local Claim = Boosts.Bar.TextLabel.TextButton
    local TEST = game:GetService("Players").LocalPlayer.InvenStack:GetChildren()
    local REPL = game:GetService("ReplicatedStorage").Objects:GetChildren()
    local count = 0
    if getgenv().AUTOFARM == true then
        if bottomBoost.Visible == false then
            count = count + 1
            for i=1, #TEST do
                if TEST[i].Name == FarmingBoost then
                    game:GetService("ReplicatedStorage").Events.UseBoost:FireServer(FarmingBoost)
                end
            end
            if count >= 3 then
                count = 0
                for i=1, #REPL do
                    if REPL[i].Name == FarmingBoost then
                        if Plr.BoostStars.Value >= REPL[i].BtPrice.Value then
                            game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(FarmingBoost)
                        end
                    end
                end
            end
        end
    end
end

---------------------------

--Collect Crates

function CollectCrates()
    local PLR = game:GetService("Players").LocalPlayer
    local GUI = PLR:FindFirstChild("PlayerGui")
    local Crates = GUI:WaitForChild("Crates")
    local BFrame = Crates.Frame
    
    if BFrame.ClmN.Visible == true then
        game.ReplicatedStorage.Events.ClmFrCrt:FireServer(false);
    elseif BFrame.ClmS.Visible == true then
        game.ReplicatedStorage.Events.ClmFrCrt:FireServer(true);
    end
end

---------------------------

--Auto Overclock

function AutoOCFunc()
	if getgenv().AutoOCLoop == true then
		if game:GetService("Players").LocalPlayer.PlayerGui.Lvl.TextLabel.Ovc.Visible == false then
			game:GetService("ReplicatedStorage").Events.Overclk:InvokeServer()
		end
    end
end

---------------------------------------------------------------

--Loop the player stats
spawn(function()
    while true do wait()
	    if getgenv().BREAK == true then break;
	        elseif getgenv().BREAK == false then
	        if getgenv().LoopOn == true then
                local PLR = game:GetService("Players").LocalPlayer.Character
                local stateType = Enum.HumanoidStateType
                if PLR:FindFirstChild("Humanoid") then
					local humanoid = PLR.Humanoid

					humanoid:SetStateEnabled(stateType.FallingDown, false)
					humanoid:SetStateEnabled(stateType.Ragdoll, false)
                    humanoid.WalkSpeed = WS
                    humanoid.JumpPower = JP
                    game.Workspace.Gravity = GR             	
                else 
                end
                else repeat wait() until getgenv().LoopOn == true
            end
	    end
    end
end)

function CollectBoost()
    local Plr = game.Players.LocalPlayer
    local Boosts = Plr.PlayerGui.Boosts
    local Claim = Boosts.Bar.TextLabel.TextButton
    
    if getgenv().AUTOFARMS == true then
        if Claim.Visible == true then
            game:GetService("ReplicatedStorage").Events.ClaimFreeBoostStar:FireServer()
        end
    end
end
    
spawn(function()
    while wait(5) do
        if getgenv().BREAK == true then break; else
            if getgenv().LoopOn == true then
                FireAuto()
                AutoOCFunc()
                AntiBlacklist()
                CollectBoost()
                CollectCrates()
                else repeat wait() until getgenv().LoopOn == true
            end
        end
    end
end)


    
spawn(function()
    local LPlr = game:GetService("Players").LocalPlayer
    local Boosts = LPlr:WaitForChild("PlayerGui").Boosts
    local bottomBoost = Boosts.TextButton.Bs
    local Claim = Boosts.Bar.TextLabel.TextButton
    local TEST = game:GetService("Players").LocalPlayer.InvenStack:GetChildren()
    local REPL = game:GetService("ReplicatedStorage").Objects:GetChildren()
    local count = 0
    while true do wait(2)
        if getgenv().AUTOFARM == true then
            if Claim.Visible == true then
                game:GetService("ReplicatedStorage").Events.ClaimFreeBoostStar:FireServer()
            else
                if bottomBoost.Visible == false then
                    count = count + 1
                    for i=1, #TEST do
                        if TEST[i].Name == FarmingBoost then
                            game:GetService("ReplicatedStorage").Events.UseBoost:FireServer(FarmingBoost)
                        end
                    end
                    if count >= 3 then
                        count = 0
                        for i=1, #REPL do
                            if REPL[i].Name == FarmingBoost then
                                if LPlr.BoostStars.Value >= REPL[i].BtPrice.Value then
                                    game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(FarmingBoost)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
addTeleports()
---------------------------------------------------------------

lib:SelectPage(M, true)
local isToggled = true

LP:GetMouse().KeyDown:Connect(function(K)
    if K == "1" then
        isToggled = not isToggled
        RPM:toggle(isToggled)
    end
end)