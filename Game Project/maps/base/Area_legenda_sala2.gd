extends Area

func _ready():
	pass

func _on_Area_legenda_sala2_body_entered(body):
	if body.name == "Player_v4":
		get_parent().get_node("Controler_map").start_legenda3()
		queue_free()
