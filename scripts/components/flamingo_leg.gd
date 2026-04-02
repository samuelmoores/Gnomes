extends Area2D

var enemies_in_range = []

func _on_body_entered(body) -> void:
	if body.is_in_group("enemy"):
		enemies_in_range.append(body)

func _on_body_exited(body) -> void:
	if body.is_in_group("enemy"):
		enemies_in_range.erase(body)
