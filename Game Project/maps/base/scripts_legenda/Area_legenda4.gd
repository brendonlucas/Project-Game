extends Area

func _ready():
	pass

func _on_Area_legenda4_body_entered(body):
	if body.name == "Player_v4":
		get_parent().get_node("Controler_map").start_legenda_gerador()
		queue_free()
