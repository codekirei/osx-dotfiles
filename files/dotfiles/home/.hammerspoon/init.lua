------------------------------------------------------------
-- globals
------------------------------------------------------------
scale = 50

-- modifiers
A = 'alt'
C = 'ctrl'
M = 'cmd'
S = 'shift'

------------------------------------------------------------
-- declare keybinds
------------------------------------------------------------
binds = {
  window = {
    grow = {
      mods = { 'ctrl', 'shift', 'cmd' },
      keys = {
        H = { size = { w = 1 }, pos = { x = -1 } },
        L = { size = { w = 1 } },
      },
    },
  },
}

------------------------------------------------------------
-- meta
------------------------------------------------------------
hs.hotkey.bind({C,A,M}, 'R',
  function()

    notification = {
      title='Hammerspoon',
      informativeText='Config reloaded!',
    }

    hs.reload()
    hs.notify.new(notification):send()
  end
)

------------------------------------------------------------
-- window functions
------------------------------------------------------------
function moveWindow(delta)
  return function()
    local window = hs.window.focusedWindow()
    local frame = window:frame()
    for k,v in pairs(delta) do
      frame[k] = frame[k] + v * scale
    end
    window:setFrame(frame)
  end
end

for k,v in pairs({
  H = { x = -1 },
  J = { y = 1 },
  K = { y = -1 },
  L = { x = 1 },
}) do
  hs.hotkey.bind({C,M}, k, moveWindow(v))
end

function scaleWindow(delta)
  return function()
    if delta.pos then
      moveWindow(delta.pos)()
    end

    local window = hs.window.focusedWindow()
    local size = window:size()
    for k,v in pairs(delta.size) do
      size[k] = size[k] + v * scale
    end
    window:setSize(size)
  end
end

------------------------------------------------------------
-- assign keybinds
------------------------------------------------------------

-- window
for k,v in pairs(binds.window.grow.keys) do
  hs.hotkey.bind(binds.window.grow.mods, k, scaleWindow(v))
end
