extends Node

signal attack_ready(enemy)

@onready var interval = self.get_parent().interval

var timer = interval
var enemies_in_range:= []

func add_enemy(enemy) -> void:
	enemies_in_range.append(enemy)
	if timer >= interval:
		timer -= interval
		attack_ready.emit(enemies_in_range[0])
	

func remove_enemy(enemy) -> void:
	enemies_in_range.erase(enemy)

func _process(delta) -> void: 
	for enemy in enemies_in_range.duplicate():
		if not is_instance_valid(enemy):
			enemies_in_range.erase(enemy)
			continue

	if timer < interval:
		timer += delta
	if len(enemies_in_range) > 0:
		if timer >= interval:
			enemies_in_range.sort_custom(func(a, b):
				var a_progress = a.get_parent().progress_ratio
				var b_progress = b.get_parent().progress_ratio
				return a_progress > b_progress)
				
			timer -= interval
			attack_ready.emit(enemies_in_range[0])
