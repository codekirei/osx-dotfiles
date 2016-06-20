------------------------------------------------------------
-- globals
------------------------------------------------------------
scale = 50

-- modifiers
-- MOD1 = { 'cmd'}
-- MOD2 = { 'ctrl' }
-- MOD3 = { 'alt'}
-- MOD4 = { 'shift' }
-- MOD12 = { MOD1, MOD2 }
-- MOD13
-- MOD14
-- MOD123
-- MOD1234
-- MOD124

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
-- move window
------------------------------------------------------------
function moveWindow(delta)
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  for k,v in pairs(delta) do
    frame[k] = frame[k] + v * scale
  end
  window:setFrame(frame)
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

------------------------------------------------------------
-- scale window
------------------------------------------------------------
function scaleWindow(delta)
  if delta.pos then
    moveWindow(delta.pos)
  end

  local window = hs.window.focusedWindow()
  local size = window:size()
  for k,v in pairs(delta.size) do
    size[k] = size[k] + v * scale
  end
  window:setSize(size)
end

CMD_CTRL_SHIFT = { 'cmd', 'ctrl', 'shift' }

-- grow
for k,v in pairs({
  H = { size = { w = 1 }, pos = { x = -1 } },
  L = { size = { w = 1 } },
}) do
  hs.hotkey.bind(
    {'cmd', 'ctrl', 'shift'}, k,
    function()
      scaleWindow(v)
    end
  )
end

