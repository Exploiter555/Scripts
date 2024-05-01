local Hub = {}

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

    local TabFrame = Instance.new("ScrollingFrame")
    TabFrame.Parent = Frame
    TabFrame.Size = UDim2.new(0, 300, 0, 50)
    TabFrame.Position = UDim2.new(0, 0, 0, 20)

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

    return Frame, TabFrame
end

function Hub.createTab(TabFrame, Text, Theme)
    local Tab = Instance.new("TextButton")
    Tab.Parent = TabFrame
    Tab.Text = Text
    Tab.Size = UDim2.new(0, 100, 0, 30)
    Tab.Position = UDim2.new(0, 0, 0, 0)

    local selectedTheme = {
        BackgroundColor3 = Color3.fromRGB(30, 30, 30), -- default dark theme
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }

    if Theme and themes[Theme] then
        selectedTheme = themes[Theme]
    end

    Tab.BackgroundColor3 = selectedTheme.TabColor3
    Tab.TextColor3 = selectedTheme.TextColor3

    return Tab
end

return Hub