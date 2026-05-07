extends Control

@onready var button = $Play
@onready var button2 = $Level_Select
@onready var button3 = $Quit
@onready var button4 = $Credits
@onready var label = $Label
@onready var play: Button = $Play
@onready var audio_stream_player_hover: AudioStreamPlayer2D = $"../../AudioStreamPlayerHover"
@onready var audio_stream_player_click: AudioStreamPlayer2D = $"../../AudioStreamPlayerClick"
@onready var level = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Gnomes TD"
	
	label.add_theme_color_override("font_color", Color(0.854902, 0.439216, 0.839216, 1))
	
	button.add_theme_color_override("font_pressed_color", Color(0.854902, 0.439216, 0.839216, 1))
	button.add_theme_color_override("icon_hover_color", Color(0.854902, 0.439216, 0.839216, 1))
	
	button2.add_theme_color_override("font_pressed_color", Color(0.854902, 0.439216, 0.839216, 1))
	button2.add_theme_color_override("icon_hover_color", Color(0.854902, 0.439216, 0.839216, 1))
	
	button3.add_theme_color_override("font_pressed_color", Color(0.854902, 0.439216, 0.839216, 1))
	button3.add_theme_color_override("icon_hover_color", Color(0.854902, 0.439216, 0.839216, 1))
	
	button4.add_theme_color_override("font_pressed_color", Color(0.854902, 0.439216, 0.839216, 1))
	button4.add_theme_color_override("icon_hover_color", Color(0.854902, 0.439216, 0.839216, 1))
	
	
	


func _on_play_pressed():
	if level == 0:
		button.get_tree().change_scene_to_file("res://scenes/Level_01.tscn")
	elif level == 1:
		button.get_tree().change_scene_to_file("res://scenes/Level_02.tscn")
	elif level == 2:
		button.get_tree().change_scene_to_file("res://scenes/Level_03.tscn")
		
func _on_level_select_pressed():
	level = (level + 1) % 3
	
	if level == 0:
		button2.text = "EASY"
	elif level == 1:
		button2.text = "MEDIUM"
	elif level == 2:
		button2.text = "HARD"

func _on_play_mouse_entered() -> void:
	audio_stream_player_hover.play()
	
func _on_level_select_mouse_entered() -> void:
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
