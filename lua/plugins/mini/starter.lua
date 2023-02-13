local starter = require "mini.starter"
local function header()
  return [[
███    ██ ███████  ██████  ██    ██ ██ ███    ███ 
████   ██ ██      ██    ██ ██    ██ ██ ████  ████ 
██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██ 
██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██ 
██   ████ ███████  ██████    ████   ██ ██      ██ 
                                                  
  ]]
end

starter.setup {
  evaluate_single = true,
  header = header,
  items = {
    starter.sections.recent_files(5, true),
    starter.sections.recent_files(5, false),
    starter.sections.sessions(3, true),
    --starter.sections.builtin_actions(),
  },
  content_hooks = {
    starter.gen_hook.indexing("all", { "Builtin actions" }),
    starter.gen_hook.padding(10, 3),
    starter.gen_hook.aligning("left", "top"),
  },
}
