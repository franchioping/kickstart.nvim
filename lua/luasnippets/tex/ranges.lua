local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local extras = require 'luasnip.extras'
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require 'luasnip.extras.expand_conditions'
local postfix = require('luasnip.extras.postfix').postfix
local types = require 'luasnip.util.types'
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key

local utils = require 'luasnip-latex-snippets.luasnippets.tex.utils'

local is_math = utils.conditions.is_math
local as = require('luasnip').extend_decorator.apply(s, { snippetType = 'autosnippet' })

local ret = {}
--
-- table.insert(
--   ret,
--   as(
--     {
--       trig = 'rancc',
--       regTrig = true,
--       name = 'range closed close',
--       dscr = 'ranges typing x_ -> x_{}',
--     },
--     fmta([[ \left[ <> ; <> \right] ]], {
--       i(1),
--       i(2),
--     }),
--     { condition = is_math }
--   )
-- )

local leters = { 'c', 'o' }
for index, value in ipairs(leters) do
  for index2, value2 in ipairs(leters) do
    local char1
    local char2
    if index == 1 then
      char1 = '['
    else
      char1 = ']'
    end
    if index2 == 1 then
      char2 = ']'
    else
      char2 = '['
    end
    table.insert(
      ret,
      as(
        {
          trig = 'ran' .. value .. value2,
          regTrig = true,
          name = 'range ' .. value .. value2 .. ' - ' .. char1 .. char2,
          dscr = 'ranges',
        },
        fmta('\\left' .. char1 .. ' <> ; <> \\right' .. char2, {
          i(1),
          i(2),
        }),
        { condition = is_math }
      )
    )
  end
end

return ret
