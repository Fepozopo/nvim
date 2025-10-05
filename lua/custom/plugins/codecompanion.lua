return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'ravitemer/mcphub.nvim',
    },
    opts = {
      -- Prompt Library
      prompt_library = {},

      -- Extensions
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      -- Display/UI
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = 'Prompt ',
          provider = 'default',
          opts = {
            show_default_actions = true,
            show_default_prompt_library = true,
          },
        },
        chat = {
          icons = {
            buffer_pin = ' ',
            buffer_watch = '👀 ',
          },
          debug_window = {
            width = function()
              return vim.o.columns - 5
            end,
            height = function()
              return vim.o.lines - 2
            end,
          },
          window = {
            layout = 'vertical', -- float|vertical|horizontal|buffer
            position = nil, -- left|right|top|bottom
            border = 'single',
            height = 0.8,
            width = 0.45,
            relative = 'editor',
            full_height = true,
            opts = {
              breakindent = true,
              cursorcolumn = false,
              cursorline = false,
              foldcolumn = '0',
              linebreak = true,
              list = false,
              numberwidth = 1,
              signcolumn = 'no',
              spell = false,
              wrap = true,
            },
          },
          token_count = function(tokens, adapter)
            return ' (' .. tokens .. ' tokens)'
          end,
          auto_scroll = true,
          intro_message = 'Welcome to CodeCompanion ✨! Press ? for options',
          show_header_separator = false,
          separator = '─',
          show_references = true,
          show_settings = true,
          show_token_count = true,
          start_in_insert_mode = false,
        },
        inline = {
          layout = 'vertical', -- vertical|horizontal|buffer
        },
        diff = {
          enabled = true,
          close_chat_at = 240,
          layout = 'vertical',
          opts = { 'internal', 'filler', 'closeoff', 'algorithm:patience', 'followwrap', 'linematch:120' },
          provider = 'default', -- default|mini_diff
        },
      },
      -- Strategies
      strategies = {
        chat = {
          adapter = {
              name = 'copilot',
              model = 'gpt-5-mini',
          },
          keymaps = {
            send = { modes = { n = '<C-s>', i = '<C-s>' }, opts = {} },
            close = { modes = { n = '<C-c>', i = '<C-c>' }, opts = {} },
          },
          variables = {},
          slash_commands = {},
          tools = {
            opts = {
              auto_submit_errors = false,
              auto_submit_success = false,
              default_tools = {},
              system_prompt = {
                enabled = true, -- Enable the tools system prompt?
                replace_main_system_prompt = false, -- Replace the main system prompt with the tools system prompt?

                ---The tool system prompt
                ---@param args { tools: string[]} The tools available
                ---@return string
                prompt = function(args)
                return require("custom.config.codecompanion_tools_prompt")
            end,
              },
            },
          },
          roles = {
            llm = function(adapter)
              return 'CodeCompanion (' .. adapter.formatted_name .. ')'
            end,
            user = 'Me',
          },
          opts = {
            prompt_decorator = nil, -- function(message, adapter, context) ...
            completion_provider = 'cmp', -- blink|cmp|coc|default
            goto_file_action = nil, -- default jump action
            system_prompt = require("custom.config.codecompanion_system_prompt"), -- custom system prompt
          },
        },
        inline = {
          adapter = {
              name = 'copilot',
              model = 'gpt-5-mini',
          },
          keymaps = {
            accept_change = { modes = { n = 'ga' }, description = 'Accept the suggested change' },
            reject_change = { modes = { n = 'gr' }, description = 'Reject the suggested change' },
          },
          variables = {},
        },
        cmd = {
          adapter = {
              name = 'copilot',
              model = 'gpt-5-mini',
          },
        },
      },
      -- General plugin options
      log_level = 'ERROR', -- TRACE|DEBUG|ERROR|INFO
      language = 'English',
      send_code = true,
      -- Adapters
      adapters = {
        opts = {
          allow_insecure = false,
          proxy = nil,
          show_defaults = true,
          show_model_choices = true,
        },
      },
    },
  },
}
