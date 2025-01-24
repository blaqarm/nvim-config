return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
		theme = 'hyper',
    config = {
     -- week_header = {
      -- enable = true,
	  header = {
" ▄▄▄▄    ██▓    ▄▄▄        █████   ▄▄▄       ██▀███   ███▄ ▄███▓",
"▓█████▄ ▓██▒   ▒████▄    ▒██▓  ██▒▒████▄    ▓██ ▒ ██▒▓██▒▀█▀ ██▒",
"▒██▒ ▄██▒██░   ▒██  ▀█▄  ▒██▒  ██░▒██  ▀█▄  ▓██ ░▄█ ▒▓██    ▓██░",
"▒██░█▀  ▒██░   ░██▄▄▄▄██ ░██  █▀ ░░██▄▄▄▄██ ▒██▀▀█▄  ▒██    ▒██ ",
"░▓█  ▀█▓░██████▒▓█   ▓██▒░▒███▒█▄  ▓█   ▓██▒░██▓ ▒██▒▒██▒   ░██▒",
"░▒▓███▀▒░ ▒░▓  ░▒▒   ▓▒█░░░ ▒▒░ ▒  ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ▒░   ░  ░",
"▒░▒   ░ ░ ░ ▒  ░ ▒   ▒▒ ░ ░ ▒░  ░   ▒   ▒▒ ░  ░▒ ░ ▒░░  ░      ░",
" ░    ░   ░ ░    ░   ▒      ░   ░   ░   ▒     ░░   ░ ░      ░   ",
 "░          ░  ░     ░  ░    ░          ░  ░   ░            ░   ",
"      ░                                                         ",

      },
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'ff',
        },
        {
          desc = ' Menu',
          group = 'DiagnosticHint',
          action = 'Neotree left toggle reveal',
          key = 't',
        },
       -- {
        --  desc = ' dotfiles',
         -- group = 'Number',
          --action = 'Telescope dotfiles',
          --key = 'd',
       -- },
      },
    },
	})
	end
}

