extends PanelContainer

@export var ability_button: PackedScene
@onready var ability_grid = $VBoxContainer/AbilityGrid
@onready var title = $VBoxContainer/Title


func display(action:String):
	match action:
		"Strike":
			title.text = "Strike"
			build_buttons("Strike")
		"Block":
			title.text = "Block"
			build_buttons("Block")
		"Dodge":
			title.text = "Dodge"
			build_buttons("Dodge")

func build_buttons(action:String):
	match action:
		"Strike":
			match BattleData.player_stance:
				"Top":
					for a in BattleData.player_weapon.top_strikes:
						var a_butt = ability_button.instantiate()
						ability_grid.add_child(a_butt)
						a_butt.display(a)
				"TopLeft":
					for a in BattleData.player_weapon.top_left_strikes:
						var a_butt = ability_button.instantiate()
						ability_grid.add_child(a_butt)
						a_butt.display(a)
				"TopRight":
					for a in BattleData.player_weapon.top_right_strikes:
						var a_butt = ability_button.instantiate()
						ability_grid.add_child(a_butt)
						a_butt.display(a)
				"Bottom":
					for a in BattleData.player_weapon.bottom_strikes:
						var a_butt = ability_button.instantiate()
						ability_grid.add_child(a_butt)
						a_butt.display(a)
				"BottomLeft":
					for a in BattleData.player_weapon.bottom_left_strikes:
						var a_butt = ability_button.instantiate()
						ability_grid.add_child(a_butt)
						a_butt.display(a)
				"BottomRight":
					for a in BattleData.player_weapon.bottom_right_strikes:
						var a_butt = ability_button.instantiate()
						ability_grid.add_child(a_butt)
						a_butt.display(a)
		"Block":
					for a in BattleData.player_weapon.blocks:
						var a_butt = ability_button.instantiate()
						ability_grid.add_child(a_butt)
						a_butt.display(a)
		"Dodge":
					for a in BattleData.player_weapon.dodges:
						var a_butt = ability_button.instantiate()
						ability_grid.add_child(a_butt)
						a_butt.display(a)
