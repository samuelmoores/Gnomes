extends PathFollow2D

@export var speed := 100.0

var direction
var previous_position

func _ready() -> void:
	previous_position = Vector2(0, 0)

func _process(delta):
	progress += speed * delta
	var current_position = global_position
	direction = current_position - previous_position
	previous_position = current_position
