return {
    -- Disables semantic highlighting
    on_init = function(client, _)
        client.server_capabilities.semanticTokensProvider = nil
    end,
    settings = {
        basedpyright = {
            disableOrganizeImports = true,
            analysis = {
                typeCheckingMode = "standard",
                diagnosticSeverityOverrides = {
                    reportUnusedImport = false,
                    reportUnusedParameter = false,
                    reportUnusedVariable = false,
                    reportUndefinedVariable = false,
                },
            },
        },
    },
}
