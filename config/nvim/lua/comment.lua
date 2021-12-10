local config = {
  active = true,
  on_config_done = nil,
  padding = true,
  ignore = "^$",
  mappings = {
    basic = true,
    extra = false,
  },
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  },
  pre_hook = function(_ctx)
    return require("ts_context_commentstring.internal").calculate_commentstring()
  end,
  post_hook = nil,
}

require("Comment").setup(config)
