extends CanvasLayer

@export var character_card_scene: PackedScene
@onready var card_container = %CardContainer

func enter_combatants(combatant_1, combatant_2):
	#Build Character_Cards
	build_character_card(combatant_1)
	build_character_card(combatant_2)


func build_character_card(combatant: Character):
	#Card Art#
	var card = character_card_scene.instantiate()
	card_container.add_child(card)
	card.name_label.text = combatant.name
	card.portrait.texture = combatant.portrait
	## Add HP Values
	card.hp_bar.max_value = combatant.max_hp
	card.hp_bar.value = combatant.hp
	##Set Indicator Values
	## Set Info Values
	card.stance_label.text = "Stance: " + combatant.stance
	card.face_label.text = "Face: " + combatant.face
	card.weapon_label.text = "Weapon: " + combatant.weapon.name
