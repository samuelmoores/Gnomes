extends Node2D

@export var interval:= 0.1

@onready var range_detector = $RangeDetector
@onready var slow_aura = $SlowAura
@onready var sprite_2d: Sprite2D = $Sprite2D_Collision

func _ready() -> void:
	range_detector.enemy_entered.connect(slow_aura.apply_slow)
	range_detector.enemy_exited.connect(slow_aura.remove_slow)

func RemoveColissionSprite() -> void:
	sprite_2d.visible = false
