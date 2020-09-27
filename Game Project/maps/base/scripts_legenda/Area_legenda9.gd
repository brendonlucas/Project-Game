extends Area

func _ready():
	pass 

func _on_Area_legenda9_body_entered(body):
	if body.name == "Player_v4":
		get_parent().get_node("Controler_map").start_legenda_nija()
		get_parent().get_node("limite_plane/Parede_bloqueio").disabled = false
		queue_free()
