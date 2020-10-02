extends Area

func _ready():
	pass # Replace with function body.

func _on_Area_body_entered(body):
	if body.name == "Player_v4":
		var mesh = get_tree().get_root().get_node_or_null("Map/Player_v4/Armature")
		mesh.hide()


func _on_Area_body_exited(body):
	if body.name == "Player_v4":
		var mesh = get_tree().get_root().get_node_or_null("Map/Player_v4/Armature")
		mesh.show()
