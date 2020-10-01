extends Area

func _ready():
	pass 

func _on_Area_entrar_body_entered(body):
	if body.name == "Player_v4":
		get_tree().get_root().get_node("Map/animations").animation_entrar()
		queue_free()
