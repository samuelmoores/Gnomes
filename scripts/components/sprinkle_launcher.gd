extends Node

@export var speed := 500.0
@export var miss_chance := 0.0

@onready var attack_timer = $"../AttackTimer"

func launch(_enemy_body) -> void:
	if randf() < miss_chance:
		return

	#TODO: add projectile
	"""var projectile = projectile_scene.instantiate()
	projectile.global_position = owner.global_position
	owner.get_parent().add_child.call_deferred(projectile)"""

	for enemy in attack_timer.enemies_in_range:
		enemy.take_damage()
