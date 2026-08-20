-- https://github.com/radiosilence/dotfiles/blob/master/.wezterm.lua
-- https://codeberg.org/scy/dotfiles/src/commit/fd298c991d69edd422230592f62b4fbbe1ed0a6f/.config/wezterm/wezterm.lua
local wezterm = require 'wezterm';

return {
    color_scheme = "Builtin Solarized Dark",

    -- Font
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },  -- disable ligatures

    font = wezterm.font("Hermit"),
    font_size = 16.2,
    line_height = 0.95,
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
    window_close_confirmation = "NeverPrompt",


    -- Visual Bell Only
    audible_bell = 'Disabled',
    visual_bell = {
      fade_in_duration_ms = 20,
      fade_out_duration_ms = 200,
      fade_in_function = 'Linear',
      fade_out_function = 'EaseOut',
    },

    -- System
    automatically_reload_config = true
}
