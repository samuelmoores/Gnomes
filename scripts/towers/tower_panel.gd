extends Panel

@export var tower_scene: PackedScene
@export var tower_price: int = 30

@onready var audio_player: AudioStreamPlayer2D = $"../../AudioStreamPlayer2D"
@onready var audio_stream_player_2d_2: AudioStreamPlayer2D = $"../../AudioStreamPlayer2D2"
@onready var price_label: Label = $PriceLabel

var tower_placing = false
var active_tower = null

func _ready() -> void:
	GameManager.new_round.connect(reset)
	price_label.text = str(tower_price)

func reset() -> void:
	self.visible = true

func _on_gui_input(event: InputEvent) -> void:
	if GameManager.currency_total < tower_price and not tower_placing:
		return

	if event is InputEventMouseButton and event.button_mask == 1:
		GameManager.SpendCurrency(tower_price)
		tower_placing = true

		active_tower = tower_scene.instantiate()
		add_child(active_tower)
		active_tower.global_position = event.global_position
		audio_stream_player_2d_2.play()
	elif event is InputEventMouseMotion and event.button_mask == 1:
		if active_tower:
			active_tower.global_position = event.global_position
	if event is InputEventMouseButton and event.button_mask == 0:
		if not active_tower:
			return
		tower_placing = false
		remove_child(active_tower)
		var path = get_tree().get_root().get_node("Node2D/Gnomes")
		path.add_child(active_tower)
		audio_player.play()
		active_tower.global_position = event.global_position
		active_tower.RemoveColissionSprite()

		GameManager.AddTower(active_tower)
		active_tower = null

		if GameManager.currency_total <= 0:
			self.visible = false
			return
