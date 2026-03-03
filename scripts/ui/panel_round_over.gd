extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(GameManager.end_round):
		self.visible = true


func _on_button_button_down() -> void:
	self.visible = false
	GameManager.NewRound()
