extends Node

@export var miss_chance := 0.0

@onready var attack_range = $"../Area2D"
@onready var speed = 500
var target : CharacterBody2D

func _process(delta):
	if not is_instance_valid(target):
		return
		
	var path_follow = target.get_parent()
	var enemy_dir = path_follow.get("direction")
	if enemy_dir == null:
		enemy_dir = Vector2.ZERO
	var target_position = target.global_position + enemy_dir * 15.0
	get_parent().global_position = get_parent().global_position.move_toward(target_position, speed * delta)

func enemy_in_arc(enemy):
	var to_enemy = enemy.global_position - get_parent().global_position
	
	var forward = Vector2.DOWN.rotated(get_parent().global_rotation)
	var angle_to_enemy = forward.angle_to(to_enemy.normalized())
	return abs(rad_to_deg(angle_to_enemy)) <= 22.5

func launch(enemy_body) -> void:
	if not is_instance_valid(enemy_body):
		return
	if randf() < miss_chance:
		return

	target = enemy_body
	if target in attack_range.get_overlapping_bodies():
		if enemy_in_arc(target):
			var path_follow = target.get_parent()
			var enemy_dir = path_follow.get("direction")
			if enemy_dir == null:
				enemy_dir = Vector2.ZERO

			var target_position = target.global_position + enemy_dir * 15.0
			var dir = (target_position - owner.global_position).normalized()
			self.get_parent().set("rotation", dir.angle() - deg_to_rad(90))
			
			target.take_damage()
