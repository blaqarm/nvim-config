-- treesitter.lua
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
        -- Проверяем доступность модуля
        local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
        if not status_ok then
            return
        end

        configs.setup({
            ensure_installed = { 'lua', 'javascript', 'typescript', 'html', 'php', 'css' },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
