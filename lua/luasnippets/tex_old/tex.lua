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

local utils = require 'luasnip-latex-snippets.util.utils'
local is_math = utils.with_opts(utils.is_math, false) -- true to use treesitter
local not_math = utils.with_opts(utils.not_math, false) -- true to use treesitter
local as = require('luasnip').extend_decorator.apply(s, { snippetType = 'autosnippet' })

local ret = {
  as(
    {
      trig = '(%a)_',
      regTrig = true,
      name = 'auto subscript underscore',
      dscr = 'Auto subscript: typing x_ -> x_{}',
    },
    fmta([[<>_{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = is_math }
  ),
}

return {}
