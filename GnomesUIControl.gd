extends Node2D

@onready var cd2 = $Camera2D
@onready var cd22 = $Camera2D2

func _physics_process(deltal: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if cd2.is_current():
			cd22.make_current()
		else:
			cd2.make_current()
