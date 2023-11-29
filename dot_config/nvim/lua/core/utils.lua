local M = {}

M.symbols = {
    Error = ' ',
    Warn = ' ',
    Info = ' ',
    Hint = ' '
}

-- helper function to turn a string into { major, minor, patch } table
function M.version_to_table(version)
    local major, minor, patch = string.match(version, '(%d+)%.(%d+)%.(%d+)')
    return {
        major = tonumber(major),
        minor = tonumber(minor),
        patch = tonumber(patch)
    }
end

function M.file_exists_in_project(filenames)
    local function file_exists(filename)
        local stat = vim.loop.fs_stat(vim.fn.getcwd() .. '/' .. filename)
        return stat and stat.type or false
    end

    for _, filename in ipairs(filenames) do
        if file_exists(filename) then
            return true
        end
    end
    return false
end

function M.get_package_version(package_name)
    local package_json_path = vim.fn.getcwd() .. '/package.json'
    local package_json = vim.fn.readfile(package_json_path)

    if #package_json == 0 then
        return nil -- package.json not found
    end

    local package_data = vim.fn.json_decode(table.concat(package_json, ""))
    if package_data.dependencies and package_data.dependencies[package_name] then
        local package_version = package_data.dependencies[package_name]

        local version_to_table = M.version_to_table
        local package_version_table = version_to_table(package_version)

        return package_version_table
    end

    vim.notify(package_name .. " version not determined", vim.log.levels.INFO)

    return nil -- package version not determined
end

function M.package_is_installed(package_name)
    local package_json_path = vim.fn.getcwd() .. '/package.json'
    local package_json = vim.fn.readfile(package_json_path)

    if #package_json == 0 then
        return false -- package.json not found
    end

    local package_data = vim.fn.json_decode(table.concat(package_json, ""))
    if package_data.dependencies and package_data.dependencies[package_name] then
        return true
    end

    return false
end

return M
