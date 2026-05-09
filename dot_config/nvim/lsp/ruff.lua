return {
    init_options = {
        settings = {
            configurationPreference = "filesystemFirst",
            showSyntaxErrors = false,
            lint = {
                select = {
                    "E4", -- pycodestyle imports-related rules (default)
                    "E7", -- More pycodestyle rules (default)
                    "E9", -- Even more pycodestyle rules (default)
                    "F", -- Pyflakes rules (default)
                    "UP", -- pyupgrade rules to upgrade syntax for newer versions
                    "YTT", -- flake8-2020 rules for proper usage of sys.version_info
                    "FBT", -- flake8-boolean-trap rules for bool args in functions
                    "B", -- flake8-bugbear rules for common bugs
                    "A", -- flake8-builtins rules for shadowing builtins
                    "C4", -- flake8-comprehensions rules for proper usage of comprehensions
                    "DTZ", -- flake8-datetimez rules for proper usage of datetimes
                    "EM", -- flake8-errmsg rules for proper error messages
                    "SIM", -- flake8-simplify rules to simplify the code
                    "ARG", -- flake8-unused-arguments rules for unused arguments
                },
            },
        },
    },
}
