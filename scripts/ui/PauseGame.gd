extends Control

@onready var resume = $resume
@onready var quit = $quit
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	resume.text = "Resume Game"
	quit.text = "Quit Game"
	label.text = "Pause"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_resume_pressed():
	
	pass # Replace with function body.


func _on_quit_pressed():
	
	pass # Replace with function body.
