extends Node

class_name Arena


@export var combatant_1: Character
@export var combatant_2: Character
@onready var arena_ui = %ArenaUI
#@onready var turn_manager: TurnManager = $TurnManager


func _ready():
	arena_ui.enter_combatants(combatant_1,combatant_2)
	
