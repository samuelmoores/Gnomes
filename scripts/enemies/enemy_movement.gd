extends PathFollow2D


var speed_multiplier := 1.0

var current_speed
var direction
var previous_position

func _ready() -> void:
	previous_position = global_position
	var enemy_data = get_node_or_null("Data")
	current_speed = enemy_data.speed
	print(current_speed)


func _process(delta):
	progress += current_speed * delta * speed_multiplier
	var current_position = global_position
	direction = current_position - previous_position
	previous_position = current_position
	
