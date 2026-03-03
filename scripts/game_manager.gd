extends Node2D


var currency_total := 20
var currency_earned = 0
var start_round = false
var end_round = false
var enemys_to_kill = 4
var enemies_killed = 0
var gnomes = []
signal new_round

func StartRound() -> void:
	start_round = true
	
func EndRound() -> void:
	end_round = true
	
func EnemyKilled() -> void:
	enemies_killed += 1
	print("enemykilled() enemies to kill: " + str(enemys_to_kill))
	if(enemies_killed == enemys_to_kill):
		EndRound()
	
func RoundGoing() -> bool:
	return start_round and not end_round

func AddCurrency(amount: int) -> void:
	currency_earned += amount
	
func SpendCurrency(amount: int) -> void:
	currency_total -= amount
	
func NewRound() -> void:
	new_round.emit()
	currency_total += currency_earned
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
	
