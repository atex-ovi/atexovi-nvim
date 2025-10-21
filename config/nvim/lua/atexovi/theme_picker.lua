-- =====================================================
-- Theme Picker
-- =====================================================
local M = {}

M.themes = {
    {
        name = "Aurora Dark",
        cmd = ":colorscheme atexovi_aurora",
        colorscheme = "atexovi_aurora"
    },
    {
        name = "Dracula",
        cmd = ":colorscheme dracula",
        colorscheme = "dracula"
    },
    {
        name = "Polar",
        cmd = ":colorscheme polar",
        colorscheme = "polar"
    },
    {
        name = "Deep Blue",
        cmd = ":colorscheme tomorrow-night-deepblue",
        colorscheme = "tomorrow-night-deepblue"
    },
    {
        name = "Ashen",
        cmd = ":colorscheme ashen",
        colorscheme = "ashen"
    },
}

-- Function to display theme list and choose one
function M.choose()
    vim.notify("=== Choose a Theme ===", vim.log.levels.INFO)
    for i, t in ipairs(M.themes) do
        vim.notify(i .. ": " .. t.name, vim.log.levels.INFO)
    end

    -- Take input from the user
    vim.fn.inputsave()
    local choice = tonumber(vim.fn.input("Enter theme number: "))
    vim.fn.inputrestore()

    local picker = M.themes[choice]
    if not picker then
        vim.schedule(function()
            vim.notify("Invalid choice!", vim.log.levels.ERROR)
        end)
        return
    end

    -- Apply selected theme
    local ok, err = pcall(vim.cmd, "colorscheme " .. picker.colorscheme)
    if not ok then
        vim.schedule(function()
            vim.notify("Failed to load theme '" .. picker.name .. "': " .. err, vim.log.levels.ERROR)
        end)
        return
    end

    vim.schedule(function()
        vim.notify("Theme successfully changed to: " .. picker.name, vim.log.levels.INFO)
    end)
end

-- Register command to Neovim
vim.cmd([[command! ThemePicker lua require("atexovi.theme_picker").choose()]])

return M