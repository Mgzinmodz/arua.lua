-- // SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- // CRIAR GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MGCheats"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- ==============================================
-- // BOTÃO FLUTUANTE VERMELHO NEON
-- ==============================================
local BtnMG = Instance.new("TextButton")
BtnMG.Name = "BtnMG"
BtnMG.Parent = ScreenGui
BtnMG.BackgroundColor3 = Color3.new(0, 0, 0)
BtnMG.BackgroundTransparency = 0.1
BtnMG.BorderSizePixel = 2
BtnMG.BorderColor3 = Color3.new(1, 0, 0)
BtnMG.Size = UDim2.new(0, 70, 0, 70)
BtnMG.Position = UDim2.new(0, 20, 0.5, 0)
BtnMG.Font = Enum.Font.GothamBlack
BtnMG.Text = "MG"
BtnMG.TextColor3 = Color3.new(1, 0, 0)
BtnMG.TextSize = 28

local UICornerBtn = Instance.new("UICorner")
UICornerBtn.CornerRadius = UDim.new(1, 0)
UICornerBtn.Parent = BtnMG

-- ==============================================
-- // MENU PRINCIPAL
-- ==============================================
local Menu = Instance.new("Frame")
Menu.Name = "MenuPrincipal"
Menu.Parent = ScreenGui
Menu.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
Menu.BorderSizePixel = 2
Menu.BorderColor3 = Color3.new(1, 0, 0)
Menu.Size = UDim2.new(0, 420, 0, 580)
Menu.Position = UDim2.new(0.5, -210, 0.5, -290)
Menu.Visible = false

local UICornerMenu = Instance.new("UICorner")
UICornerMenu.CornerRadius = UDim.new(0, 16)
UICornerMenu.Parent = Menu

-- ==============================================
-- // SISTEMA DE ABAS
-- ==============================================
local SideBar = Instance.new("Frame")
SideBar.Parent = Menu
SideBar.BackgroundTransparency = 1
SideBar.Size = UDim2.new(0, 60, 1, 0)
SideBar.Position = UDim2.new(0, 10, 0, 10)

local BotoesAbas = {}
local Paginas = {}

local function CriarAba(nome, icone, indice)
    local Btn = Instance.new("TextButton")
    Btn.Name = "Aba"..nome
    Btn.Parent = SideBar
    Btn.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    Btn.BorderSizePixel = 1
    Btn.BorderColor3 = Color3.new(1, 0, 0)
    Btn.Size = UDim2.new(0, 50, 0, 50)
    Btn.Position = UDim2.new(0, 0, 0, (indice-1)*70)
    Btn.Font = Enum.Font.GothamBold
    Btn.Text = icone
    Btn.TextColor3 = Color3.new(1, 0, 0)
    Btn.TextSize = 20
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = Btn
    
    local Pagina = Instance.new("Frame")
    Pagina.Name = "Pagina"..nome
    Pagina.Parent = Menu
    Pagina.BackgroundTransparency = 1
    Pagina.Size = UDim2.new(1, -90, 1, -20)
    Pagina.Position = UDim2.new(0, 80, 0, 10)
    Pagina.Visible = (indice == 1)
    
    table.insert(BotoesAbas, {Btn = Btn, Pagina = Pagina})
    return Pagina
end

-- ==============================================
-- // PÁGINA 1: FUNÇÕES PRINCIPAIS
-- ==============================================
local Pagina1 = CriarAba("COMBATE", "⚔️", 1)

local Titulo1 = Instance.new("TextLabel")
Titulo1.Parent = Pagina1
Titulo1.BackgroundTransparency = 1
Titulo1.Size = UDim2.new(1, 0, 0, 40)
Titulo1.Font = Enum.Font.GothamBlack
Titulo1.Text = "★ MG CHEATS ★"
Titulo1.TextColor3 = Color3.new(1, 0, 0)
Titulo1.TextSize = 24

local function CriarToggle(nome, posY)
    local Frame = Instance.new("Frame")
    Frame.Parent = Pagina1
    Frame.BackgroundColor3 = Color3.new(0.1, 0, 0)
    Frame.BorderColor3 = Color3.new(1, 0, 0)
    Frame.Size = UDim2.new(1, 0, 0, 50)
    Frame.Position = UDim2.new(0, 0, 0, posY)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = Frame
    
    local Texto = Instance.new("TextLabel")
    Texto.Parent = Frame
    Texto.BackgroundTransparency = 1
    Texto.Size = UDim2.new(0.7, 0, 1, 0)
    Texto.Position = UDim2.new(0, 10, 0, 0)
    Texto.Font = Enum.Font.GothamBold
    Texto.Text = nome
    Texto.TextColor3 = Color3.new(1, 1, 1)
    Texto.TextSize = 16
    Texto.TextXAlignment = Enum.TextXAlignment.Left
    
    local Toggle = Instance.new("TextButton")
    Toggle.Parent = Frame
    Toggle.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    Toggle.Size = UDim2.new(0, 50, 0, 30)
    Toggle.Position = UDim2.new(0.85, 0, 0.5, -15)
    Toggle.Text = ""
    
    local ToggleInner = Instance.new("Frame")
    ToggleInner.Parent = Toggle
    ToggleInner.BackgroundColor3 = Color3.new(1, 1, 1)
    ToggleInner.Size = UDim2.new(0, 26, 0, 26)
    ToggleInner.Position = UDim2.new(0, 2, 0.5, -13)
    
    local cornerT = Instance.new("UICorner")
    cornerT.CornerRadius = UDim.new(1, 0)
    cornerT.Parent = ToggleInner
    
    return { Botao = Toggle, Inner = ToggleInner, Frame = Frame }
end

-- // FUNÇÕES
local Aimbot = CriarToggle("Aimbot Murder", 60)
local ESP_Players = CriarToggle("ESP Players [Verde]", 120)
local ESP_Muder = CriarToggle("ESP Murder [Vermelho]", 180)
local ESP_Police = CriarToggle("ESP Polícia [Azul]", 240)
local AutoFarm = CriarToggle("Auto Farm", 300)
local Fly = CriarToggle("Modo Avião", 360)

-- ==============================================
-- // PÁGINA 2: OUTRAS OPÇÕES
-- ==============================================
local Pagina2 = CriarAba("ROUBADAS", "+", 2)

local Titulo2 = Instance.new("TextLabel")
Titulo2.Parent = Pagina2
Titulo2.BackgroundTransparency = 1
Titulo2.Size = UDim2.new(1, 0, 0, 40)
Titulo2.Font = Enum.Font.GothamBlack
Titulo2.Text = "OPÇÕES ROUBADAS"
Titulo2.TextColor3 = Color3.new(1, 0, 0)
Titulo2.TextSize = 22

local Speed = CriarToggle("Velocidade OP", 60)
local Noclip = CriarToggle("Noclip Ativar", 120)
local FullBright = CriarToggle("Tela Clara", 180)
local Antiafk = CriarToggle("Anti AFK", 240)

-- ==============================================
-- // ARRASTAR E ABRIR MENU
-- ==============================================
local dragging = false
local dragStart, startPos = nil, nil

BtnMG.MouseButton1Down:Connect(function()
    dragging = true
    dragStart = UserInputService:GetMouseLocation()
    startPos = BtnMG.Position
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = UserInputService:GetMouseLocation() - dragStart
        BtnMG.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

BtnMG.MouseButton1Click:Connect(function()
    Menu.Visible = not Menu.Visible
end)

-- ==============================================
-- // LÓGICA DOS BOTÕES
-- ==============================================
local function LigarDesligar(data, func)
    local estado = false
    data.Botao.MouseButton1Click:Connect(function()
        estado = not estado
        if estado then
            data.Inner:TweenPosition(UDim2.new(1, -28, 0.5, -13), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2)
            data.Botao.BackgroundColor3 = Color3.new(1, 0, 0)
        else
            data.Inner:TweenPosition(UDim2.new(0, 2, 0.5, -13), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2)
            data.Botao.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        end
        if func then func(estado) end
    end)
end

LigarDesligar(Aimbot)
LigarDesligar(ESP_Players)
LigarDesligar(ESP_Muder)
LigarDesligar(ESP_Police)
LigarDesligar(AutoFarm)
LigarDesligar(Fly)
LigarDesligar(Speed)
LigarDesligar(Noclip)
LigarDesligar(FullBright)
LigarDesligar(Antiafk)

-- Troca de abas
for i, v in pairs(BotoesAbas) do
    v.Btn.MouseButton1Click:Connect(function()
        for _, a in pairs(BotoesAbas) do
            a.Pagina.Visible = false
            a.Btn.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        end
        v.Pagina.Visible = true
        v.Btn.BackgroundColor3 = Color3.new(1, 0, 0)
    end)
end

-- ==============================================
-- // FUNÇÕES REAIS
-- ==============================================
local ESP_ATIVO = false
local ESP_MURDER_ATIVO = false
local ESP_SHERIFF_ATIVO = false
local AIMBOT_ATIVO = false
local NOCLIP = false
local SPEED_ATIVO = false
local FLY_ATIVO = false
local BRILHO_ATIVO = false
local FARM_ATIVO = false

-- // DETECTAR FUNÇÃO
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

-- // ESP COLORIDO
local function ApplyESP(plr, cor)
    if plr == Player or not plr.Character then return end
    local hl = plr.Character:FindFirstChild("MG_ESP")
    if not hl then
        hl = Instance.new("Highlight")
        hl.Name = "MG_ESP"
        hl.Parent = plr.Character
    end
    hl.FillColor = cor
    hl.OutlineColor = cor
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Enabled = true
end

ESP_Players.Botao.MouseButton1Click:Connect(function() ESP_ATIVO = not ESP_ATIVO end)
ESP_Muder.Botao.MouseButton1Click:Connect(function() ESP_MURDER_ATIVO = not ESP_MURDER_ATIVO end)
ESP_Police.Botao.MouseButton1Click:Connect(function() ESP_SHERIFF_ATIVO = not ESP_SHERIFF_ATIVO end)

-- // AIMBOT
Aimbot.Botao.MouseButton1Click:Connect(function() AIMBOT_ATIVO = not AIMBOT_ATIVO end)

-- // SPEED
Speed.Botao.MouseButton1Click:Connect(function()
    SPEED_ATIVO = not SPEED_ATIVO
    if Character and Character:FindFirstChild("Humanoid") then
        Character.Humanoid.WalkSpeed = SPEED_ATIVO and 100 or 16
    end
end)

-- // NOCLIP
Noclip.Botao.MouseButton1Click:Connect(function() NOCLIP = not NOCLIP end)

-- // FLY
Fly.Botao.MouseButton1Click:Connect(function() FLY_ATIVO = not FLY_ATIVO end)

-- // FULLBRIGHT
FullBright.Botao.MouseButton1Click:Connect(function()
    BRILHO_ATIVO = not BRILHO_ATIVO
    game.Lighting.Brightness = BRILHO_ATIVO and 3 or 1
end)

-- // ANTI AFK
Antiafk.Botao.MouseButton1Click:Connect(function()
    Player.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),Workspace.CurrentCamera.CFrame)
        task.wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),Workspace.CurrentCamera.CFrame)
    end)
end)

-- // LOOPS
RunService.RenderStepped:Connect(function()
    -- ESP LOOP
    if ESP_ATIVO or ESP_MURDER_ATIVO or ESP_SHERIFF_ATIVO then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= Player and plr.Character then
                local role = GetRole(plr)
                if role == "Murder" and ESP_MURDER_ATIVO then
                    ApplyESP(plr, Color3.new(1,0,0))
                elseif role == "Sheriff" and ESP_SHERIFF_ATIVO then
                    ApplyESP(plr, Color3.new(0,0.5,1))
                elseif role == "Player" and ESP_ATIVO then
                    ApplyESP(plr, Color3.new(0,1,0))
                elseif plr.Character:FindFirstChild("MG_ESP") then
                    plr.Character.MG_ESP:Destroy()
                end
            end
        end
    end
    
    -- AIMBOT LOOP
    if AIMBOT_ATIVO then
        local target = nil
        local dist = math.huge
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= Player and plr.Character and plr.Character:FindFirstChild("Head") then
                if GetRole(plr) == "Murder" then
                    local mag = (Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                    if mag < dist then dist = mag target = plr end
                end
            end
        end
        if target and target.Character and target.Character:FindFirstChild("Head") then
            Workspace
                
