extends RigidBody2D

@export var launch_velocity := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 0.0
	linear_velocity = launch_velocity
	print("launch vel: " + str(linear_velocity))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
