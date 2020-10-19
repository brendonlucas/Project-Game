extends Area

func _ready():
	pass

func _process(delta):
	pass

func _on_Area_body_entered(body):
	if body.name == "Player_hack":
		get_parent().get_parent().get_node("complete_game/complete_label/AnimationPlayer").play("complete")
		queue_free()
