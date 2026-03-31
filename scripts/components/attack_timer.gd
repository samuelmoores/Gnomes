extends Node

signal attack_ready(enemy)

var interval = self.get_parent().attack_interval
var _timers := {}

func add_enemy(enemy) -> void:
	_timers[enemy] = 0.0
	attack_ready.emit(enemy)

func remove_enemy(enemy) -> void:
	_timers.erase(enemy)

func _process(delta) -> void:
	for enemy in _timers.keys().duplicate():
		if not is_instance_valid(enemy):
			_timers.erase(enemy)
			continue

		_timers[enemy] += delta
		if _timers[enemy] >= interval:
			_timers[enemy] -= interval
			attack_ready.emit(enemy)
