--loader = require "AdvTiledLoader.Loader"
--bump = require "lib.bump"
anim8 = require "lib.anim8"
tween = require "lib.tween"
--gamera = require "lib.gamera"
--gui = require "Quickie"

require "lib.middleclass"
--require "lib.Tserial"
require "lib.slam"

Particle = require "particle"
Ghosticle = require "ghosticle"

arc_path = 'Navi.arc.'
require(arc_path .. 'arc')
_navi = require(arc_path .. 'navi')

f = require 'font'

