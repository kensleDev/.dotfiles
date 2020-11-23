dofile("init_keybinds.lua")
dofile("vim_mode.lua")
dofile("alfred.lua")


--
-- This will watch the configuration file
-- and reload it if anything changes. It
-- actually watches the configuration
-- directory.
--
hs.pathwatcher.new(os.getenv("HOME") .. "/.Hammerspoon/", hs.reload):start()


--
-- If the ipc program is not installed, then install it. This also enables the ipc
-- commands to work.
--
if hs.ipc.cliStatus() == false then
	hs.ipc.cliInstall()
end

hs.alert.show("Hammerspoon started")

