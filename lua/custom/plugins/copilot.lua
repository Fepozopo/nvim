return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require('copilot').setup({
            panel = {
              enabled = true,
              auto_refresh = false,
              keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>"
              },
              layout = {
                position = "bottom", -- | top | left | right | horizontal | vertical
                ratio = 0.4
              },
            },
            suggestion = {
              enabled = true,
              auto_trigger = false,
              hide_during_completion = true,
              debounce = 75,
              keymap = {
                accept = "<M-y>",
                accept_word = false,
                accept_line = "<M-l>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<M-n>",
              },
            },
            filetypes = {
              ["*"] = true,
            },
            auth_provider_url = nil, -- URL to authentication provider, if not "https://github.com/"
            logger = {
              file = vim.fn.stdpath("log") .. "/copilot-lua.log",
              file_log_level = vim.log.levels.OFF,
              print_log_level = vim.log.levels.WARN,
              trace_lsp = "off", -- "off" | "messages" | "verbose"
              trace_lsp_progress = false,
              log_lsp_messages = false,
            },
            copilot_node_command = 'node', -- Node.js version must be > 20
            workspace_folders = {},
            copilot_model = "",  -- Current LSP default is gpt-35-turbo, supports gpt-4o-copilot
            root_dir = function()
              return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
            end,
            should_attach = function(_, _)
              if not vim.bo.buflisted then
              -- logger.debug("not attaching, buffer is not 'buflisted'")
                return false
              end
          
              if vim.bo.buftype ~= "" then
              -- logger.debug("not attaching, buffer 'buftype' is " .. vim.bo.buftype)
                return false
              end
          
              return true
            end,
            server = {
              type = "nodejs", -- "nodejs" | "binary"
              custom_server_filepath = nil,
            },
            server_opts_overrides = {},
          })
    end
  }