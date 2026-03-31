extends Node

@export var slow_factor := 0.5

func apply_slow(enemy) -> void:
	if enemy.has_method("set_speed_multiplier"):
		enemy.set_speed_multiplier(slow_factor)

func remove_slow(enemy) -> void:
	if enemy.has_method("set_speed_multiplier"):
		enemy.set_speed_multiplier(1.0)
