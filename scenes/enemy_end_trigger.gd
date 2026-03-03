extends Area2D

var enemies_survived = 0

func _on_body_entered(_body: Node2D) -> void:
	enemies_survived += 1
	GameManager.DamageGarden()
	var killed = GameManager.enemies_killed
	var to_kill = GameManager.enemys_to_kill
	
	print("enmies_survived: " + str(enemies_survived))
	print("kill diference: " + str(to_kill - killed))
	
	if enemies_survived == (to_kill - killed):
		GameManager.EndRound()
		enemies_survived = 0
