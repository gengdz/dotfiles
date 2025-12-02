return {
  {
    "milanglacier/minuet-ai.nvim",
    opts = {
      virtualtext = {
        auto_trigger_ft = { "*" },
        keymap = {
          accept = "<Tab>",
          accept_line = "<A-a>",
          accept_n_lines = "<A-z>",
          prev = "<A-[>",
          next = "<A-]>",
          dismiss = "<A-e>",
        },
      },
      provider = "openai_compatible",
      provider_options = {
        openai_compatible = {
          model = "qwen3-coder-plus",
          stream = true,
          end_point = "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions", -- Contains "chat" to avoid warning, fragment won't be sent to server
          api_key = "QWEN_API_KEY",
          name = "qwen",
          optional = {
            max_tokens = 256,
            stop = { "\n\n" },
          },
        },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    optional = true,
    opts = {
      filetypes = { ["*"] = true },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>ai",
        function()
          vim.cmd("CodeCompanion")
        end,
        desc = "Code companion inline",
      },
      {
        "<leader>aa",
        "<cmd>CodeCompanionActions<cr>",
        desc = "Trigger Code Companion actions",
      },
      {
        "<leader>ac",
        "<cmd>CodeCompanionChat<cr>",
        desc = "Open Code Companion chat interface",
      },
      {
        "<leader>am",
        "<cmd>CodeCompanionCmd",
        desc = "Execute a command in Code Companion",
      },
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
      "CodeCompanionCmd",
    },
    opts = {
      adapters = {
        qwen = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            name = "qwen",
            opts = {
              -- vision = true,
              log_level = "DEBUG",
              stream = true,
              language = "Chinese",
            },
            env = {
              url = os.getenv("QWEN_API_END_POINT_DOMAIN"),
              chat_url = "/v1/chat/completions",
              models_endpoint = "/v1/models",
              api_key = os.getenv("QWEN_API"),
            },
            headers = {
              ["Content-Type"] = "application/json",
            },
            schema = {
              model = {
                default = "Qwen3-Coder",
              },
              num_ctx = {
                default = 8192,
              },
              num_preduct = {
                default = -1,
              },
            },
          })
        end,
      },
      completion_provider = "blink", -- blink|cmp|coc|default
      strategies = {
        chat = { adapter = "qwen" },
        inline = { adapter = "qwen" },
        action = { adapter = "qwen" },
      },
      display = {
        diff = {
          enabled = true,
          close_chat_at = 240,
          layout = "vertical",
          opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
          provider = "mini_diff",
        },
      },
    },
  },
  {
    "yetone/avante.nvim",
    enabled = false,
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = "qianwen", -- Default provider for Avante
      auto_suggestions_provider = "qianwen",
      providers = {
        qianwen = {
          __inherited_from = "openai",
          api_key_name = "QWEN_API",
          endpoint = os.getenv("QWEN_API_END_POINT"),
          model = "Qwen3-Coder",
        },
        ---@type AvanteSupportedProvider
        gemini = {
          -- endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
          model = "gemini-2.5-flash",
          timeout = 30000, -- Timeout in milliseconds
          context_window = 1048576,
          use_ReAct_prompt = true,
          extra_request_body = {
            generationConfig = {
              temperature = 0.75,
            },
          },
        },
        openai = {
          endpoint = "https://api.chatanywhere.tech/v1",
          model = "gpt-4o-mini",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
      },
      -- input = {
      --   provider_opts = {
      --     height = 10, -- 设置输入框的高度
      --   },
      -- },
    },
  },
}
