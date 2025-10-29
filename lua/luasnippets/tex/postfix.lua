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

-- dynamic node
-- generally, postfix comes in the form PRE-CAPTURE-POST, so in this case, arg1 is the "pre" text, arg2 the "post" text
local dynamic_postfix = function(_, parent, _, user_arg1, user_arg2)
  local capture = parent.snippet.env.POSTFIX_MATCH
  if #capture > 0 then
    return sn(
      nil,
      fmta(
        [[
        <><><><>
        ]],
        { t(user_arg1), t(capture), t(user_arg2), i(0) }
      )
    )
  else
    local visual_placeholder = ''
    if #parent.snippet.env.SELECT_RAW > 0 then
      visual_placeholder = parent.snippet.env.SELECT_RAW
    end
    return sn(
      nil,
      fmta(
        [[
        <><><><>
        ]],
        { t(user_arg1), i(1, visual_placeholder), t(user_arg2), i(0) }
      )
    )
  end
end

local function postfix_std(trig, result_start, result_end)
  return postfix(
    { trig = trig, snippetType = 'autosnippet' },
    { d(1, dynamic_postfix, {}, { user_args = { result_start, result_end } }) },
    { condition = is_math, show_condition = is_math }
  )
end

-- table.insert(ret, postfix_std('vec', '\\vec{', '}'))
-- table.insert(ret, postfix_std('hat', '\\hat{', '}'))
-- table.insert(ret, postfix_std('dot', '\\dot{', '}'))
-- table.insert(ret, postfix_std('bar', '\\bar{', '}'))

return ret
