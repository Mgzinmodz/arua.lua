-- // SERVICES
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ATUALIZAR CHARACTER
local Character = Player.Character or Player.CharacterAdded:Wait()
Player.CharacterAdded:Connect(function(char)
    Character = char
end)

-- // GUI PRINCIPAL
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "MGCHEATS"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999

-- ==============================================
-- // BOTÃO
-- ==============================================
local Button = Instance.new("TextButton", ScreenGui)
Button.Size = UDim2.new(0,80,0,80)
Button.Position = UDim2.new(0.02,0,0.45,0)
Button.Text = "MG"
Button.BackgroundColor3 = Color3.new(0,0,0)
Button.TextColor3 = Color3.new(1,0,0)
Button.Draggable = true
Button.Font = Enum.Font.GothamBold
Button.TextSize = 36

Instance.new("UICorner", Button).CornerRadius = UDim.new(1,0)
local Stroke = Instance.new("UIStroke", Button)
Stroke.Thickness = 4
Stroke.Color = Color3.new(1,0,0)

-- ==============================================
-- // MENU
-- ==============================================
local Menu = Instance.new("Frame", ScreenGui)
Menu.Size = UDim2.new(0, 400, 0, 400)
Menu.Position = UDim2.new(0.05,0,0.1,0)
Menu.BackgroundColor3 = Color3.new(0.1,0.1,0.1)
Menu.Visible = false
Menu.Active = true
Menu.Draggable = true

Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,15)

-- ABRIR / FECHAR
Button.MouseButton1Click:Connect(function()
    Menu.Visible = not Menu.Visible
end)

-- ==============================================
-- // FUNÇÃO NOTIFICAÇÃO
-- ==============================================
local function Notify(txt)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "MGCHEATS",
            Text = txt,
            Duration = 3
        })
    end)
end

-- ==============================================
-- // BOTÃO CRIADOR
-- ==============================================
local Y = 20
local function AddButton(nome, callback)
    local Btn = Instance.new("TextButton", Menu)
    Btn.Size = UDim2.new(0.9,0,0,45)
    Btn.Position = UDim2.new(0.05,0,0,Y)
    Btn.Text = nome
    Btn.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 16
    
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,8)
    
    Y = Y + 55
    
    Btn.MouseButton1Click:Connect(callback)
end

-- ==============================================
-- // FUNÇÕES REAIS
-- ==============================================

-- SPEED
AddButton("⚡ SPEED x2", function()
    if Character and Character:FindFirstChild("Humanoid") then
        Character.Humanoid.WalkSpeed = 32
        Notify("Speed ativado")
    end
end)

-- RESET SPEED
AddButton("🐢 SPEED NORMAL", function()
    if Character and Character:FindFirstChild("Humanoid") then
        Character.Humanoid.WalkSpeed = 16
        Notify("Speed normal")
    end
end)

-- SUPER PULO
AddButton("🦘 SUPER PULO", function()
    if Character and Character:FindFirstChild("Humanoid") then
        Character.Humanoid.JumpPower = 100
        Notify("Super pulo ativado")
    end
end)

-- RESET PULO
AddButton("⬇️ PULO NORMAL", function()
    if Character and Character:FindFirstChild("Humanoid") then
        Character.Humanoid.JumpPower = 50
        Notify("Pulo normal")
    end
end)

-- ==============================================
print("✅ MGCHEATS FUNCIONAL (SEM FAKE)")
