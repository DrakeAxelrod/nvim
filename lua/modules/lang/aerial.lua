-- https://github.com/stevearc/aerial.nvim
return function()
  local ok, aerial = pcall(require, "aerial")
  if not ok then
    return
  end
  aerial.setup({
    min_width = 30,
    -- backends = {"lsp", "treesitter", "markdown"}
    backends = { "treesitter", "markdown" },
    -- show all icons
    filter_kind = false,
    -- auto use lspkind-nvim or nvim-web-devicons
    nerd_font = "auto",
    -- Show box drawing characters for the tree hierarchy
    show_guides = true,
    -- Customize the characters used when show_guides = true
    guides = {
      -- When the child item has a sibling below it
      mid_item = "├─",
      -- When the child item is the last in the list
      last_item = "└─",
      -- When there are nested child guides to the right
      nested_top = "│ ",
      -- Raw indentation
      whitespace = "  "
    },
    update_events = "TextChanged,InsertLeave",
    -- on_attach = function(client, bufnr)
    --   mapping.register("buffer", "aerial", bufnr)
    -- end
  })
end

-- AerialToggle[!]	left/right/float	Open or close the aerial window. With [!] cursor stays in current window
-- AerialOpen[!]	left/right/float	Open the aerial window. With [!] cursor stays in current window
-- AerialClose		Close the aerial window
-- AerialPrev	N=1	Jump backwards N symbols
-- AerialNext	N=1	Jump forwards N symbols
-- AerialPrevUp	N=1	Jump up the tree N levels, moving backwards
-- AerialNextUp	N=1	Jump up the tree N levels, moving forwards
-- AerialGo	N=1, v/h	Jump to the Nth symbol
-- AerialTreeOpen[!]		Expand tree at current location. [!] makes it recursive.
-- AerialTreeClose[!]		Collapse tree at current location. [!] makes it recursive.
-- AerialTreeToggle[!]		Toggle tree at current location. [!] makes it recursive.
-- AerialTreeOpenAll		Open all tree nodes
-- AerialTreeCloseAll		Collapse all tree nodes
-- AerialTreeSyncFolds		Sync code folding with current tree state
-- AerialInfo		Print out debug info related to aerial
