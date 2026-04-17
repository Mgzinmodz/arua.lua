-- // SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local Character = Player.Character or Player.CharacterAdded:Wait()
Player.CharacterAdded:Connect(function(char)
    Character = char
end)

-- ==============================================
-- // ESTADOS
-- ==============================================
local ESP_PLAYER = false
local ESP_MURDER = false
local ESP_SHERIFF = false
local AIMBOT = false
local NOCLIP = false
local SPEED = false
local FLY = false
local FARM = false

-- ==============================================
-- // DETECTAR FUNÇÃO (MM2)
-- ==============================================
local function GetRole(plr)
    if not plr.Character then return "Player" end

    for _, v in pairs(plr.Backpack:GetChildren()) do
        if v.Name:lower():find("knife") then return "Murder" end
        if v.Name:lower():find("gun") then return "Sheriff" end
    end

    for _, v in pairs(plr.Character:GetChildren()) do
        if v.Name:lower():find("knife") then return "Murder" end
        if v.Name:lower():find("gun") then return "Sheriff" end
    end

    return "Player"
end

-- ==============================================
-- // ESP PRO
-- ==============================================
local function ApplyESP(plr, color)
    if plr == Player or not plr.Character then return end

    local char = plr.Character
    local hl = char:FindFirstChild("MG_ESP")

    if not hl then
        hl = Instance.new("Highlight")
        hl.Name = "MG_ESP"
        hl.FillTransparency = 0.5
        hl.OutlineTransparency = 0
        hl.Parent = char
    end

    hl.FillColor = color
    hl.OutlineColor = color
    hl.Enabled = true
end

local function RemoveESP(plr)
    if plr.Character and plr.Character:FindFirstChild("MG_ESP") then
        plr.Character.MG_ESP:Destroy()
    end
end

-- LOOP ESP
RunService.RenderStepped:Connect(function()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= Player then
            local role = GetRole(plr)

            if role == "Murder" and ESP_MURDER then
                ApplyESP(plr, Color3.fromRGB(255,0,0))

            elseif role == "Sheriff" and ESP_SHERIFF then
                ApplyESP(plr, Color3.fromRGB(0,150,255))

            elseif role == "Player" and ESP_PLAYER then
                ApplyESP(plr, Color3.fromRGB(0,255,0))

            else
                RemoveESP(plr)
            end
        end
    end
end)

-- ==============================================
-- // AIMBOT (FOCA MURDER)
-- ==============================================
RunService.RenderStepped:Connect(function()
    if not AIMBOT then return end

    local target = nil
    local dist = math.huge

    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= Player and plr.Character and plr.Character:FindFirstChild("Head") then
            if GetRole(plr) == "Murder" then
                local mag = (Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                if mag < dist then
                    dist = mag
                    target = plr
                end
            end
        end
    end

    if target then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
    end
end)

-- ==============================================
-- // SPEED
-- ==============================================
RunService.Heartbeat:Connect(function()
    if SPEED and Character and Character:FindFirstChild("Humanoid") then
        Character.Humanoid.WalkSpeed = 100
    end
end)

-- ==============================================
-- // NOCLIP
-- ==============================================
RunService.Stepped:Connect(function()
    if NOCLIP and Character then
        for _, v in pairs(Character:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)

-- ==============================================
-- // FLY PRO (MOBILE FUNCIONA)
-- ==============================================
RunService.Heartbeat:Connect(function()
    if FLY and Character and Character:FindFirstChild("HumanoidRootPart") then
        local hrp = Character.HumanoidRootPart
        hrp.Velocity = Camera.CFrame.LookVector * 60
    end
end)

-- ==============================================
-- // AUTO FARM (SEGURO)
-- ==============================================
RunService.Heartbeat:Connect(function()
    if FARM and Character and Character:FindFirstChild("HumanoidRootPart") then
        local hrp = Character.HumanoidRootPart

        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                if v.Name:lower():find("coin") or v.Name:lower():find("box") then
                    if (hrp.Position - v.Position).Magnitude < 20 then
                        firetouchinterest(hrp, v, 0)
                        firetouchinterest(hrp, v, 1)
                    end
                end
            end
        end
    end
end)

-- ==============================================
-- // ANTI AFK
-- ==============================================
Player.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),Workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),Workspace.CurrentCamera.CFrame)
end)

-- ==============================================
-- // CONTROLES
-- ==============================================
_G.ESP_PLAYER = function(v) ESP_PLAYER = v end
_G.ESP_MURDER = function(v) ESP_MURDER = v end
_G.ESP_SHERIFF = function(v) ESP_SHERIFF = v end
_G.AIMBOT = function(v) AIMBOT = v end
_G.NOCLIP = function(v) NOCLIP = v end
_G.SPEED = function(v) SPEED = v end
_G.FLY = function(v) FLY = v end
_G.FARM = function(v) FARM = v end

print("🔥 MG PRO SCRIPT CARREGADO")
