extends Item
class_name Weapon

@export_category("Weapon Info")
@export_enum("Top","TopLeft","TopRight","Bottom","BottomLeft","BottomRight") var home_stance ="Top"
@export_enum("Top","Left","Right","Bottom") var home_face ="Right"
@export var name: String

@export_category("Strikes")
@export var top_strikes: Array[Strike] = []
@export var top_left_strikes: Array[Strike] = []
@export var top_right_strikes: Array[Strike] = []
@export var bottom_strikes: Array[Strike] = []
@export var bottom_left_strikes: Array[Strike] = []
@export var bottom_right_strikes: Array[Strike] = []

@export_category("Blocks")
@export var blocks: Array[Block] = []

@export_category("Dodge")
@export var dodges: Array[Dodge] = []


##############################
##ALL ABLITIES################
###############################

var abilities:Array[Ability]
