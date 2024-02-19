extends Resource

class_name Character

@export_category("Character Info")
@export var name: String
@export var max_hp: int = 25
@export var hp: int = 25
@export var weapon: Weapon
@export var defense: int = 1
@export var portrait: Texture2D
@export_enum("Top","TopLeft","TopRight","Bottom","BottomLeft","BottomRight") var stance = "Top"
@export_enum("None","Top","Bottom","Left","Right") var face = "None"
