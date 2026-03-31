extends Node

signal attack_ready(enemy)

@export var interval_min := 1.5
@export var interval_max := 2.5

var _timers := {}

func add_enemy(enemy) -> void:
	_timers[enemy] = 0.0
	attack_ready.emit(enemy)

func remove_enemy(enemy) -> void:
	_timers.erase(enemy)

func _process(delta) -> void:
	for enemy in _timers.keys():
		if not is_instance_valid(enemy):
			_timers.erase(enemy)
			continue

		_timers[enemy] += delta
		if _timers[enemy] >= randf_range(interval_min, interval_max):
			_timers[enemy] = 0.0
			attack_ready.emit(enemy)
