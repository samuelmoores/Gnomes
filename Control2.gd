extends Control

@onready var label = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "HP"
	label.add_theme_color_override("font_color", Color(0.854902, 0.439216, 0.839216, 1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
