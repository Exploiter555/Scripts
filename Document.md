# Booting the library
```lua

loadstring(game:Httpget(https://raw.githubusercontent.com/Exploiter555/Scripts/main/XB.lua))()
```

# Creating Ui
## Themes
Dark,Light

Coming more Soon! 💡
```lua
createFrame("Title", "theme")
```


# Creating Tab
```lua
createTab("Tab 1")
```

# Create Button
```lua
createButton(frame, "Button 1", function()
    print("Button 1 clicked!")
end)
```

# Create Slider
```lua
createSlider(frame, 0, 100, 50, UDim2.new(0, 200, 0, 20), function(value)
    print("Slider value changed to:", value)
end)
```