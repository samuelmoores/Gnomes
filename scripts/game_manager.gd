extends Node2D

var currency := 20
var start_round = false

func StartRound() -> void:
	start_round = true
	
func RoundGoing() -> bool:
	return start_round

func AddCurrency(amount: int) -> void:
	currency += amount
	
func SpendCurrency(amount: int) -> void:
	currency -= amount
