return {
  {
    "olimorris/codecompanion.nvim",
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
    build = "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = "qianwen", -- Default provider for Avante
      -- auto_suggestions_provider = "copilot",
      providers = {
        qianwen = {
          __inherited_from = "openai",
          api_key_name = "QWEN_API",
          -- 这段代码的作用是：os.getenv 是
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
        opeanai = {
          endpoint = "https://api.chatanywhere.tech/v1",
          model = "gpt-4o-mini",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
      },
      selector = {
        provider = "snacks",
        -- Options override for custom providers
        -- provider_opts = {},
      },
      input = {
        provider = "snacks",
        provider_opts = {
          -- Additional snacks.input options
          title = "Avante Input",
          icon = " ",
          height = 10, -- 设置输入框的高度
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      -- "stevearc/dressing.nvim", -- for input provider dressing
      -- "folke/snacks.nvim", -- for input provider snacks
      -- "echasnovski/mini.icons",
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
