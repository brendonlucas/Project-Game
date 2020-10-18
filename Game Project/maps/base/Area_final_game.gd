extends Area

func _ready():
	pass

func _on_Area_final_game_body_entered(body):
	if body.name == "Player_v4":
		get_parent().get_node("finalizacao/fim_1/fade/AnimationPlayer").play("fade")
		queue_free()

