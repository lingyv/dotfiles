-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

---------------------------------------------------------------------
-- For this system, the user prefers vim-style window navigation:
--   SUPER + H/J/K/L            move focus between windows
--   SUPER + SHIFT + H/J/K/L    resize the active window
--
-- The following defaults are freed to make room:
--   SUPER + J  (was "Toggle window split")
--   SUPER + L  (was "Toggle workspace layout")
--   SUPER + K  (was "Keybindings menu")
---------------------------------------------------------------------

-- Free the keys that would otherwise conflict with the new bindings below.
hl.unbind("SUPER + J")
hl.unbind("SUPER + L")
hl.unbind("SUPER + K")

-- Focus movement in the current workspace (h/j/k/l = left/down/up/right).
o.bind("SUPER + H", "Focus left window", "movefocus l")
o.bind("SUPER + J", "Focus window below", "movefocus d")
o.bind("SUPER + K", "Focus window above", "movefocus u")
o.bind("SUPER + L", "Focus right window", "movefocus r")

-- Resize the active window (h/j/k/l = left/down/up/right).
o.bind("SUPER + SHIFT + H", "Resize window left", "resizeactive l")
o.bind("SUPER + SHIFT + J", "Resize window down", "resizeactive d")
o.bind("SUPER + SHIFT + K", "Resize window up", "resizeactive u")
o.bind("SUPER + SHIFT + L", "Resize window right", "resizeactive r")
