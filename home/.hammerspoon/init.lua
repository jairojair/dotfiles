local apps = require("apps")

hs.alert.show("Reloaded")

hs.hotkey.bind({"alt"}, "R", function()
    hs.reload()
end)

apps.bind({"alt"}, "b", "Safari")
apps.bind({"alt"}, "t", "Ghostty")
