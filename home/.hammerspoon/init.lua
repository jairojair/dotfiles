hs.alert.show("Reloaded")

hs.hotkey.bind({"alt"}, "R", function()
    hs.reload()
end)

local function openApp(name)
    local app = hs.application.get(name)

    hs.application.launchOrFocus(name)

    if app:allWindows() == 0 then
        app.newWindow()
    end
end

local function bindApp(mods, key, appName)
    hs.hotkey.bind(mods, key, function()
        openApp(appName)
    end)
end

bindApp({"alt"}, "s", "Safari")
bindApp({"alt"}, "c", "Google Chrome")
bindApp({"alt"}, "t", "Ghostty")
