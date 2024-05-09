local Hub = {}

local Player = game:GetService("Players").LocalPlayer

function Hub.createFrame(Title, SelectTheme)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 300, 0, 500)
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.Draggable = true
    Frame.Parent = ScreenGui

    local FrameCorner = Instance.new("UICorner", Frame)
    FrameCorner.CornerRadius = UDim.new(0, 10)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = Frame
    TitleLabel.Text = Title or ""
    TitleLabel.Size = UDim2.new(0, 300, 0, 20)
    TitleLabel.Position = UDim2.new(0, 0, 0, 0)

    local TabFrame = Instance.new("Frame")
    TabFrame.Parent = Frame
    TabFrame.Size = UDim2.new(0, 300, 0, 30)
    TabFrame.Position = UDim2.new(0, 0, 0, 20)
    TabFrame.BackgroundTransparency = 1

    local themes = {
        dark = {
            BackgroundColor3 = Color3.fromRGB(15, 15, 15),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TabColor3 = Color3.fromRGB(30, 30, 30)
        },
        light = {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            TextColor3 = Color3.fromRGB(0, 0, 0),
            TabColor3 = Color3.fromRGB(200, 200, 200)
        }
    }

    local selectedTheme = themes.dark
    if SelectTheme and themes[SelectTheme] then
        selectedTheme = themes[SelectTheme]
    end

    Frame.BackgroundColor3 = selectedTheme.BackgroundColor3
    TitleLabel.TextColor3 = selectedTheme.TextColor3

    return Frame, TabFrame, selectedTheme
end

function Hub.createTab(Text, Frame, TabFrame, Theme)
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = TabFrame
    TabButton.Text = Text
    TabButton.Size = UDim2.new(0, 100, 0, 30)
    TabButton.Position = UDim2.new(0, 110 * (#TabFrame:GetChildren() - 1), 0, 0)
    TabButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Font = Enum.Font.Arial
    TabButton.TextSize = 16

    local selectedTheme = {
        BackgroundColor3 = Color3.fromRGB(30, 30, 30), 
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }

    if Theme and Theme.BackgroundColor3 and Theme.TextColor3 then
        selectedTheme = Theme
    end

    TabButton.BackgroundColor3 = selectedTheme.BackgroundColor3
    TabButton.TextColor3 = selectedTheme.TextColor3

    local TabContent = Instance.new("Frame")
    TabContent.Parent = Frame
    TabContent.Size = UDim2.new(1, 0, 1, -50)
    TabContent.Position = UDim2.new(0, 0, 0, 50)
    TabContent.BackgroundTransparency = 1
    TabContent.Visible = false

    return TabButton, TabContent
end

function Hub.activateTab(TabButton, TabContent)
    TabButton.MouseButton1Click:Connect(function()
        for _, child in ipairs(TabContent.Parent:GetChildren()) do
            if child:IsA("Frame") then
                child.Visible = false
            end
        end
        TabContent.Visible = true
    end)
end

return Hub