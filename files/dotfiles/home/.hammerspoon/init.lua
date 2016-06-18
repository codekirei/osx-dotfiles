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
