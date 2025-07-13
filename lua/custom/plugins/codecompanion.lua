return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "ravitemer/mcphub.nvim",
        },
        opts = {
            -- Prompt Library
            prompt_library = {},

            -- Extensions
            extensions = {
                mcphub = {
                    callback = "mcphub.extensions.codecompanion",
                    opts = {
                        make_vars = true,
                        make_slash_commands = true,
                        show_result_in_chat = true
                    }
                }
            },
            -- Display/UI
            display = {
                action_palette = {
                    width = 95,
                    height = 10,
                    prompt = "Prompt ",
                    provider = "default",
                    opts = {
                        show_default_actions = true,
                        show_default_prompt_library = true,
                    },
                },
                chat = {
                    icons = {
                        buffer_pin = " ",
                        buffer_watch = "👀 ",
                    },
                    debug_window = {
                        width = function() return vim.o.columns - 5 end,
                        height = function() return vim.o.lines - 2 end,
                    },
                    window = {
                        layout = "vertical", -- float|vertical|horizontal|buffer
                        position = nil, -- left|right|top|bottom
                        border = "single",
                        height = 0.8,
                        width = 0.45,
                        relative = "editor",
                        full_height = true,
                        opts = {
                            breakindent = true,
                            cursorcolumn = false,
                            cursorline = false,
                            foldcolumn = "0",
                            linebreak = true,
                            list = false,
                            numberwidth = 1,
                            signcolumn = "no",
                            spell = false,
                            wrap = true,
                        },
                    },
                    token_count = function(tokens, adapter)
                        return " (" .. tokens .. " tokens)"
                    end,
                    auto_scroll = true,
                    intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
                    show_header_separator = false,
                    separator = "─",
                    show_references = true,
                    show_settings = false,
                    show_token_count = true,
                    start_in_insert_mode = false,
                },
                inline = {
                    layout = "vertical", -- vertical|horizontal|buffer
                },
                diff = {
                    enabled = true,
                    close_chat_at = 240,
                    layout = "vertical",
                    opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
                    provider = "default", -- default|mini_diff
                },
            },
            -- Strategies
            strategies = {
                chat = {
                    adapter = "copilot",
                    keymaps = {
                        send = { modes = { n = "<C-s>", i = "<C-s>" }, opts = {} },
                        close = { modes = { n = "<C-c>", i = "<C-c>" }, opts = {} },
                    },
                    variables = {},
                    slash_commands = {},
                    tools = {
                        opts = {
                            auto_submit_errors = false,
                            auto_submit_success = false,
                            default_tools = {},
                        },
                    },
                    roles = {
                        llm = function(adapter)
                            return "CodeCompanion (" .. adapter.formatted_name .. ")"
                        end,
                        user = "Me",
                    },
                    opts = {
                        prompt_decorator = nil, -- function(message, adapter, context) ...
                        completion_provider = "cmp", -- blink|cmp|coc|default
                        goto_file_action = nil, -- default jump action
                    },
                },
                inline = {
                    adapter = "copilot",
                    keymaps = {
                        accept_change = { modes = { n = "ga" }, description = "Accept the suggested change" },
                        reject_change = { modes = { n = "gr" }, description = "Reject the suggested change" },
                    },
                    variables = {},
                },
                cmd = {
                    adapter = "copilot",
                },
            },
            -- General plugin options
            log_level = "ERROR", -- TRACE|DEBUG|ERROR|INFO
            language = "English",
            send_code = true,
            system_prompt = function(opts)
              return [[You are an AI programming assistant named "CodeCompanion". You are currently plugged in to the Neovim text editor on a user's machine.
Your core tasks include:
- Answering general programming questions.
- Explaining how the code in a Neovim buffer works.
- Reviewing the selected code in a Neovim buffer.
- Generating unit tests for the selected code.
- Proposing fixes for problems in the selected code.
- Scaffolding code for a new workspace.
- Finding relevant code to the user's query.
- Proposing fixes for test failures.
- Answering questions about Neovim.
- Running tools.
You must:
- Follow the user's requirements carefully and to the letter.
- Keep your answers short and impersonal, especially if the user responds with context outside of your tasks.
- Minimize other prose.
- Use Markdown formatting in your answers.
- Include the programming language name at the start of the Markdown code blocks.
- Avoid including line numbers in code blocks.
- Avoid wrapping the whole response in triple backticks.
- Only return code that's relevant to the task at hand. You may not need to return all of the code that the user has shared.
- Use actual line breaks instead of '\n' in your response to begin new lines.
- Use '\n' only when you want a literal backslash followed by a character 'n'.
- All non-code responses must be in %s.
When given a task:
1. Think step-by-step and describe your plan for what to build in pseudocode, written out in great detail, unless asked not to do so.
2. Output the code in a single code block, being careful to only return relevant code.
3. You should always generate short suggestions for the next user turns that are relevant to the conversation.
4. You can only give one reply for each conversation turn.]]
            end,
            -- Adapters
            adapters = {
                opts = {
                    allow_insecure = false,
                    proxy = nil,
                    show_defaults = true,
                    show_model_choices = true,
                },
            },
        }
    },
}
