hs.hotkey.bind(
  {"cmd", "alt", "ctrl"}, "W",
  function()
    hs.notify.new({
      title="Hammerspoon",
      informativeText="It's alive!",
    }):send()
  end
)

hs.hotkey.bind(
  {"cmd", "alt", "ctrl"}, "R",
  function()
    hs.reload()
  end
)

-- move window left
hs.hotkey.bind(
  {"cmd", "ctrl"}, "H",
  function()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    frame.x = frame.x - 10
    win:setFrame(frame)
  end
)
