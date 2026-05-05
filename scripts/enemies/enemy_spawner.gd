extends Node

@export var basic_enemy: PackedScene = preload("res://scenes/enemies/basic_enemy.tscn")
@export var tanky_enemy: PackedScene = preload("res://scenes/enemies/tanky_enemy.tscn")
@export var fast_enemy: PackedScene = preload("res://scenes/enemies/fast_enemy.tscn")
@export var swicther: PackedScene = preload("res://scenes/enemies/swicther.tscn")
@export var spawn_interval_min := 1.0
@export var spawn_interval_max := 3.0
@export var max_enemies := 0
@onready var rounds = $Rounds

var _timer := 0.0
var _next_spawn_in := 0.0
var curr_round = 1
var curr_enemy = 0
var enemy_count = 0

func _ready() -> void:
	max_enemies = len(rounds.rounds[0])
	GameManager.new_round.connect(reset_enemy_count)
	

func _process(delta: float) -> void:
	if GameManager.RoundGoing():
		_timer += delta
		if _timer >= _next_spawn_in and enemy_count < max_enemies:
			_timer -= _next_spawn_in
			_next_spawn_in = rounds.rounds[curr_round - 1][curr_enemy][1]
			spawn_enemy(rounds.rounds[curr_round - 1][curr_enemy][0])
			curr_enemy += 1

func spawn_enemy(enemy_type) -> void:
	var path = get_parent()
	if not path is Path2D:
		return
	var enemy

	if enemy_type == "basic":
		enemy = basic_enemy.instantiate()
	elif enemy_type == "tanky":
		enemy = tanky_enemy.instantiate()
	elif enemy_type == "fast":
		enemy = fast_enemy.instantiate()
	elif enemy_type == "swicther":
		enemy = swicther.instantiate()
	enemy_count += 1
	path.add_child(enemy)
	
func reset_enemy_count() -> void:
	enemy_count = 0
	curr_round += 1
	curr_enemy = 0
