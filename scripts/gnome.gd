extends Area2D

@onready var attackObject = preload("res://scenes/towers/AttackObject.tscn")
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var attack_timer = $AttackTimer
@onready var launcher = $ProjectileLauncher
@onready var range = $RangeDetector

@export var attack_interval := 1.5

var enemies_in_range := {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	range.enemy_entered.connect(_on_enemy_entered)
	range.enemy_exited.connect(_on_enemy_exited)
	attack_timer.attack_ready.connect(spawn_attack_for)

# when enemy enters gnomes attack range
func _on_enemy_entered(body):
	if not body.is_in_group("enemy"):
		return
	# Add enemy to tracking and start timer
	enemies_in_range[body] = true
	attack_timer.add_enemy(body)
	# Spawn first attack immediately
	call_deferred("spawn_attack_for", body)


func _on_enemy_exited(body):
	if enemies_in_range.has(body):
		enemies_in_range.erase(body)
		attack_timer.remove_enemy(body)

func _process(_delta: float) -> void:
	pass
	
func _on_attack_ready(body):
	spawn_attack_for(body)

func spawn_attack_for(enemy_body):
	launcher.launch(self, enemy_body)
	
func RemoveColissionSprite() -> void:
	sprite_2d.visible = false
	
