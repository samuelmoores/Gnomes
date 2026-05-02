extends Node

@export var miss_chance := 0

@onready var leg = $"../FlamingoLeg"
@onready var attack_timer = $"../AttackTimer"
@onready var range_detector = $"../RangeDetector"

var enemies_in_range = []

func _ready():
	range_detector.enemy_entered.connect(_on_enemy_entered)
	range_detector.enemy_exited.connect(_on_enemy_exited)
	
func _on_enemy_entered(enemy):
	enemies_in_range.append(enemy)
	
func _on_enemy_exited(enemy):
	enemies_in_range.erase(enemy)
	
func enemy_in_arc(enemy):
	var to_enemy = enemy.global_position - get_parent().global_position
	
	var forward = Vector2.DOWN.rotated(get_parent().global_rotation)
	var angle_to_enemy = forward.angle_to(to_enemy.normalized())
	return abs(rad_to_deg(angle_to_enemy)) <= 45

func launch(enemy_body):
	var dir = (enemy_body.global_position - self.get_parent().global_position).normalized()
	get_parent().rotation = dir.angle() - deg_to_rad(90)
	leg.visible = true
	
	for enemy in enemies_in_range:
		if not is_instance_valid(enemy_body):
			return
		if randf() < miss_chance:
			return
			
		if enemy_in_arc(enemy):
			enemy.take_damage()
	await get_tree().create_timer(0.5).timeout
	leg.visible = false
