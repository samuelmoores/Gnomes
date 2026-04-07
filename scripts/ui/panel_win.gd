extends TextureRect


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	if GameManager.game_won:
		self.visible = true
	else:
		self.visible = false


func _on_button_button_down() -> void:
	GameManager.Restart()
