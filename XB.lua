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
rainbow 
local function rainbowColor(position)
    local frequency = 2 -- Controls how fast colors change
    local center = 128   -- Color center (128 for full range)
    local width = 127    -- Color width (127 for full range)
    
    local red = math.sin(frequency * position + 0) * width + center
    local green = math.sin(frequency * position + 2) * width + center
    local blue = math.sin(frequency * position + 4) * width + center
    
    return Color3.fromRGB(math.floor(red), math.floor(green), math.floor(blue))
end

-- Function to apply rainbow colors to UI elements
local function applyRainbowTheme(uiElement)
    local step = 1 / uiElement.AbsoluteSize.X
    local currentPosition = 0
    
    uiElement:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        local sizeX = uiElement.AbsoluteSize.X
        step = 1 / sizeX
    end)
    
    uiElement:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
        currentPosition = uiElement.AbsolutePosition.X
    end)
    
    local function updateColors()
        local children = uiElement:GetChildren()
        for _, child in ipairs(children) do
            if child:IsA("GuiObject") then
                local relativePosition = (child.Position.X.Offset - currentPosition) / uiElement.AbsoluteSize.X
                child.BackgroundColor3 = rainbowColor(relativePosition)
            end
        end
    end
    
    updateColors()
    uiElement:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateColors)
    uiElement:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateColorse
end
applyRainbowTheme(frame.Main)
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

function Hub.createSlider(Frame, Min, Max, DefaultValue, Position, Size, Callback)
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

function Hub.createNotification(Title, Text, id)
    local Notification = game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = Title;
        Text = Text;
        Icon = "rbxthumb://type=Asset&id=" .. id;
    })
    return Notification
end
function Hub.createEndFrame()
		ScreenGui:Destroy()
		return EndFrame
end

return Hub