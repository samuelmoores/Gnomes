extends Area2D

@export var health := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	print("signal set for enemy")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node) -> void:
	# Attack object must be in "attack" group
	print("on body entered from: " + str(body.name))
	if body.is_in_group("attack"):
		health -= 1
		print("enemy hit - current health: " + str(health))
		if health <= 0:
			queue_free()
