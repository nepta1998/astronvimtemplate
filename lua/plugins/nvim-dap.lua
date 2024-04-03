return {
  "mfussenegger/nvim-dap",
  config = function(plugin, opts)
    require('dap.ext.vscode').load_launchjs()
    local dap = require('dap')
    local mason_registry = require("mason-registry")
    local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
    local codelldb_path = codelldb_root .. "adapter/codelldb"
    local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"
    dap.adapters.rust = {
      type = "server",
      port = "${port}",
      host = "127.0.0.1",
      executable = {
        command = codelldb_path,
        args = { "--liblldb", liblldb_path, "--port", "${port}" },
      },
    }
  end,
}
