extends Button

@onready var audio_player: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@onready var audio_player_2: AudioStreamPlayer2D = $"../AudioStreamPlayer2D2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	audio_player.play()
	GameManager.StartRound()


func _on_mouse_entered() -> void:
	audio_player_2.play()
