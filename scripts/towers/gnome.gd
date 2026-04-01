extends Node2D

@onready var range_detector = $RangeDetector
@onready var attack_timer = $AttackTimer
@onready var rock_launcher = $RockLauncher
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	range_detector.enemy_entered.connect(attack_timer.add_enemy)
	range_detector.enemy_exited.connect(attack_timer.remove_enemy)
	attack_timer.attack_ready.connect(rock_launcher.launch)

func RemoveColissionSprite() -> void:
	sprite_2d.visible = false
