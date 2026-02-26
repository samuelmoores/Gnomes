extends CharacterBody2D

@export var health := 1.0

func take_damage() -> void:
	# Attack object must be in "attack" group
	print("pre take damage: " + str(health))
	health -= 0.25
	print("post take damage: " + str(health))
	if health <= 0:
		queue_free()
