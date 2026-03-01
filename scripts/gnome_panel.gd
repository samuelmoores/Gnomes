extends Panel

@onready var gnome = preload("res://scenes/gnome.tscn")

var num_gnomes = 0

func _on_gui_input(event: InputEvent) -> void:
	var newTower = gnome.instantiate()
	num_gnomes += 1

	# process new gnome
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(newTower)
		newTower.global_position = event.global_position
	elif event is InputEventMouseMotion and event.button_mask == 1:
		get_child(1).global_position = event.global_position
	if event is InputEventMouseButton and event.button_mask == 0:
		get_child(1).queue_free()
		var path = get_tree().get_root().get_node("Node2D/Gnomes")
		path.add_child(newTower)
		newTower.global_position = event.global_position
		
		if(num_gnomes > 0):
			self.visible = false
			return
		
