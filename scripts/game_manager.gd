extends Node2D


var currency := 20
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
	if(enemies_killed == enemys_to_kill):
		EndRound()
	
func RoundGoing() -> bool:
	return start_round and not end_round

func AddCurrency(amount: int) -> void:
	currency += amount
	
func SpendCurrency(amount: int) -> void:
	currency -= amount
	
func NewRound() -> void:
	new_round.emit()
	enemys_to_kill += 2
	end_round = false
	start_round = false
	for gnome in gnomes:
		gnome.queue_free()
	gnomes.clear()
	
func AddGnome(new_gnome: Node2D) -> void:
	gnomes.append(new_gnome)
	
