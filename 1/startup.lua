ltime = textutils.formatTime(os.time("local"))
term.setCursorPos(1,1)
term.write("Started at "..ltime)
term.setCursorPos(1,5)
shell.execute("Banish.lua")
