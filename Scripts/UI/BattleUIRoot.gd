extends CanvasLayer

#### Inputs#########
@export var ability_bar_scene: PackedScene
@onready var action_bar = $MarginContainer/UIVContainer/BarContainer/ActionBar
@onready var bar_container = $MarginContainer/UIVContainer/BarContainer
@onready var cancel_button = $MarginContainer/UIVContainer/ButtonContainer/CancelButton
@onready var accept_button = $MarginContainer/UIVContainer/ButtonContainer/AcceptButton
#############################################
#### HP BARS #########
@onready var player_hp_bar = $MarginContainer/UIVContainer/HPContainer/PlayerHP
@onready var player_name_label = $MarginContainer/UIVContainer/HPContainer/PlayerHP/PlayerNameLabel
@onready var enemy_hp_bar = $MarginContainer/UIVContainer/HPContainer/EnemyHP
@onready var enemy_name_label = $MarginContainer/UIVContainer/HPContainer/EnemyHP/EnemyNameLabel
##############################
#### Fight Indicator #########
@onready var stance_indicator = $MarginContainer/FightIndicatorContainer/StanceIndicator
@onready var strike_indicator = $MarginContainer/FightIndicatorContainer/StrikeIndicator
@onready var stance_label = $MarginContainer/FightIndicatorContainer/MarginContainer/StanceLabel
@onready var strike_label = $MarginContainer/FightIndicatorContainer/MarginContainer/StrikeLabel


var ability_bar: PanelContainer

func _ready():
	GlobalSignals.EndTurn.connect(update_display)
	update_display()
	enemy_name_label.text = BattleData.enemy.name
	player_name_label.text = BattleData.player.name

func display_abilities(action):
	cancel_button.disabled = false
	if ability_bar != null:
		ability_bar.queue_free()
	ability_bar = ability_bar_scene.instantiate()
	bar_container.add_child(ability_bar)
	ability_bar.display(action)

func update_hp_bars():
	enemy_hp_bar.max_value = BattleData.enemy.max_hp
	enemy_hp_bar.value = BattleData.enemy.hp
	player_hp_bar.max_value = BattleData.player.max_hp
	player_hp_bar.value = BattleData.player.hp
	

func update_fight_indicator():
	stance_indicator.update_stance_display()
	stance_label.text ="Stance: " + BattleData.stance
	strike_indicator.clear()

func update_strike_indicator():
	strike_indicator.update_strike_display()


func update_display():
	update_hp_bars()
	update_fight_indicator()


@warning_ignore("unused_parameter")
func _process(delta):
	if BattleData.selected_ability != null:
		accept_button.disabled = false
	else:
		accept_button.disabled = true


func _on_strike_pressed():
	display_abilities("Strike")


func _on_block_pressed():
	display_abilities("Block")




func _on_dodge_pressed():
	display_abilities("Dodge")


func _on_cancel_button_pressed():
	cancel_button.disabled = true
	ability_bar.queue_free()
	BattleData.selected_ability = null
	$MarginContainer/UIVContainer/ButtonContainer/CancelButton/SFX.play()

func _on_accept_button_pressed():
	cancel_button.disabled = true
	accept_button.disabled = true
	ability_bar.queue_free()
	BattleData.player_action = BattleData.selected_ability
	BattleData.selected_ability = null
