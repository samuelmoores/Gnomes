extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D_Collision

func RemoveColissionSprite() -> void:
	sprite_2d.visible = false
