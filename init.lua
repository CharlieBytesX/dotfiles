-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Takes env variable (setted every time with an alias in the shell config, for quick change between colemak and qwerty mode)

local colemakEnvValue = os.getenv 'COLEMAK_MODE'
COLEMAK_MODE = (colemakEnvValue == 'true') or (colemakEnvValue == 1)

require 'setup_lazy'
require 'plugins'
require 'options'

require 'autocmd'

-- fire outside config
require('neodev').setup()
require 'plugins.cmp'
require 'plugins.lsp'

vim.g.material_style = 'deep ocean'

local colorschemes = {
  Material = 'material',
  Mocha = 'catppuccin-mocha',
  Macchiato = 'catppuccin-macchiato',
  RosepineMoon = 'rose-pine-moon',
  RosepineMain = 'rose-pine-main',
  Gruvbox = 'gruvbox',
  OneDarkPro = 'onedark',
  Default = 'default',
  Nord = 'nord',
  Torte = 'torte',
}
local colorscheme = colorschemes.Macchiato

vim.cmd('colorscheme ' .. colorscheme)

require 'mappings'
require 'custom_config'


local project_config = vim.fn.expand('%:p:h') .. '/nvim-dap-config.lua'
if vim.fn.filereadable(project_config) == 1 then
  dofile(project_config)
else
end
