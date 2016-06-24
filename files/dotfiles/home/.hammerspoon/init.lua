------------------------------------------------------------
-- globals
------------------------------------------------------------
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
        H = { size = { w = 50 }, pos = { x = -48 } },
        J = { size = { h = 50 } },
        K = { size = { h = 50 }, pos = { y = -36 } },
        L = { size = { w = 50 } },
      },
    },

    move = {
      mods = { 'ctrl', 'cmd' },
      keys = {
        H = { x = -50 },
        J = { y = 50 },
        K = { y = -50 },
        L = { x = 50 },
      },
    },

  },
}

------------------------------------------------------------
-- meta
------------------------------------------------------------
hs.hotkey.bind({C,S,M}, 'R',
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
      frame[k] = frame[k] + v
    end
    window:setFrame(frame)
  end
end

function scaleWindow(delta)
  return function()
    if delta.pos then
      moveWindow(delta.pos)()
    end

    local window = hs.window.focusedWindow()
    local size = window:size()
    for k,v in pairs(delta.size) do
      size[k] = size[k] + v
    end
    window:setSize(size)
  end
end

------------------------------------------------------------
-- assign keybinds
------------------------------------------------------------

-- window
for k,v in pairs(binds.window.move.keys) do
  hs.hotkey.bind(binds.window.move.mods, k, moveWindow(v))
end
for k,v in pairs(binds.window.grow.keys) do
  hs.hotkey.bind(binds.window.grow.mods, k, scaleWindow(v))
end
