------------------------------------------------------------
-- binds
------------------------------------------------------------
binds = {

  meta = {

    reload = {
      mods = { 'ctrl', 'shift', 'cmd' },
      key = 'R',
    },

  },

  window = {

    half = {
      mods = { 'ctrl', 'cmd' },
      keys = {
        H = {   0,   0, 0.5,   1 },
        J = {   0, 0.5,   1, 0.5 },
        K = {   0,   0,   1, 0.5 },
        L = { 0.5,   0, 0.5,   1 },
      },
    },

    focus = {
      mods = { 'cmd', 'shift' },
      keys = {
        H = 'focusWindowWest',
        J = 'focusWindowSouth',
        K = 'focusWindowNorth',
        L = 'focusWindowEast',
      },
    },

    -- grow = {
    --   mods = { 'ctrl', 'shift', 'alt' },
    --   keys = {
    --     H = { size = { w = 50 }, pos = { x = -48 } },
    --     J = { size = { h = 50 } },
    --     K = { size = { h = 50 }, pos = { y = -36 } },
    --     L = { size = { w = 50 } },
    --   },
    -- },
    --
    -- shrink = {
    --   mods = { 'ctrl', 'alt' },
    --   keys = {
    --     H = { size = { w = -50 } },
    --     J = { size = { h = -50 }, pos = { y = 50 } },
    --     K = { size = { h = -50 } },
    --     L = { size = { w = -50 }, pos = { x = 50 } },
    --   },
    -- },
    --
    -- move = {
    --   mods = { 'ctrl', 'cmd' },
    --   keys = {
    --     H = { x = -50 },
    --     J = { y = 50 },
    --     K = { y = -50 },
    --     L = { x = 50 },
    --   },
    -- },

    maximize = {
      mods = { 'ctrl', 'cmd' },
      key = 'F',
    },

  },

}

------------------------------------------------------------
-- fns
------------------------------------------------------------
fns = {

  meta = {

    reload = function()
      notification = {
        title='Hammerspoon',
        informativeText='Config reloaded!',
      }
      hs.reload()
      hs.notify.new(notification):send()
    end,

  },

  window = {

    half = function(rect_table)
      return function()
        hs.window.focusedWindow():moveToUnit(hs.geometry.unitrect(rect_table), 0)
      end
    end,

    focus = function(method)
      return function()
        local filter = hs.window.filter.new():setCurrentSpace(true)
        filter[method](filter, nil, true, true)
      end
    end,

    move = function(delta)
      return function()
        local window = hs.window.focusedWindow()
        local frame = window:frame()
        for k,v in pairs(delta) do
          frame[k] = frame[k] + v
        end
        window:setFrame(frame)
      end
    end,

    scale = function(delta)
      return function()
        if delta.pos then
          fns.window.move(delta.pos)()
        end
        local window = hs.window.focusedWindow()
        local size = window:size()
        for k,v in pairs(delta.size) do
          size[k] = size[k] + v
        end
        window:setSize(size)
      end
    end,

    maximize = function()
      hs.window.focusedWindow():maximize(0)
    end,

  },

}

------------------------------------------------------------
-- glue
------------------------------------------------------------

-- TODO: generate these declarations programmatically

-- hammerspoon
hs.hotkey.bind(binds.meta.reload.mods, binds.meta.reload.key, fns.meta.reload)

-- window
-- for k,v in pairs(binds.window.move.keys) do
--   hs.hotkey.bind(binds.window.move.mods, k, fns.window.move(v))
-- end
-- for k,v in pairs(binds.window.grow.keys) do
--   hs.hotkey.bind(binds.window.grow.mods, k, fns.window.scale(v))
-- end
-- for k,v in pairs(binds.window.shrink.keys) do
--   hs.hotkey.bind(binds.window.shrink.mods, k, fns.window.scale(v))
-- end
for k,v in pairs(binds.window.half.keys) do
  hs.hotkey.bind(binds.window.half.mods, k, fns.window.half(v))
end
for k,v in pairs(binds.window.focus.keys) do
  hs.hotkey.bind(binds.window.focus.mods, k, fns.window.focus(v))
end
hs.hotkey.bind(binds.window.maximize.mods, binds.window.maximize.key, fns.window.maximize)
