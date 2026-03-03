extends Node

@export var enemy_scene: PackedScene = preload("res://scenes/enemies/Enemy.tscn")
@export var spawn_interval_min := 1.0
@export var spawn_interval_max := 3.0
@export var max_enemies := 0

var _timer := 0.0
var _next_spawn_in := 0.0
var curr_round = 1
var enemy_count = 0

func _ready() -> void:
	max_enemies = GameManager.enemys_to_kill
	GameManager.new_round.connect(reset_enemy_count)
	

func _process(delta: float) -> void:
	
	_timer += delta
	if _timer >= _next_spawn_in and GameManager.RoundGoing() and enemy_count < GameManager.enemys_to_kill:
		_timer = 0.0
		_next_spawn_in = randf_range(spawn_interval_min, spawn_interval_max)
		spawn_enemy()

func spawn_enemy() -> void:
	var path = get_parent()
	if not path is Path2D:
		return

	var enemy = enemy_scene.instantiate()
	enemy_count += 1
	path.add_child(enemy)
	
func reset_enemy_count() -> void:
	enemy_count = 0
