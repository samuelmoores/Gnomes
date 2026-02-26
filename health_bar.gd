extends Node2D

@onready var array = [$HBoxContainer/TextureRect1, $HBoxContainer/TextureRect2, $HBoxContainer/TextureRect3, $HBoxContainer/TextureRect4]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func Decrease() -> void:
	if(array.size() > 0):
		array.back().visible = false
		array.pop_back()
		print(str(array.size()))
