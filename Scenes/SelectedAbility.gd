extends Panel

@onready var text_label = $Text


@warning_ignore("unused_parameter")
func _process(delta):
	if BattleData.selected_ability != null :
		text_label.text = BattleData.selected_ability["description"]
	else:
		text_label.text = ""
