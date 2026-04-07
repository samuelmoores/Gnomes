extends Control

@onready var button = $Play
@onready var button2 = $Quit
@onready var button3 = $Credits
@onready var label = $Label
@onready var play: Button = $Play
@onready var audio_stream_player_hover: AudioStreamPlayer2D = $"../../AudioStreamPlayerHover"
@onready var audio_stream_player_click: AudioStreamPlayer2D = $"../../AudioStreamPlayerClick"


# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Gnomes TD"
	button.text = "Play"
	button2.text = "Quit"
	button3.text = "Credits"
	
	label.add_theme_color_override("font_color", Color(0.854902, 0.439216, 0.839216, 1))
	
	button.add_theme_color_override("font_pressed_color", Color(0.854902, 0.439216, 0.839216, 1))
	button.add_theme_color_override("icon_hover_color", Color(0.854902, 0.439216, 0.839216, 1))
	
	button2.add_theme_color_override("font_pressed_color", Color(0.854902, 0.439216, 0.839216, 1))
	button2.add_theme_color_override("icon_hover_color", Color(0.854902, 0.439216, 0.839216, 1))
	
	button3.add_theme_color_override("font_pressed_color", Color(0.854902, 0.439216, 0.839216, 1))
	button3.add_theme_color_override("icon_hover_color", Color(0.854902, 0.439216, 0.839216, 1))
	
	
	


func _on_play_pressed():
	
	button.get_tree().change_scene_to_file("res://scenes/Level_01.tscn");
	pass # Replace with function body.


func _on_play_mouse_entered() -> void:
	audio_stream_player_hover.play()


func _on_quit_mouse_entered() -> void:
	audio_stream_player_hover.play()


func _on_credits_mouse_entered() -> void:
	audio_stream_player_hover.play()


func _on_play_button_down() -> void:
	audio_stream_player_click.play()
	


func _on_quit_button_down() -> void:
	audio_stream_player_click.play()


func _on_credits_button_down() -> void:
	audio_stream_player_click.play()
