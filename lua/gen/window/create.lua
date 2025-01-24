local globals = {}
local close_window = require("gen.window.close")
local get_window_options = require("gen.window.get")
local default_options = require("gen.utils.default_options")

local M = {}

for k, v in pairs(default_options) do
    M[k] = v
end

M.setup = function(opts)
    for k, v in pairs(opts) do
        M[k] = v
    end
end

local function create_window(cmd, opts)
    local function setup_window()
        globals.result_buffer = vim.fn.bufnr("%")
        globals.float_win = vim.fn.win_getid()
        vim.api.nvim_set_option_value("filetype", opts.result_filetype, { buf = globals.result_buffer })
        vim.api.nvim_set_option_value("buftype", "nofile", { buf = globals.result_buffer })
        vim.api.nvim_set_option_value("wrap", true, { win = globals.float_win })
        vim.api.nvim_set_option_value("linebreak", true, { win = globals.float_win })
    end

    local display_mode = opts.display_mode or M.display_mode
    if display_mode == "float" then
        if globals.result_buffer then
            vim.api.nvim_buf_delete(globals.result_buffer, { force = true })
        end
        local win_opts = vim.tbl_deep_extend("force", get_window_options(opts), opts.win_config)
        globals.result_buffer = vim.api.nvim_create_buf(false, true)
        globals.float_win = vim.api.nvim_open_win(globals.result_buffer, true, win_opts)
        setup_window()
    elseif display_mode == "horizontal-split" then
        vim.cmd("split gen.nvim")
        setup_window()
    else
        vim.cmd("vnew gen.nvim")
        setup_window()
    end
    vim.keymap.set("n", "<esc>", function()
        if globals.job_id then
            vim.fn.jobstop(globals.job_id)
        end
    end, { buffer = globals.result_buffer })
    vim.keymap.set("n", M.quit_map, "<cmd>quit<cr>", { buffer = globals.result_buffer })
    vim.keymap.set("n", M.accept_map, function()
        opts.replace = true
        close_window(opts)
    end, { buffer = globals.result_buffer })
    vim.keymap.set("n", M.retry_map, function()
        local buf = 0 -- Current buffer
        if globals.job_id then
            vim.fn.jobstop(globals.job_id)
            globals.job_id = nil
        end
        vim.api.nvim_buf_set_option(buf, "modifiable", true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
        vim.api.nvim_buf_set_option(buf, "modifiable", false)
        -- vim.api.nvim_win_close(0, true)
        M.run_command(cmd, opts)
    end, { buffer = globals.result_buffer })
end

return create_window
