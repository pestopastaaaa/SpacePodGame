extends Area2D


func _on_Ladder_body_entered(body):
	if body.is_in_group("Climber"):
		if body.climbing == false:
			body.climbing = true
	pass
	
func _on_Ladder_body_exited(body):
	if body.is_in_group("Climber"):
		if body.climbing:
			body.climbing = false
	pass

