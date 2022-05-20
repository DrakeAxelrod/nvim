--[[
 .    '                   .  "   '
            .  .  .                 '      '
    "`       .   .
                                     '     '
  .    '      _______________
          ==c(___(o(______(_()
                  \=\
                   )=\
                  //|\\
                 //|| \\
                // ||  \\
               //  ||   \\
              //         \\

      |\      _,,,---,,_
ZZZzz /,`.-'`'    -.  ;-;;,_
     |,4-  ) )-,_. ,\ (  `'-'
    '---''(_/--'  `-'\_)

\_____)\_____
/--v____ __`<         
        )/           
        '

       .
      ":"
    ___:____     |"\/"|
  ,'        `.    \  /
  |  O        \___/  |
~^~^~^~^~^~^~^~^~^~^~^~^~
]]

return function()
	return {
    "goolord/alpha-nvim",
		config = function()
		  local ok, alpha = pcall(require, "alpha")
		  if not ok then
		    return
		  end
      local fs = require("lib").fs
			local icons = require("theme").icons
			local cfg = require("alpha.themes.dashboard")
			cfg.section.header.val = {
				[[                                        __                          ]],
				[[           ___     ___    ___   __  __ /\_\    ___ ___              ]],
				[[          / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\            ]],
				[[         /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \           ]],
				[[         \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\          ]],
				[[          \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/          ]],
				[[                                                                    ]],
				[[      .-.      _______                           .  '  *   .  . '   ]],
				[[     {}``; |==|_______D                                . *  -+-  .  ]],
				[[     / ('        /|\                             . '   * .    '  *  ]],
				[[ (  /  |        / | \                                * .  ' .  .-+- ]],
			 ([[  \(_)_%s      /  |  \                           *   *  .   .       ]]):format("]]"),
			}
			cfg.section.buttons.val = {
				cfg.button("f", icons.documents.file.files .. " Find file", ":Telescope find_files <CR>"),
				cfg.button("e", icons.documents.file.default .. " New file", ":ene <BAR> startinsert <CR>"),
				cfg.button(
					"p",
					icons.git.repo .. " Find project",
					":lua require('telescope').extensions.projects.projects()<CR>"
				),
				cfg.button("r", icons.ui.history .. " Recent files", ":Telescope oldfiles <CR>"),
				cfg.button("t", icons.ui.list .. " Find text", ":Telescope live_grep <CR>"),
				cfg.button("s", icons.ui.signin .. " Find Session", ":Telescope sessions save_current=false <CR>"),
				cfg.button("c", icons.ui.gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
				cfg.button("q", icons.diagnostics.error .. " Quit", ":qa<CR>"),
			}
			local footer = function()
        local plugins_count = vim.fn.len(vim.fn.globpath(fs.join(vim.fn.stdpath("data"), "site", "pack", "packer", "start"), "*", 0, 1))
        local plugins = ("loaded %s plugins"):format(plugins_count)
        local website = "draxel.io"
				return ("%s %s"):format(website, plugins)
			end
			cfg.section.footer.val = footer()

			cfg.section.footer.opts.hl = "Type"
			cfg.section.header.opts.hl = "Include"
			cfg.section.buttons.opts.hl = "Keyword"

			cfg.opts.opts.noautocmd = true
			alpha.setup(cfg.opts)
		end,
	}
end
