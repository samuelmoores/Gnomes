extends Area2D

@onready var attackObject = preload("res://scenes/AttackObject.tscn")

@export var attack_speed_min := 500.0
@export var attack_speed_max := 600.0
@export var attack_interval_min := 1.5
@export var attack_interval_max := 2.5
@export_range(0.0, 1.0) var attack_miss_chance := 0.0

var enemies_in_range := {}
var enemy_timers := {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

# when enemy enters gnomes attack range
func _on_body_entered(body):
	if not body.is_in_group("enemy"):
		return
	# Add enemy to tracking and start timer
	enemies_in_range[body] = true
	enemy_timers[body] = 0.0
	# Spawn first attack immediately
	call_deferred("spawn_attack_for", body)


func _on_body_exited(body):
	if enemies_in_range.has(body):
		enemies_in_range.erase(body)
		enemy_timers.erase(body)

func _process(delta: float) -> void:
	# Update timers for all enemies in range and spawn attacks when interval is reached
	for enemy in enemies_in_range.keys():
		if not is_instance_valid(enemy):
			enemies_in_range.erase(enemy)
			enemy_timers.erase(enemy)
			continue
		
		enemy_timers[enemy] += delta
		var interval = randf_range(attack_interval_min, attack_interval_max)
		
		if enemy_timers[enemy] >= interval:
			call_deferred("spawn_attack_for", enemy)
			enemy_timers[enemy] = 0.0

func spawn_attack_for(enemy_body):
	if randf() < attack_miss_chance:
		return

	var path_follow = enemy_body.get_parent()
	var enemy_dir = path_follow.get("direction")
	if enemy_dir == null:
		enemy_dir = Vector2.ZERO

	print(str(enemy_dir))
	var projectile = attackObject.instantiate()

	# Start projectile at the gnome's position
	projectile.global_position = global_position

	# Aim slightly ahead of the enemy using its movement direction
	var target_position = enemy_body.global_position + enemy_dir * 15.0
	var dir = (target_position - global_position).normalized()
	var speed = randf_range(attack_speed_min, attack_speed_max)

	# Configure rigidbody-style projectile movement # use whatever your child node is named
	projectile.set("launch_velocity", dir * speed)
	get_parent().add_child(projectile)
