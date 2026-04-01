extends Node

@export var projectile_scene: PackedScene
@export var speed := 500.0
@export var miss_chance := 0.0

func launch(enemy_body) -> void:
	if not is_instance_valid(enemy_body):
		return
	if randf() < miss_chance:
		return

	var path_follow = enemy_body.get_parent()
	var enemy_dir = path_follow.get("direction")
	if enemy_dir == null:
		enemy_dir = Vector2.ZERO

	var projectile = projectile_scene.instantiate()
	projectile.global_position = owner.global_position

	var target_position = enemy_body.global_position + enemy_dir * 15.0
	var dir = (target_position - owner.global_position).normalized()
	projectile.set("launch_velocity", dir * speed)
	self.get_parent().set("rotation", dir.angle() - deg_to_rad(90))

	owner.get_parent().add_child(projectile)
