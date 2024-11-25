local M = {}

M._map = function(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc }) end

M.map = function(keymaps)
  for key, maps in pairs(keymaps) do
    M._map(maps.modes, key, maps.action, maps.desc)
  end
end

M.buffer_map = function() end

M.global_map = function(mode_keymaps)
  for mode, keymaps in pairs(mode_keymaps) do
    local mode_initial = mode:sub(1, 1)

    for key, maps in pairs(keymaps) do
      M._map(mode_initial, key, maps.action, maps.desc)
    end
  end
end

M.get_plugin = function(plugin_name)
  local success, plugin = pcall(require, plugin_name)
  if not success then
    vim.notify("Failed to load plugin: " .. plugin_name)
    return
  end
  return plugin
end
return M
