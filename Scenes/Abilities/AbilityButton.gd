extends TextureButton

@onready var label = $Label
@onready var ability: Ability

func display(a:Ability):
	ability = a
	label.text = ability.input_label
	


func _on_pressed():
	GlobalSignals.AbilitySelected.emit(
		BattleData.find_ability(ability)
	)
