extends Node

@export var miss_chance := 0

@onready var leg = $"../FlamingoLeg"
@onready var leg_area = $"../FlamingoLeg/Area2D"
@onready var attack_timer = $"../AttackTimer"


func launch(enemy_body):
	if not is_instance_valid(enemy_body):
		return
	if randf() < miss_chance:
		return
		
	var dir = (enemy_body.global_position - self.get_parent().global_position).normalized()
	self.get_parent().rotation = dir.angle() - deg_to_rad(90)
	leg.visible = true
	
	for enemy in attack_timer.enemies_in_range:
		if leg_area.enemies_in_range.has(enemy):
			enemy.take_damage()
	await get_tree().create_timer(0.5).timeout
	leg.visible = false
