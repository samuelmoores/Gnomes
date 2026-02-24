extends PathFollow2D

@export var speed := 100.0
@export var health := 1

var direction
var previous_position

func _ready() -> void:
	previous_position = global_position
	if has_node("Area2D"):
		$Area2D.body_entered.connect(_on_body_entered)

func _process(delta):
	progress += speed * delta
	var current_position = global_position
	direction = current_position - previous_position
	previous_position = current_position

func _on_body_entered(body: Node) -> void:
	# Attack object must be in "attack" group
	print("on body entered from: " + str(body.name))
	if body.is_in_group("attack"):
		health -= 1
		print("enemy hit - current health: " + str(health))
		if health <= 0:
			queue_free()
