extends Node2D

@onready var range_detector = $RangeDetector
@onready var slow_aura = $SlowAura
@onready var slow_aura_collision = $Sprite2D_Collision


func _ready() -> void:
	range_detector.enemy_entered.connect(slow_aura.apply_slow)
	range_detector.enemy_exited.connect(slow_aura.remove_slow)

func RemoveColissionSprite() -> void:
	slow_aura_collision.visible = false
