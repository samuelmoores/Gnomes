extends Panel

@export var tower_scene: PackedScene
@export var tower_price: int = 30

@onready var audio_player: AudioStreamPlayer2D = $"../../../AudioStreamPlayer2D"
@onready var audio_stream_player_2d_2: AudioStreamPlayer2D = $"../../../AudioStreamPlayer2D2"
@onready var price_label: Label = $PriceLabel

var tower_placing = false
var active_tower = null
var active_tower_valid = false
var active_invalid_reason = ""

const PATH_BLOCK_RADIUS := 80.0
const TOWER_OVERLAP_RADIUS := 90.0

func _ready() -> void:
	GameManager.new_round.connect(reset)
	price_label.text = str(tower_price)

func reset() -> void:
	self.visible = true

func _on_gui_input(event: InputEvent) -> void:
	if GameManager.currency_total < tower_price and not tower_placing:
		return

	if event is InputEventMouseButton and event.button_mask == 1:
		tower_placing = true

		active_tower = tower_scene.instantiate()
		add_child(active_tower)
		active_tower.global_position = event.global_position
		_update_active_tower_preview(event.global_position)
		audio_stream_player_2d_2.play()
	elif event is InputEventMouseMotion and event.button_mask == 1:
		if active_tower:
			active_tower.global_position = event.global_position
			_update_active_tower_preview(event.global_position)
	if event is InputEventMouseButton and event.button_mask == 0:
		if not active_tower:
			return
		tower_placing = false
		
		if not active_tower_valid:
			get_tree().call_group("hud", "show_placement_reason", "Invalid placement: %s" % active_invalid_reason, false)
			active_tower.queue_free()
			active_tower = null
			return
		
		if not GameManager.SpendCurrency(tower_price):
			active_tower.queue_free()
			active_tower = null
			tower_placing = false
			return

		remove_child(active_tower)
		var path = get_tree().get_root().get_node("Node2D/Gnomes")
		path.add_child(active_tower)
		audio_player.play()
		active_tower.global_position = event.global_position
		active_tower.RemoveColissionSprite()

		GameManager.AddTower(active_tower)
		get_tree().call_group("hud", "clear_placement_reason")
		active_tower = null
		active_tower_valid = false
		active_invalid_reason = ""

		if GameManager.currency_total <= 0:
			self.visible = false
			return

func _update_active_tower_preview(pos: Vector2) -> void:
	if not active_tower:
		return

	var result = _validate_placement(pos)
	active_tower_valid = result["valid"]
	active_invalid_reason = result["reason"]

	var collision_sprite = active_tower.get_node_or_null("Sprite2D_Collision")
	if collision_sprite:
		if active_tower_valid:
			collision_sprite.modulate = Color(0.35, 1.0, 0.35, 0.45)
		else:
			collision_sprite.modulate = Color(1.0, 0.35, 0.35, 0.45)

	if active_tower_valid:
		get_tree().call_group("hud", "clear_placement_reason")
	else:
		get_tree().call_group("hud", "show_placement_reason", "Invalid placement: %s" % active_invalid_reason, false)

func _validate_placement(pos: Vector2) -> Dictionary:
	var tile_map = get_tree().get_root().get_node_or_null("Node2D/TileMapLayer")
	if tile_map:
		var local_pos = tile_map.to_local(pos)
		var map_pos = tile_map.local_to_map(local_pos)
		if not tile_map.get_used_rect().has_point(map_pos):
			return {"valid": false, "reason": "blocked"}

	var path_2d = get_tree().get_root().get_node_or_null("Node2D/Path2D")
	if path_2d and path_2d.curve:
		var local_to_path = path_2d.to_local(pos)
		var closest = path_2d.curve.get_closest_point(local_to_path)
		if closest.distance_to(local_to_path) < PATH_BLOCK_RADIUS:
			return {"valid": false, "reason": "path"}

	var tower_parent = get_tree().get_root().get_node_or_null("Node2D/Gnomes")
	if tower_parent:
		for tower in tower_parent.get_children():
			if tower is Node2D and tower.global_position.distance_to(pos) < TOWER_OVERLAP_RADIUS:
				return {"valid": false, "reason": "occupied"}

	return {"valid": true, "reason": ""}
