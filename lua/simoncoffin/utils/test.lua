local function toggle_spec_file()
    -- Get the current buffer's file path
    local current_file = vim.api.nvim_buf_get_name(0)

    -- Function to check if a file exists
    local function file_exists(filename)
        return vim.loop.fs_stat(filename) ~= nil
    end

    -- Check if the current file ends with "_spec.rb"
    if string.match(current_file, "_spec%.rb$") then
        -- Create a new file path by changing "_spec.rb" to ".rb"
        local new_file = string.gsub(current_file, "_spec%.rb$", ".rb")

        -- Change the directory from "spec" to "app"
        new_file = string.gsub(new_file, "/spec/", "/app/")

        -- Check if the new file exists
        if file_exists(new_file) then
            -- Open the file if it exists
            vim.cmd("edit " .. new_file)
        else
            -- Print a message if the file does not exist
            print("No such file: " .. new_file)
        end
    else
        -- Create a new file path by changing ".rb" to "_spec.rb"
        local new_file = string.gsub(current_file, "%.rb$", "_spec.rb")

        -- Change the directory from "app" to "spec"
        new_file = string.gsub(new_file, "/app/", "/spec/")

        -- Check if the new file exists
        if file_exists(new_file) then
            -- Open the file if it exists
            vim.cmd("edit " .. new_file)
        else
            -- Print a message if the file does not exist
            print("No such file: " .. new_file)
        end
    end
end

vim.api.nvim_create_user_command('TestToggle', toggle_spec_file, { nargs = 0 })

vim.keymap.set("n", "<leader>tt", "<cmd>TestToggle<cr>", { desc = "Toggle between test and code file" })
