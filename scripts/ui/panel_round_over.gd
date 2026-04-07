extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GameManager.end_round and not GameManager.game_won:
		self.visible = true
	else:
		self.visible = false


func _on_button_button_down() -> void:
	self.visible = false
	if GameManager.current_level >= GameManager.level_scenes.size():
		GameManager.game_won = true
	else:
		GameManager.NewRound()
