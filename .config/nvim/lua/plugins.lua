-- Use the lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Trial plugins
    {
      "epwalsh/pomo.nvim",
      version = "*",  -- pin to the latest release
      lazy = true,
      cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
      opts = {
        notifiers = {
          {
            name = "Default",
            opts = {
              sticky = false, -- This is the magic switch!
            },
          },
        },
        sessions = {
          pomodoro = {
            { name = "Work", duration = "25m" },
            { name = "Short Break", duration = "5m" },
            { name = "Work", duration = "25m" },
            { name = "Short Break", duration = "5m" },
            { name = "Work", duration = "25m" },
            { name = "Long Break", duration = "15m" },
          },
        },
      },
    },

	-- Snaks core plugin
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
		    image = { enabled = true },
			notifier = { enabled = true },
			terminal = { enabled = true },
			explorer = { enabled = true },
			picker = { enabled = true },
			dashboard = {
				enabled = true,
				preset = {
 				    header = [[
 |	                                                 			  
 |\  ██████╗  ██████╗ ██╗    ██╗██╗     ███████╗██╗   ██╗
   \ ██╔══██╗██╔═══██╗██║    ██║██║     ██╔════╝╚██╗ ██╔╝ 
    \██████╔╝██║   ██║██║ █╗ ██║██║     █████╗   ╚████╔╝  
    /██╔══██╗██║   ██║██║███╗██║██║     ██╔══╝    ╚██╔╝   
   / ██║  ██║╚██████╔╝╚███╔███╔╝███████╗███████╗   ██║    
 _/_ ╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝    
                                                        
 ██████╗ ███████╗███████╗███████╗ █████╗ ██████╗  ██████╗██╗  ██╗    ██╗      █████╗ ██████╗ 
 ██╔══██╗██╔════╝██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║  ██║    ██║     ██╔══██╗██╔══██╗
 ██████╔╝█████╗  ███████╗█████╗  ███████║██████╔╝██║     ███████║    ██║     ███████║██████╔╝
 ██╔══██╗██╔══╝  ╚════██║██╔══╝  ██╔══██║██╔══██╗██║     ██╔══██║    ██║     ██╔══██║██╔══██╗
 ██║  ██║███████╗███████║███████╗██║  ██║██║  ██║╚██████╗██║  ██║    ███████╗██║  ██║██████╔╝
 ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚═════╝ ]],	
					keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
                        { icon = " ", key = "e", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "p", desc = "Restore Project Session", action = ":lua require('persistence').select()", },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
                        { icon = " ", key = "t", desc = "Find Text", action = ":lua Snacks.picker.grep()" },
                        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.picker.files({cwd = vim.fn.stdpath('config')})" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
				},
				sections = {
				    { section = "header", padding = 2, hl = "Include" }, -- hl = "Keyword" makes it pop!
					{ section = "keys", gap = 1, padding = 1 },
			
					{ text = "https://rowleylab.github.io/", hl = "Type", align = "center", padding = 1 },
					{ section = "startup", padding = 1 },
				},
			},
		},
	},
	-- Dependencies and Utilities
	"nvim-lua/plenary.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern", -- Choose "modern", "classic", or "helix"
			win = {
				border = "rounded",
			},
			plugins = {
				spelling = {
					enabled = true, -- Turns on the z= spellcheck popup
					suggestions = 20,
				},
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{ "nvim-tree/nvim-web-devicons", opts = { default = true } },
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {        
        "MunifTanjim/nui.nvim", 
      },
      config = function()
        require("noice").setup({
          presets = {
            bottom_search = true,         
            command_palette = true,       
            long_message_to_split = true, 
            inc_rename = false,           
            lsp_doc_border = false,       
          },
        })
      end
    },

	-- Aesthetics and UI
	"arcticicestudio/nord-vim", -- Colorscheme
	"navarasu/onedark.nvim",
	{
		"gruvbox-community/gruvbox",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
			vim.api.nvim_set_hl(0, "ColorColumn", { bg = "Grey" })
		end,
	},
	"folke/zen-mode.nvim",
	"psliwka/vim-smoothie",
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	"stevearc/dressing.nvim",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end

			local diagnostics = {
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn" },
				symbols = { error = " ", warn = " " },
				colored = true,
				update_in_insert = false,
				always_visible = false,
			}

			local diff = {
				"diff",
				colored = true,
				symbols = { added = " ", modified = " ", removed = " " },
				cond = hide_in_width,
			}

			local mode = { "mode" }
			local filetype = { "filetype", icons_enabled = true }
			local branch = { "branch", icons_enabled = true, icon = "" }
			local location = { "location", padding = 0 }

			local progress = function()
				local current_line = vim.fn.line(".")
				local total_lines = vim.fn.line("$")
				local chars =
					{ "  ", "▔▔", "🮂🮂", "🮃🮃", "▀▀", "🮄🮄", "🮅🮅", "🮆🮆", "██" }
				local line_ratio = current_line / total_lines
				local index = math.ceil(line_ratio * #chars)
				return chars[index]
			end

			local spaces = function()
				return "spaces: " .. vim.bo.shiftwidth
			end

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
					always_divide_middle = true,
				},
				sections = {
					lualine_a = { mode },
					lualine_b = { branch, diagnostics },
					lualine_c = { "filename", "aerial" },
					lualine_x = { diff, spaces, "encoding", filetype },
					lualine_y = { location, progress },
					lualine_z = { 
					  function()
                        local ok, pomo = pcall(require, "pomo")
                        if not ok then return "" end
                        local timer = pomo.get_first_to_finish()
                        if timer == nil then return "" end
                        return "⏳ " .. tostring(timer)
                      end,
                    },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = {},
			})
		end,
	},

	-- Coding and Workflow
	{
		"ahmedkhalf/project.nvim",
		name = "project_nvim",
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern" },
				-- Looks for these files/folders to identify a project root
				patterns = { ".git", "go.mod", "Makefile", "package.json", "cargo.toml", "pyproject.toml" },
				manual_mode = false,
			})
		end,
	},
	{ "folke/persistence.nvim", event = "BufReadPre", opts = {} },
	{ "numToStr/Comment.nvim", opts = {} },
	"JoosepAlviste/nvim-ts-context-commentstring",
	{ "Wansmer/treesj", opts = { use_default_keymaps = false } },
	{ "kylechui/nvim-surround", opts = {} },
	{ "ethanholz/nvim-lastplace", opts = {} },
	"Weyaaron/nvim-training",
	{ "folke/todo-comments.nvim", opts = {} },
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")

			npairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
					java = false,
				},
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					offset = 0,
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
			})

			-- Automatically make parens, etc. in completions
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
		end,
	},

	-- Filetype specific plugins
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
               { path = "lazy.nvim", words = { "LazyVim" } },
              "snack.nvim",
			},
		},
	},
    
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- use latest release instead of latest commit
		lazy = true,
		ft = "markdown", -- Only load when you open a markdown file
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/Documents/Wiki", -- Point this to your actual notes folder!
				},
			},
		},
	},
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{ path = "~/Documents/Wiki/", ext = ".md", index = "RowleyWiki", syntax = "markdown" },
			}
			vim.g.vimwiki_global_ext = 0
		end,
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim", "nvim-neorg/lua-utils.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.summary"] = {},
					["core.presenter"] = { config = { zen_mode = "zen-mode" } },
					["core.concealer"] = { config = { icon_preset = "basic" } },
					["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
					["core.integrations.nvim-cmp"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/notes",
								rpgs = "~/RPGs/Pathfinder2e/Adventures",
							},
						},
					},
				},
			})
		end,
	},
	"stevearc/vim-arduino",
	"lervag/vimtex",

	-- LSP, autocompletion, and formatters
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/lazydev.nvim", ft = "lua", opts = {} },
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets", -- Community standard snippets
		},
		config = function()
			-- Load the friendly-snippets natively
			require("luasnip.loaders.from_vscode").lazy_load()

			local cmp = require("cmp")
			local luasnip = require("luasnip")

			local kind_icons = {
				Text = "",
				Method = "m",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			}

			local check_backspace = function()
				local col = vim.fn.col(".") - 1
				return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
			end

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expandable() then
							luasnip.expand()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif check_backspace() then
							fallback()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							nvim_lua = "[Nvim-Lua]",
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name] or ""
						return vim_item
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})

			-- Cmdline setups
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { { name = "buffer" } },
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "ruff_fix", "ruff_format" },
				go = { "gofmt" },
				lua = { "stylua" },
				bib = { "bibtex-tidy" },
				html = { "prettier" },
				markdown = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				javascript = { "prettier" },
			},
			format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
		},
	},	

	-- Git and Treesitter
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview git hunk" })
				-- Next/Prev hunk navigation
				vim.keymap.set({ "n", "v" }, "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
				vim.keymap.set({ "n", "v" }, "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
			end,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "python", "c", "cpp", "go", "lua", "markdown", "latex", "vimdoc", "vim", "bash" },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			})

			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.opt.foldtext = "" -- Keeps folds looking clean in modern Neovim
		end,
	},

	-- Useless but fun plugins
	"eandrju/cellular-automaton.nvim", -- Create animations with your text
	{ -- Spawn a duck friend who walks around your text
		"tamton-aquib/duck.nvim",
		config = function()
			vim.keymap.set("n", "<leader>dd", function()
				require("duck").hatch()
			end, {})
			vim.keymap.set("n", "<leader>dk", function()
				require("duck").cook()
			end, {})
		end,
	},
})
