extends Node2D

var currency_total := 50
var currency_earned = 0
var start_round = false
var end_round = false
var enemys_to_kill = 4
var enemies_killed = 0
var towers = []
signal new_round
var garden_health = 100
var game_over = false

func StartRound() -> void:
	start_round = true
	
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
	
	if currency_total <= 0 or garden_health <= 0 or currency_total < 30:
		game_over = true
		return
	
	new_round.emit()
	currency_earned = 0
	enemies_killed = 0
	enemys_to_kill += 2
	end_round = false
	start_round = false
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
	enemys_to_kill = 4
	enemies_killed = 0
	garden_health = 100
	game_over = false
	for tower in towers:
		tower.queue_free()
	towers.clear()
	new_round.emit()
