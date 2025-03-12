local function create_html_boilerplate()
  -- Set HTML5 boilerplate
  local lines = {
    "<!DOCTYPE html>",
    '<html lang="en">',
    "<head>",
    '  <meta charset="UTF-8">',
    '  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
    "  <title>Document</title>",
    "</head>",
    "<body>",
    "  ",
    "</body>",
    "</html>",
  }

  -- Insert boilerplate if buffer is empty
  if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    -- Move cursor to title tag
    vim.api.nvim_win_set_cursor(0, { 6, 10 })
  end
end

-- Create autocommand for new HTML files
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.html",
  callback = create_html_boilerplate,
})

-- Add at the bottom of the file
vim.api.nvim_create_user_command("Htmlbp", create_html_boilerplate, {})
