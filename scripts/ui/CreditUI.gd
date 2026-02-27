extends Control

@onready var label = $Label
@onready var label2 = $Label2
@onready var label3 = $Label3
@onready var label4 = $Label4
@onready var label5 = $Label5
@onready var label6 = $Label6
@onready var label7 = $Label7

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Isaiah Pone"
	label2.text = "Samuel Moores"
	label3.text = "Cameron Hill"
	label4.text = "Carter Murray"
	label5.text = "Alexander Danielson"
	label6.text = "Allison Adoum"
	label7.text = "Bailey Cokley"
	
	label.add_theme_color_override("font_color", Color(0.854902, 0.439216, 0.839216, 1))
	label2.add_theme_color_override("font_color", Color(0.854902, 0.439216, 0.839216, 1))
	label3.add_theme_color_override("font_color", Color(0.854902, 0.439216, 0.839216, 1))
	label4.add_theme_color_override("font_color", Color(0.854902, 0.439216, 0.839216, 1))
	label5.add_theme_color_override("font_color", Color(0.854902, 0.439216, 0.839216, 1))
	label6.add_theme_color_override("font_color", Color(0.854902, 0.439216, 0.839216, 1))
	label7.add_theme_color_override("font_color", Color(0.854902, 0.439216, 0.839216, 1))
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
