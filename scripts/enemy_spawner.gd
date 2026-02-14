extends Node

@export var enemy_scene: PackedScene = preload("res://Enemy.tscn")
@export var spawn_interval_min := 1.0
@export var spawn_interval_max := 3.0
@export var max_enemies := 10

var _timer := 0.0
var _next_spawn_in := 0.0


func _ready() -> void:
	_next_spawn_in = randf_range(spawn_interval_min, spawn_interval_max)


func _process(delta: float) -> void:
	_timer += delta
	if _timer >= _next_spawn_in:
		_timer = 0.0
		_next_spawn_in = randf_range(spawn_interval_min, spawn_interval_max)
		spawn_enemy()


func spawn_enemy() -> void:
	if enemy_scene == null:
		return

	var path = get_parent()
	if not path is Path2D:
		return

	var enemy_count = 0
	for c in path.get_children():
		if c is PathFollow2D:
			enemy_count += 1
	if enemy_count >= max_enemies:
		return

	var enemy = enemy_scene.instantiate()
	path.add_child(enemy)
