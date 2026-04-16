-- // SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ATUALIZAR CHARACTER CORRETAMENTE
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

local StrokeBtn = Instance.new("UIStroke", Button)
StrokeBtn.Thickness = 4
StrokeBtn.Color = Color3.new(1,0,0)

-- ==============================================
-- // MENU
-- ==============================================
local Menu = Instance.new("Frame", ScreenGui)
Menu.Size = UDim2.new(0, 450, 0, 600)
Menu.Position = UDim2.new(0.05,0,0.1,0)
Menu.BackgroundColor3 = Color3.new(0.1,0.1,0.1)
Menu.Active = true
Menu.Draggable = true
Menu.Visible = false

Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,15)

-- ==============================================
-- // FUNÇÃO NOTIFICAÇÃO SEGURA
-- ==============================================
local function Notificar(titulo, texto)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = titulo;
            Text = texto;
            Duration = 3;
        })
    end)
end

-- ==============================================
-- // FUNÇÃO MELHORADA DE ALTERAR VALOR
-- ==============================================
local function EncontrarValor(nome)
    -- Procura no player primeiro (mais confiável)
    if Player:FindFirstChild("leaderstats") then
        for _, v in pairs(Player.leaderstats:GetChildren()) do
            if string.find(string.lower(v.Name), string.lower(nome)) then
                return v
            end
        end
    end

    -- Procura em tudo que o cliente pode acessar
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("IntValue") or obj:IsA("NumberValue") then
            if string.find(string.lower(obj.Name), string.lower(nome)) then
                return obj
            end
        end
    end

    return nil
end

-- ==============================================
-- // PEGAR AURA (MELHORADO)
-- ==============================================
local function DarAura(qtd)
    local valor = EncontrarValor("aura")

    if valor then
        pcall(function()
            valor.Value = qtd
        end)

        Notificar("SUCESSO", "Aura alterada!")
    else
        Notificar("ERRO", "Aura não encontrada no jogo")
    end
end

-- ==============================================
-- // EQUIPAR ITEM (MAIS SEGURO)
-- ==============================================
local function EquiparItem(nome)
    for _, tool in pairs(Player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and string.find(string.lower(tool.Name), string.lower(nome)) then
            tool.Parent = Character
            Notificar("ITEM", "Equipado: "..tool.Name)
            return
        end
    end

    Notificar("ERRO", "Item não encontrado")
end

-- ==============================================
-- // EXEMPLO BOTÃO (AURA)
-- ==============================================
local BtnAura = Instance.new("TextButton", Menu)
BtnAura.Size = UDim2.new(0.9,0,0,50)
BtnAura.Position = UDim2.new(0.05,0,0,80)
BtnAura.Text = "PEGAR AURA 9999"
BtnAura.BackgroundColor3 = Color3.new(0,1,0)
BtnAura.TextColor3 = Color3.new(1,1,1)

BtnAura.MouseButton1Click:Connect(function()
    DarAura(9999)
end)

-- ==============================================
-- // ABRIR MENU
-- ==============================================
Button.MouseButton1Click:Connect(function()
    Menu.Visible = not Menu.Visible
end)

print("✅ SCRIPT CORRIGIDO E ESTÁVEL")
