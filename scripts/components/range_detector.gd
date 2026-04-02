extends Area2D

signal enemy_entered(enemy)
signal enemy_exited(enemy)

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body) -> void:
	if body.is_in_group("enemy"):
		enemy_entered.emit(body)

func _on_body_exited(body) -> void:
	if body.is_in_group("enemy"):
		enemy_exited.emit(body)
