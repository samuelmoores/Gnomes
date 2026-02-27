extends CharacterBody2D

@export var health := 1.0
@onready var health_bar = $Node2D

func take_damage() -> void:
	# Attack object must be in "attack" group
	health -= 0.25
	if health <= 0:
		GameManager.AddCurrency(10)
		queue_free()
	else:
		health_bar.Decrease()
