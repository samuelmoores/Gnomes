extends Control

@onready var button = $Button
@onready var button2 = $Button2
@onready var button3 = $Button3
@onready var label = $Label


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
	

# Nothing
#func _on_button_pressed():
	#label.text = "Button Pressed!"

#func _ready2():
	#hud_label.text = "Score: 0"

# Nothing
#func _on_button_2_pressed():
	#label.text = "Button Pressed2!"
