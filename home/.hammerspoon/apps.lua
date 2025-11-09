local M = {}

function M.openApp(name)
    local app = hs.application.get(name)

    hs.application.launchOrFocus(name)

    if app:allWindows() == 0 then
        app.newWindow()
    end
end

function M.bind(mods, key, appName)
    hs.hotkey.bind(mods, key, function()
        M.openApp(appName)
    end)
end

return M