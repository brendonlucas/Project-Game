extends Area

func _ready():
	pass

func _on_Area_checkpoint_body_entered(body):
	if body.name == "Player_v4":
		print("askd")
		Gamestate.set_checkpoint()
		queue_free()

