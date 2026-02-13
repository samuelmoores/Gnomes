extends Area2D

@onready var attackObject = preload("res://AttackObject.tscn")
@onready var enemy = $"../Path2D/PathFollow2D"

var enemy_to_attack
var attack_objects = []
var timer
var direction = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	timer = 0.0

func _on_body_entered(body):
	enemy_to_attack = body
	spawn_attack()
	

func _on_body_exited(body):
	enemy_to_attack = null

func spawn_attack():
	attack_objects.append(attackObject.instantiate())
	get_parent().add_child(attack_objects.back())
	direction.append((enemy_to_attack.global_position + enemy.direction * 500) - global_position)
	print(enemy.direction * 200)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer = timer + delta
		
	for i in range(attack_objects.size()):
		attack_objects[i].global_position += direction[i] * delta * 3
	
	if enemy_to_attack != null:
		
		if timer > 2.0:
			spawn_attack()
			timer = 0.0
			
