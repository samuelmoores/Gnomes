extends PathFollow2D

@export var default_speed := 100.0
var current_speed := default_speed
var speed_multiplier := 1.0


var direction
var previous_position

func _ready() -> void:
	previous_position = global_position


func _process(delta):
	progress += current_speed * delta * speed_multiplier
	var current_position = global_position
	direction = current_position - previous_position
	previous_position = current_position
	
