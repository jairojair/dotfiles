hs.alert.show("Reloaded")

hs.hotkey.bind({"alt"}, "R", function()
    hs.reload()
end)

local function openApp(name)
    local app = hs.application.get(name)
    
    hs.application.launchOrFocus(name)

    if app:allWindows() == 0 then
        app:activate()
        app.newWindow()
    end
end

local function openSafari()
    openApp("Safari")
end
local function openChrome()
    openApp("Google Chrome")
end
local function openTerminal()
    openApp("Ghostty")
end

hs.hotkey.bind({"alt"}, "S", openSafari)
hs.hotkey.bind({"alt"}, "C", openChrome)
hs.hotkey.bind({"alt"}, "T", openTerminal)