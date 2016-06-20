------------------------------------------------------------
-- globals
------------------------------------------------------------
scale = 50

------------------------------------------------------------
-- meta
------------------------------------------------------------
hs.hotkey.bind(
  {'cmd', 'alt', 'ctrl'}, 'R',
  function()
    hs.reload()
    hs.notify.new({
      title='Hammerspoon',
      informativeText='Config reloaded!',
    }):send()
  end
)

------------------------------------------------------------
-- windows
------------------------------------------------------------
function moveWindow(delta)
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  for k,v in pairs(delta) do
    frame[k] = frame[k] + v * scale
  end
  win:setFrame(frame)
end

for k,v in pairs({
  H = { x = -1 },
  J = { y = 1 },
  K = { y = -1 },
  L = { x = 1 },
}) do
  hs.hotkey.bind(
    {'cmd', 'ctrl'}, k,
    function()
      moveWindow(v)
    end
  )
end
