-- https://github.com/radiosilence/dotfiles/blob/master/.wezterm.lua
-- https://codeberg.org/scy/dotfiles/src/commit/fd298c991d69edd422230592f62b4fbbe1ed0a6f/.config/wezterm/wezterm.lua
local wezterm = require 'wezterm';

return {
    color_scheme = "Builtin Solarized Dark",

    -- Font
    font = wezterm.font("Hermit"),
    font_size = 16.0,
    font_rules = {
        {
            intensity = "Bold",
            font = wezterm.font("Hermit", { bold = true })
        },
        {
            italic = true,
            font = wezterm.font("Hermit", { italic = true })
        },
        {
            italic = true,
            intensity = "Bold",
            font = wezterm.font("Hermit", { bold = true, italic = true })
        }
    },

    -- Tab Bar
    hide_tab_bar_if_only_one_tab = true,

    -- Cursor
    -- Disabling cursor blink makes a _massive_ difference in GPU usage (20% vs 3%).
    -- Therefore, I'll disable it to save energy.
    cursor_blink_rate = 0,

    -- Window
    window_padding = { left = 2, right = 2, top = 2, bottom = 2 },
    window_close_confirmation = "NeverPrompt"
}
