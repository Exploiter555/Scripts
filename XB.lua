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

    return Frame, TabFrame, selectedTheme
end

function Hub.createTab(Text, Theme)
    local TabFrame = Hub.TabFrame

    local Tab = Instance.new("TextButton")
    Tab.Parent = TabFrame
    Tab.Text = Text
    Tab.Size = UDim2.new(0, 100, 0, 30)
    Tab.Position = UDim2.new(0, 0, 0, 0)

    local selectedTheme = {
        BackgroundColor3 = Color3.fromRGB(30, 30, 30), -- default dark theme
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }

    if Theme and Theme.BackgroundColor3 and Theme.TextColor3 then
        selectedTheme = Theme
    end

    Tab.BackgroundColor3 = selectedTheme.BackgroundColor3
    Tab.TextColor3 = selectedTheme.TextColor3

    return Tab
end

function createSlider(Frame, Min, Max, DefaultValue, Position, Size, Callback)
    if Min >= Max then
        error("Min value must be less than Max value.")
    end

    local Slider = Instance.new("TextButton")
    Slider.Parent = Frame
    Slider.AutoButtonColor = false
    Slider.Text = ""
    Slider.Size = Size or UDim2.new(0, 200, 0, 20)
    Slider.Position = Position or UDim2.new(0, 0, 0, 0)

    local SliderBackground = Instance.new("Frame")
    SliderBackground.Parent = Slider
    SliderBackground.Size = UDim2.new(1, 0, 1, 0)
    SliderBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local SliderBar = Instance.new("Frame")
    SliderBar.Parent = SliderBackground
    SliderBar.Size = UDim2.new((DefaultValue - Min) / (Max - Min), 0, 1, 0)
    SliderBar.BackgroundColor3 = Color3.fromRGB(0, 162, 255)

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Parent = Slider
    ValueLabel.Text = DefaultValue
    ValueLabel.Size = UDim2.new(0, 40, 0, 20)
    ValueLabel.Position = UDim2.new(1, 5, 0, 0)
    ValueLabel.TextColor3 = Color3.new(1, 1, 1)
    ValueLabel.BackgroundTransparency = 1

    local function update(value)
        local percent = math.clamp((value - Min) / (Max - Min), 0, 1)
        SliderBar.Size = UDim2.new(percent, 0, 1, 0)
        ValueLabel.Text = math.floor(value)
        if Callback then
            Callback(value)
        end
    end

    local function decreaseValue()
        local currentValue = tonumber(ValueLabel.Text)
        update(math.max(Min, currentValue - 5))
    end

    Slider.MouseButton1Down:Connect(function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        local dragging = true

        local function updateDrag()
            if dragging then
                local percent = math.clamp((mouse.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1)
                local value = Min + percent * (Max - Min)
                update(value)
            end
        end

        updateDrag()

        local conn1 = Slider.MouseMoved:Connect(updateDrag)
        local conn2 = game:GetService("UserInputService").InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
                decreaseValue()
                conn1:Disconnect()
                conn2:Disconnect()
            end
        end)
    end)

    return Slider
end

function Hub.createTextBox(Frame, DefaultText, ButtonClickFunction)
    local TextBox = Instance.new("TextBox")
    TextBox.Parent = Frame
    TextBox.Size = UDim2.new(0, 200, 0, 30)
    TextBox.Position = UDim2.new(0.5, -100, 0, 100)
    TextBox.AnchorPoint = Vector2.new(0.5, 0)
    TextBox.PlaceholderText = "Enter text here..."
    TextBox.Text = DefaultText or ""

    local function OnTextBoxFocusLost(enterPressed)
        if enterPressed then
            ButtonClickFunction()
        end
    end

    TextBox.FocusLost:Connect(function(enterPressed)
        OnTextBoxFocusLost(enterPressed)
    end)

    return TextBox
end

return Hub