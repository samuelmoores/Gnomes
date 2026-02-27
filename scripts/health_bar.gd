extends Node2D

@onready var array = [$HBoxContainer/TextureRect, $HBoxContainer/TextureRect2, $HBoxContainer/TextureRect3, $HBoxContainer/TextureRect4]

func Decrease() -> void:
	if(array.size() > 0):
		array.back().visible = false
		array.pop_back()
