
# Lua Script for Creating UI Elements

This Lua script utilizes a custom library to create various UI components for games. It provides functionalities for creating tabs, buttons, sliders, text boxes, and notifications. Below is a guide on how to use each feature:

## Library Installation

First, load the library by executing the following code:

```lua
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exploiter555/Scripts/main/XB.lua"))()
```

## Creating UI

Initialize the UI frame and select a theme:

```lua
local frame = Hub.createFrame("RainbowTheme", "dark")
local tabFrame = ui.Main
local selectedTheme = ui.Theme
```

### Themes

Explore different themes available for customization [here](https://github.com/Exploiter555/Scripts/blob/main/Themes.md).

## Creating Tabs

Create tabs within the UI frame:

```lua
local tabButton, tabContent = Hub.createTab("Tab 1", ui, tabFrame)
```

## Creating Buttons

Add buttons to trigger actions:

```lua
local button = Hub.createButton(ui, "Button 1", function()
    print("Button 1 clicked!")
end)
```

## Creating Sliders

Include sliders for adjusting values:

```lua
local slider = Hub.createSlider(ui, 0, 100, 50, UDim2.new(0, 200, 0, 20), function(value)
    print("Slider value changed to:", value)
end)
```

## Creating Text Boxes

Implement text boxes for user input:

```lua
local textBox = Hub.createTextBox(ui, "textBoxESC", function()
    print("TextBox submitted!")
end)
```

## Creating Notifications

Display notifications for important events:

```lua
local notification = Hub.createNotification("Title", "Text", "iconID")
