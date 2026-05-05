extends CharacterBody2D

@onready var health_bar = $Node2D

var health

func _ready():
	var enemy_data = $"../Data"
	health = enemy_data.health

func take_damage() -> void:
	# Attack object must be in "attack" group
	health -= 1
	if health <= 0:
		GameManager.AddCurrency(10)
		GameManager.EnemyKilled()
		queue_free()
	else:
		health_bar.Decrease()
		
func set_speed_multiplier(mult):
	get_parent().speed_multiplier = mult
