
-- hyper

local hotkey = require 'hs.hotkey'
local hyper = {"alt", "ctrl"}
local hypershift = {"alt", "ctrl", "shift"}

function h_bind(key, func)
    hs.hotkey.bind(hyper, key, func)
end

function hs_bind(key, func)
    hs.hotkey.bind(hypershift, key, func)
end

-- keys

function myDoKeyStroke(modifiers, character)
    local event = require("hs.eventtap").event
    event.newKeyEvent(modifiers, string.lower(character), true):post()
    event.newKeyEvent(modifiers, string.lower(character), false):post()
end

function key(key, modifiers)
    modifiers = modifiers or {}
    return function() myDoKeyStroke(modifiers, key) end
end

-- apps 

function file_exists(path)
    local f=io.open(path,"r")
    if f~=nil then io.close(f) return true else return false end
    -- ~= is != in other languages
end

function launchApp(name)
    -- .. is concat string operator
    return function()
        path = "/Applications/" .. name .. ".app"
        if file_exists(path) then
            hs.application.launchOrFocus(path)
            return
        end
        path = "/System/Library/CoreServices/" .. name .. ".app"
        if file_exists(path) then
            hs.application.launchOrFocus(path)
            return
        end
        path = "/System/Applications/" .. name .. ".app"
        if file_exists(path) then
            hs.application.launchOrFocus(path)
            return
        end
    end
end

-- Binds 

-- Global
h_bind(".", hs.reload)
hs_bind(".", hs.toggleConsole)
h_bind("h", key("h", {"shift", "command", "control", "alt"}))

-- apps
h_bind("q", launchApp("iTerm"))
h_bind("w", launchApp("Brave Browser"))

-- Arrows
h_bind("j", key("Left"))
h_bind("k", key("Down"))
h_bind("l", key("Up"))
h_bind(";", key("Right"))

hs_bind("j", key("Left", {"shift"}))
hs_bind("k", key("Down", {"shift"}))
hs_bind("l", key("Up", {"shift"}))
hs_bind(";", key("Right", {"shift"}))

-- Page / Line 
h_bind("u", key("home"))
h_bind("i", key("pagedown"))
h_bind("o", key("pageup"))
h_bind("p", key("end"))

hs_bind("u", key("home", {"shift"}))
hs_bind("i", key("pagedown", {"shift"}))
hs_bind("o", key("pageup", {"shift"}))
hs_bind("p", key("end", {"shift"}))

-- toggle windows
h_bind("r", key("tab", {"command"}))
-- 

hs.alert.show("Hammerspoon started")
