extends CanvasLayer

var countdown_label: Label
var incoming_label: Label
var incoming_icons: HBoxContainer
var placement_label: Label
var enemy_icon: Texture2D = preload("res://art/Aphid1.png")

func _ready() -> void:
	add_to_group("hud")
	_build_wave_ui()
	_build_placement_ui()
	_connect_signals()

func _build_wave_ui() -> void:
	# "Wave X incoming" label
	incoming_label = Label.new()
	incoming_label.position = Vector2(640 - 100, 550)
	incoming_label.size = Vector2(200, 40)
	incoming_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	incoming_label.add_theme_font_size_override("font_size", 28)
	add_child(incoming_label)

	# Enemy icons container
	incoming_icons = HBoxContainer.new()
	incoming_icons.position = Vector2(640 - 60, 595)
	incoming_icons.add_theme_constant_override("separation", 8)
	add_child(incoming_icons)

	for _i in range(3):
		var icon = TextureRect.new()
		icon.custom_minimum_size = Vector2(32, 32)
		icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		icon.texture = enemy_icon
		incoming_icons.add_child(icon)

	# Countdown label
	countdown_label = Label.new()
	countdown_label.position = Vector2(640 - 100, 630)
	countdown_label.size = Vector2(200, 40)
	countdown_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	countdown_label.add_theme_font_size_override("font_size", 30)
	add_child(countdown_label)

	_update_wave_display()

func _build_placement_ui() -> void:
	placement_label = Label.new()
	placement_label.position = Vector2(4, 200)
	placement_label.size = Vector2(402, 106)
	placement_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	placement_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	placement_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	placement_label.max_lines_visible = 2
	placement_label.add_theme_font_size_override("font_size", 24)
	placement_label.modulate = Color(1.0, 0.55, 0.55)
	var towers_panel = get_node_or_null("TextureRect_Towers")
	if towers_panel:
		towers_panel.add_child(placement_label)
	else:
		add_child(placement_label)

func _connect_signals() -> void:
	GameManager.countdown_updated.connect(_on_countdown_updated)
	GameManager.round_started.connect(_on_round_started)
	GameManager.new_round.connect(_on_new_round)

func _update_wave_display() -> void:
	incoming_label.text = "Wave %d incoming" % GameManager.current_wave
	# Show 2-3 icons based on wave number
	var icon_count = 2 if GameManager.current_wave < 3 else 3
	for i in range(incoming_icons.get_child_count()):
		incoming_icons.get_child(i).visible = i < icon_count

func _on_countdown_updated(seconds_left: int) -> void:
	countdown_label.text = "Wave starts in %ds" % seconds_left

func _on_round_started(_wave: int) -> void:
	countdown_label.text = ""

func _on_new_round() -> void:
	_update_wave_display()

func show_placement_reason(reason: String, is_valid: bool) -> void:
	if is_valid:
		placement_label.text = ""
		return

	placement_label.text = reason
	placement_label.modulate = Color(1.0, 0.55, 0.55)

func clear_placement_reason() -> void:
	placement_label.text = ""
