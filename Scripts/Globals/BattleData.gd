extends Node

# Combatants #######################
var player: = preload("res://Scenes/Characters/Enemies/TestPlayer.tres") as Character
var enemy: = preload("res://Scenes/Characters/Enemies/TestEnemy.tres") as Character


# Combat Info #########################################
var current_weapon: Weapon = player.weapon
var stance = current_weapon.home_stance
var face = current_weapon.home_face
var selected_ability: Ability
var player_action: Ability
var enemy_action: Ability

func _ready():
	build_ability_array()
	GlobalSignals.AbilitySelected.connect(_on_ability_selected)

func build_ability_array():
	current_weapon.abilities.append_array(current_weapon.top_strikes)
	current_weapon.abilities.append_array(current_weapon.top_left_strikes)
	current_weapon.abilities.append_array(current_weapon.top_right_strikes)
	current_weapon.abilities.append_array(current_weapon.bottom_strikes)
	current_weapon.abilities.append_array(current_weapon.bottom_left_strikes)
	current_weapon.abilities.append_array(current_weapon.bottom_right_strikes)
	current_weapon.abilities.append_array(current_weapon.blocks)
	current_weapon.abilities.append_array(current_weapon.dodges)

func find_ability_by_name(a_name:String):
	for a in current_weapon.abilities:
		if a["name"] == a_name:
			return a

func find_ability(ability: Ability):
	for a in current_weapon.abilities:
		if a == ability:
			return a


func _on_ability_selected(ability: Ability):
	selected_ability = ability
	enemy_action = ability
