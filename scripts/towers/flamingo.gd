extends Node2D

@export var interval:= 1.5

@onready var range_detector = $RangeDetector
@onready var attack_timer = $AttackTimer
@onready var flamingo_launcher = $FlamingoLauncher
@onready var sprite_2d: Sprite2D = $Sprite2D_Collision


func _ready() -> void:
	range_detector.enemy_entered.connect(attack_timer.add_enemy)
	range_detector.enemy_exited.connect(attack_timer.remove_enemy)
	attack_timer.attack_ready.connect(flamingo_launcher.launch)

func RemoveColissionSprite() -> void:
	sprite_2d.visible = false
