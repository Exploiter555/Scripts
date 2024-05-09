
# Library Installation

```lua
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exploiter555/Scripts/main/XB.lua"))()
```

## Creating UI
Themes -->
<a href="https://github.com/Exploiter555/Scripts/blob/main/Themes.md">
  <img src="https://img.shields.io/badge/Readme-Themes-ff69b4.svg" alt="Readme" style="transition: 0.5s ease-out; background-image: linear-gradient(90deg, #ff0000, #ff7f00, #ffff00, #00ff00, #0000ff, #4b0082, #9400d3); background-size: 400% 400%;" onmouseover="this.style.backgroundPosition='right';" onmouseout="this.style.backgroundPosition='left';">
</a>

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