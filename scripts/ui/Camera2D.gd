extends Camera2D

@export var speed: float = 400
@onready var c2d = $Camera2D

# Called when the node enters the scene tree for the first time.
#func _ready():
	#c2d.is_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	position += direction.normalized() * speed * delta
