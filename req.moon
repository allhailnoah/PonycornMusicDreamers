export anim8 = require "lib.anim8"
export tween = require "lib.tween"
require "lib.slam"

require "particle"
require "ghosticle"

arc_path = 'Navi.arc.'
require(arc_path .. 'arc')
export _navi = require(arc_path .. 'navi')

export f = require 'font'
