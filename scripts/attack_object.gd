extends RigidBody2D

@export var launch_velocity := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 1
	body_entered.connect(_on_body_entered)
	gravity_scale = 0.0
	linear_velocity = launch_velocity

func _on_body_entered(body: CharacterBody2D):
	
	body.take_damage()
	queue_free()
