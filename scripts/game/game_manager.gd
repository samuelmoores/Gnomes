extends Node2D

var currency_total := 50
var currency_earned = 0
var start_round = false
var end_round = false
var enemys_to_kill = 4
var enemies_killed = 0
var towers = []
signal new_round
signal round_started(wave: int)
signal countdown_updated(seconds_left: int)
var garden_health = 100
var game_over = false
var round_countdown_active = false
var current_wave := 1

func StartRound() -> void:
	if start_round or end_round or game_over or round_countdown_active:
		return

	round_countdown_active = true
	for seconds_left in [3, 2, 1]:
		countdown_updated.emit(seconds_left)
		await get_tree().create_timer(1.0).timeout

	round_countdown_active = false
	start_round = true
	round_started.emit(current_wave)
	
func EndRound() -> void:
	if currency_total + currency_earned < 30:
		game_over = true
	else:
		end_round = true
	
func EnemyKilled() -> void:
	enemies_killed += 1
	if(enemies_killed == enemys_to_kill):
		EndRound()
	
func RoundGoing() -> bool:
	return start_round and not end_round

func AddCurrency(amount: int) -> void:
	currency_earned += amount
	
func SpendCurrency(amount: int) -> bool:
	if(currency_total >= amount):
		currency_total -= amount
		return true
	else:
		return false
		
	
func NewRound() -> void:
	currency_total += currency_earned
	end_round = false
	start_round = false
	current_wave += 1
	
	if currency_total <= 0 or garden_health <= 0 or currency_total < 30:
		game_over = true
		return
	
	new_round.emit()
	currency_earned = 0
	enemies_killed = 0
	enemys_to_kill += 2
	for tower in towers:
		tower.queue_free()
	towers.clear()

func AddTower(new_tower: Node2D) -> void:
	towers.append(new_tower)
	
func DamageGarden() -> void:
	if garden_health >= 10:
		garden_health -= 10
	else:
		GameManager.game_over = true
	

func Restart() -> void:
	currency_total = 50
	currency_earned = 0
	start_round = false
	end_round = false
	current_wave = 1
	enemys_to_kill = 4
	enemies_killed = 0
	garden_health = 100
	game_over = false
	for tower in towers:
		if is_instance_valid(tower):
			tower.queue_free()
	towers.clear()
	new_round.emit()
