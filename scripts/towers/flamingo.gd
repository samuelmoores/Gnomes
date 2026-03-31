extends Node2D

@onready var range_detector = $RangeDetector
@onready var slow_aura = $SlowAura

func _ready() -> void:
	range_detector.enemy_entered.connect(slow_aura.apply_slow)
	range_detector.enemy_exited.connect(slow_aura.remove_slow)
