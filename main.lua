-- // SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
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
-- // BOTÃO FLUTUANTE
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
-- // MENU PRINCIPAL
-- ==============================================
local Menu = Instance.new("Frame", ScreenGui)
Menu.Size = UDim2.new(0, 450, 0, 700) -- AUMENTEI O TAMANHO
Menu.Position = UDim2.new(0.05,0,0.1,0)
Menu.BackgroundColor3 = Color3.new(0.1,0.1,0.1)
Menu.Active = true
Menu.Draggable = true
Menu.Visible = false

Instance.new("UICorner", Menu).CornerRadius = UDim.new(0,15)

-- TOPO
local TopBar = Instance.new("Frame", Menu)
TopBar.Size = UDim2.new(1,0,0,50)
TopBar.Position = UDim2.new(0,0,0,0)
TopBar.BackgroundColor3 = Color3.new(0,0,0)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.Text = "★ MGCHEATS ★"
Title.TextColor3 = Color3.new(1,0,0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22

-- ==============================================
-- // SISTEMA DE AURA
-- ==============================================
local YAtual = 60

-- TITULO
local TituloAura = Instance.new("TextLabel", Menu)
TituloAura.Size = UDim2.new(0.9,0,0,40)
TituloAura.Position = UDim2.new(0.05,0,0,YAtual)
TituloAura.BackgroundTransparency = 1
TituloAura.Text = "# PEGAR AURA"
TituloAura.TextColor3 = Color3.new(1,1,0)
TituloAura.Font = Enum.Font.GothamBold
TituloAura.TextSize = 18
YAtual = YAtual + 50

-- INPUT PARA DIGITAR
local InputAura = Instance.new("TextBox", Menu)
InputAura.Size = UDim2.new(0.9,0,0,45)
InputAura.Position = UDim2.new(0.05,0,0,YAtual)
InputAura.PlaceholderText = "Quantas Aura? (1 até 1.000.000)"
InputAura.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
InputAura.TextColor3 = Color3.new(1,1,1)
InputAura.Font = Enum.Font.GothamBold
InputAura.Text = "1000"
YAtual = YAtual + 55

-- BOTÃO PEGAR
local BtnPegar = Instance.new("TextButton", Menu)
BtnPegar.Size = UDim2.new(0.9,0,0,50)
BtnPegar.Position = UDim2.new(0.05,0,0,YAtual)
BtnPegar.Text = "✅ PEGAR AURA"
BtnPegar.BackgroundColor3 = Color3.new(0,1,0)
BtnPegar.TextColor3 = Color3.new(1,1,1)
BtnPegar.Font = Enum.Font.GothamBold
BtnPegar.TextSize = 18
YAtual = YAtual + 70

-- ==============================================
-- // CATEGORIA ITENS
-- ==============================================
local TituloItens = Instance.new("TextLabel", Menu)
TituloItens.Size = UDim2.new(0.9,0,0,40)
TituloItens.Position = UDim2.new(0.05,0,0,YAtual)
TituloItens.BackgroundTransparency = 1
TituloItens.Text = "# ITENS"
TituloItens.TextColor3 = Color3.new(0,1,1)
TituloItens.Font = Enum.Font.GothamBold
TituloItens.TextSize = 18
YAtual = YAtual + 50

-- ==============================================
-- // LISTA DE TODOS OS ITENS
-- ==============================================
local Itens = {
    "🔥 Aura Vermelha",
    "💧 Aura Azul",
    "🍃 Aura Verde",
    "☯️ Aura Roxa",
    "⚪ Aura Branca",
    "⚫ Aura Preta",
    "🌑 Aura Escura",
    "🔨 Martelo MiniSmit",
    "💜 Tapa de Erro",
    "🌌 Bofetada do Vazio",
    "🔥 Tapa de Lava",
    "👊 Batida Dourada",
    "🪁 Voe",
    "🛡️ Administrador",
    "🔫 Laser"
}

-- CRIAR BOTÕES
local BotoesItens = {}
for i, nomeItem in pairs(Itens) do
    local Btn = Instance.new("TextButton", Menu)
    Btn.Size = UDim2.new(0.9,0,0,45)
    Btn.Position = UDim2.new(0.05,0,0,YAtual)
    Btn.Text = nomeItem
    Btn.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 14
    
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,8)
    
    BotoesItens[Btn] = nomeItem
    YAtual = YAtual + 50
end

-- ==============================================
-- // FUNÇÕES
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

local function EncontrarValor(nome)
    if Player:FindFirstChild("leaderstats") then
        for _, v in pairs(Player.leaderstats:GetChildren()) do
            if string.find(string.lower(v.Name), string.lower(nome)) then
                return v
            end
        end
    end
    return nil
end

local function DarAura(qtd)
    local valor = EncontrarValor("aura")
    if valor then
        valor.Value = qtd
        Notificar("SUCESSO", "Ganhou "..qtd.." Aura!")
    else
        Notificar("ERRO", "Aura não encontrada")
    end
end

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
-- // BOTÕES FUNCIONANDO
-- ==============================================
Button.MouseButton1Click:Connect(function() Menu.Visible = not Menu.Visible end)

BtnPegar.MouseButton1Click:Connect(function()
    local qtd = tonumber(InputAura.Text) or 0
    if qtd < 1 then qtd = 1 end
    if qtd > 1000000 then qtd = 1000000 end
    InputAura.Text = tostring(qtd)
    DarAura(qtd)
end)

for btn, nome in pairs(BotoesItens) do
    btn.MouseButton1Click:Connect(function()
        EquiparItem(nome)
    end)
end

print("✅ SCRIPT PRONTO - MENU COMPLETO")

