extends TextureButton

@onready var label = $Label
@onready var ability: Ability
@onready var select_sfx = $SelectSFX


func display(a:Ability):
	ability = a
	label.text = ability.input_label
	


func _on_pressed():
	select_sfx.play()
	GlobalSignals.AbilitySelected.emit(
		BattleData.find_ability(ability)
	)
