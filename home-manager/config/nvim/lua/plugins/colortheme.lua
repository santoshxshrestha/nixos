-- lua/plugins/colorscheme.lua
return {
	-- Load both themes
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true, -- Load on demand
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true, -- Load on demand
	},

	-- Main configuration
	{
		"catppuccin/nvim", -- Default theme
		lazy = false,
		priority = 1000,
		config = function()
			-- Function to configure and switch to Catppuccin
			local setup_catppuccin = function()
				require("catppuccin").setup({
					transparent_background = true,
					show_end_of_buffer = false,
					disable_float_background = false,
					bold_vert_split = false,
					-- Catppuccin-specific styling options
					no_italic = false, -- Allow italic text
					no_bold = false, -- Allow bold text
					no_underline = false, -- Allow underlined text
					integrations = {
						aerial = true,
						alpha = true,
						cmp = true,
						dashboard = true,
						flash = true,
						fzf = true,
						grug_far = true,
						gitsigns = true,
						headlines = true,
						illuminate = true,
						indent_blankline = { enabled = true },
						leap = true,
						lsp_trouble = true,
						mason = true,
						markdown = true,
						mini = true,
						native_lsp = {
							enabled = true,
							underlines = {
								errors = { "undercurl" },
								hints = { "undercurl" },
								warnings = { "undercurl" },
								information = { "undercurl" },
							},
						},
						navic = { enabled = true, custom_bg = "lualine" },
						neotest = true,
						neotree = true,
						noice = true,
						notify = true,
						semantic_tokens = true,
						snacks = true,
						telescope = true,
						treesitter = true,
						treesitter_context = true,
						which_key = true,
					},
				})
				vim.cmd.colorscheme("catppuccin")
				print("Switched to Catppuccin")
			end

			-- Function to configure and switch to Rose Pine
			local setup_rose_pine = function()
				require("rose-pine").setup({
					variant = "main", -- auto, main, moon, or dawn
					dark_variant = "main",
					bold_vert_split = false,
					dim_nc_background = false,
					disable_background = false,
					disable_float_background = false,
					-- Rose Pine-specific styling options
					styles = {
						bold = true,
						italic = true,
						transparency = true,
					},
					groups = {
						background = "base",
						background_nc = "_experimental_nc",
						panel = "surface",
						panel_nc = "base",
						border = "highlight_med",
						comment = "muted",
						link = "iris",
						punctuation = "subtle",
						error = "love",
						hint = "iris",
						info = "foam",
						warn = "gold",
						headings = {
							h1 = "iris",
							h2 = "foam",
							h3 = "rose",
							h4 = "gold",
							h5 = "pine",
							h6 = "foam",
						},
					},
					highlight_groups = {
						ColorColumn = { bg = "rose" },
						CursorLine = { bg = "foam", blend = 10 },
						StatusLine = { fg = "love", bg = "love", blend = 10 },
					},
				})
				vim.cmd.colorscheme("rose-pine")
				print("Switched to Rose Pine")
			end

			-- Theme switching functionality
			local current_theme = "catppuccin"

			local switch_theme = function()
				if current_theme == "catppuccin" then
					current_theme = "rose-pine"
					setup_rose_pine()
				else
					current_theme = "catppuccin"
					setup_catppuccin()
				end
			end

			-- Theme selection menu
			local select_theme = function()
				local themes = {
					{ name = "catppuccin", setup = setup_catppuccin },
					{ name = "rose-pine",  setup = setup_rose_pine },
				}

				vim.ui.select(themes, {
					prompt = "Select colorscheme:",
					format_item = function(item)
						return item.name == current_theme and item.name .. " (current)" or item.name
					end,
				}, function(choice)
					if choice then
						current_theme = choice.name
						choice.setup()
					end
				end)
			end

			-- Background transparency toggle (works with both themes)
			local bg_transparent = true
			local original_normal_bg = nil
			local original_float_bg = nil

			local toggle_transparency = function()
				bg_transparent = not bg_transparent

				if bg_transparent then
					-- Store original backgrounds before making transparent
					if original_normal_bg == nil then
						local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
						local float_hl = vim.api.nvim_get_hl(0, { name = "NormalFloat" })
						original_normal_bg = normal_hl.bg
						original_float_bg = float_hl.bg
					end

					-- Enable transparent background
					vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
					vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
					print("Transparency enabled")
				else
					-- Restore original backgrounds
					vim.api.nvim_set_hl(0, "Normal", { bg = original_normal_bg })
					vim.api.nvim_set_hl(0, "NormalFloat", { bg = original_float_bg })
					print("Transparency disabled")
				end
			end

			-- YANK HIGHLIGHTING CONFIGURATION
			-- Create autogroup for yank highlighting
			local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

			-- Function to set up yank highlight colors
			local setup_yank_highlight = function()
				vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#e0def4", fg = "#1f1d2e" })
			end

			-- Set initial yank highlight
			setup_yank_highlight()

			-- Recreate highlight after any colorscheme change
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.defer_fn(function()
						setup_yank_highlight()
					end, 10)
				end,
			})

			-- Yank highlighting autocmd
			vim.api.nvim_create_autocmd("TextYankPost", {
				callback = function()
					vim.hl.on_yank({
						higroup = "YankHighlight",
						timeout = 50,
					})
				end,
				group = highlight_group,
				pattern = "*",
			})

			-- Initialize with default theme
			setup_catppuccin()

			-- Keymaps
			vim.keymap.set("n", "<leader>cs", switch_theme, {
				noremap = true,
				silent = true,
				desc = "Switch colorscheme",
			})
			vim.keymap.set("n", "<leader>cS", select_theme, {
				noremap = true,
				silent = true,
				desc = "Select colorscheme",
			})
			vim.keymap.set("n", "<leader>bg", toggle_transparency, {
				noremap = true,
				silent = true,
				desc = "Toggle background transparency",
			})
		end,
	},
}
