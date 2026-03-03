extends Node2D


var currency_total := 50
var currency_earned = 0
var start_round = false
var end_round = false
var enemys_to_kill = 4
var enemies_killed = 0
var gnomes = []
signal new_round
var garden_health = 100

func StartRound() -> void:
	start_round = true
	
func EndRound() -> void:
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
	
	if(currency_total <= 0):
		print("you loose")
		return
	
	new_round.emit()
	currency_earned = 0
	enemies_killed = 0
	enemys_to_kill += 2
	end_round = false
	start_round = false
	for gnome in gnomes:
		gnome.queue_free()
	gnomes.clear()
	
func AddGnome(new_gnome: Node2D) -> void:
	gnomes.append(new_gnome)
	
func DamageGarden() -> void:
	garden_health -= 10
	
