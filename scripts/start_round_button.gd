extends Button

@onready var audio_player: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@onready var audio_player_2: AudioStreamPlayer2D = $"../AudioStreamPlayer2D2"

func _on_pressed() -> void:
	audio_player.play()
	GameManager.StartRound()


func _on_mouse_entered() -> void:
	audio_player_2.play()
