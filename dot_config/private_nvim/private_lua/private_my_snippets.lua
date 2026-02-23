local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local t = ls.text_node

ls.add_snippets("all", {
  s("matrix", {
    i(1, "4"), t(" "), i(2, "3"), t({"", "\\begin{pmatrix}"}),
    f(function(args)
      local n = tonumber(args[1][1])
      local k = tonumber(args[2][1])
      if not n or not k then return "" end
      local lines = {}
      local idx = 1
      for r = 1, n do
        local row = {}
        for c = 1, k do
          table.insert(row, "${" .. idx .. ":}")
          idx = idx + 1
          if c < k then
            table.insert(row, " & ")
          end
        end
        table.insert(lines, table.concat(row))
        if r < n then
          table.insert(lines, " \\\\")
        end
      end
      return table.concat(lines, "\n")
    end, {1, 2}),
    t({"", "\\end{pmatrix}"}),
  }),
})

