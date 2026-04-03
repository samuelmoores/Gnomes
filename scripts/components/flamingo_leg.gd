extends Area2D

@onready var enemies_in_range = []

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body) -> void:
	if body.is_in_group("enemy"):
		enemies_in_range.append(body)

func _on_body_exited(body) -> void:
	if body.is_in_group("enemy"):
		enemies_in_range.erase(body)
