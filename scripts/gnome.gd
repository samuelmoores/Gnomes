extends Area2D

@onready var attackObject = preload("res://AttackObject.tscn")

@export var attack_speed_min := 3.00
@export var attack_speed_max := 4.0
@export var attack_interval_min := 1.5
@export var attack_interval_max := 2.5
@export_range(0.0, 1.0) var attack_miss_chance := 0.0

var enemies_in_range = []
var enemy_timers = []
var enemy_attack_intervals = []
var attack_objects = []
var attack_speeds = []
var direction = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	enemies_in_range.append(body)
	enemy_timers.append(0.0)
	enemy_attack_intervals.append(randf_range(attack_interval_min, attack_interval_max))
	spawn_attack_for(body)


func _on_body_exited(body):
	var idx = enemies_in_range.find(body)
	if idx >= 0:
		enemies_in_range.remove_at(idx)
		enemy_timers.remove_at(idx)
		enemy_attack_intervals.remove_at(idx)

func spawn_attack_for(enemy_body):
	if randf() < attack_miss_chance:
		return

	var path_follow = enemy_body.get_parent()
	var enemy_dir = path_follow.get("direction")
	if enemy_dir == null:
		enemy_dir = Vector2.ZERO
	attack_objects.append(attackObject.instantiate())
	get_parent().add_child(attack_objects.back())
	direction.append((enemy_body.global_position + enemy_dir * 5) - global_position)
	print(enemy_body.global_position)
	attack_speeds.append(randf_range(attack_speed_min, attack_speed_max))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in range(attack_objects.size()):
		attack_objects[i].global_position += direction[i] * delta * attack_speeds[i]

	for i in range(enemies_in_range.size()):
		enemy_timers[i] += delta
		if enemy_timers[i] > enemy_attack_intervals[i]:
			spawn_attack_for(enemies_in_range[i])
			enemy_timers[i] = 0.0
				
			
