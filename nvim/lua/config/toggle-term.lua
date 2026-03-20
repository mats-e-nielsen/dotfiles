-- Keep track of the terminal buffer and window
local term_buf = nil
local term_win = nil

function ToggleTerminal()
  -- If the terminal window is already open and valid, hide it
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_hide(term_win)
    term_win = nil
  else
    -- Open a split at the bottom
    vim.cmd("botright split")
    -- If a terminal buffer already exists, reuse it; otherwise, create one
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      vim.api.nvim_win_set_buf(0, term_buf)
    else
      vim.cmd("terminal")
      term_buf = vim.api.nvim_get_current_buf()
    end
    term_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_height(term_win, 10) -- Adjust height as needed
    vim.cmd("startinsert")                    -- Enter insert mode automatically
  end
end

-- Keymaps for Normal and Terminal modes
vim.keymap.set('n', '<C-j>', ToggleTerminal, { desc = "Toggle Terminal" })
vim.keymap.set('t', '<C-j>', ToggleTerminal, { desc = "Toggle Terminal" })

-- Convenience: Exit terminal mode with Escape (optional)
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })
