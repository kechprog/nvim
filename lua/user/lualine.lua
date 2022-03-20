function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result
end

local getProjDir = function (directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('git rev-parse --show-toplevel')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t[1]
end

local function curPath()
    local cwd = vim.loop.cwd() .. '/' .. vim.fn.expand('%')
    pLen = #Split(getProjDir(), '/')
    cwdLen = #Split(cwd, '/')

    local ret = ''
    for i=pLen, cwdLen do 
        ret = ret .. '/' .. (Split(cwd, '/')[i])
    end
    return ret
end





require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {curPath}, -- print a prject directory
    lualine_c = {'branch'}, 
    lualine_x = {}, 
    lualine_y = {'diagnostics'}, 
    lualine_z = {'progress','location'}, 
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
