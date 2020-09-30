extends Area


func _ready():
	pass


func _on_Area_legenda_3_body_entered(body):
	if body.name == "Player_v4":
		get_tree().get_root().get_node("Map/Controler_map").start_legenda4()
		queue_free()
	
