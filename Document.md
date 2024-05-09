
# Library Installation

```lua
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exploiter555/Scripts/main/XB.lua"))()
```

## Creating UI
Themes -->
[![Readme](https://img.shields.io/badge/Readme-Themes-ff69b4.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Exploiter555/Scripts/blob/main/Themes.md)
```lua
local ui, tabFrame, selectedTheme = Hub.createFrame("Title", "dark")
```

## Creating Tabs

```lua
local tabButton, tabContent = Hub.createTab("Tab 1", ui, tabFrame)
```

## Creating Buttons

```lua
local button = Hub.createButton(ui, "Button 1", function()
    print("Button 1 clicked!")
end)
```

## Creating Sliders

```lua
local slider = Hub.createSlider(ui, 0, 100, 50, UDim2.new(0, 200, 0, 20), function(value)
    print("Slider value changed to:", value)
end)
```

## Creating Text Boxes

```lua
local textBox = Hub.createTextBox(ui, "textBoxESC", function()
    print("TextBox submitted!")
end)
```

## Creating Notifications

```lua
local notification = Hub.createNotification("Title", "Text", "iconID")
```