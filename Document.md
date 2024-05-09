# Booting the library
```lua

local lib = loadstring(game:Httpget("https://raw.githubusercontent.com/Exploiter555/Scripts/main/XB.lua"))()
```

# Creating Ui
## Themes
Dark,Light

Coming more Soon! 💡
```lua
local ui = createFrame("Title", "theme")
```


# Creating Tab
```lua
local tab = createTab("Tab 1")
```

# Create Button
```lua
local Button = createButton(frame, "Button 1", function()
    print("Button 1 clicked!")
end)
```

# Create Slider
```lua
local Slider = createSlider(frame, 0, 100, 50, UDim2.new(0, 200, 0, 20), function(value)
    print("Slider value changed to:", value)
end)
```

# Create TextBox
```lua

local textBox = Hub.createTextBox(Frame, "textBoxESC", function()
    print("Script")
end)
```

# Create Notification
```lua
local Notification = createNotification("Title", "Text", "iconID")
```