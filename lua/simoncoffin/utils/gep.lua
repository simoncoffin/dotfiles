local function toggle_graphql_version_of_file()
    -- Get the current buffer's file path
    local current_file = vim.api.nvim_buf_get_name(0)

    -- Function to check if a file exists
    local function file_exists(filename)
        return vim.loop.fs_stat(filename) ~= nil
    end

    -- Function to open a file if it exists
    local function open_file_if_exists(file_path)
        if file_exists(file_path) then
            vim.cmd("edit " .. file_path)
        else
            print("No such file: " .. file_path)
        end
    end

    -- Check if the current file is a GraphQL file
    if string.match(current_file, "/graphql/") then
        -- Remove "/graphql" from the file path to get the non-GraphQL version
        local non_graphql_file = string.gsub(current_file, "/graphql/", "/")
        open_file_if_exists(non_graphql_file)
    else
        -- Add "/graphql" to the file path to get the GraphQL version
        local graphql_file = string.gsub(current_file, "(controllers/api/v1/)", "%1graphql/")
        open_file_if_exists(graphql_file)
    end
end

vim.api.nvim_create_user_command('ToggleGraphqlGep', toggle_graphql_version_of_file, { nargs = 0 })

vim.keymap.set("n", "<leader>tg", "<cmd>ToggleGraphqlGep<cr>", { desc = "Toggle between GraphQL and non-GraphQL version of file" })
