extends Area

func _ready():
	pass


func _on_Area_teleporte_body_entered(body):
	if body.name == "Player_v4":
		get_node("fade/AnimationPlayer").play("fade")
		
func teleport():
	get_tree().get_root().get_node("Map/Player_v4").translation = get_tree().get_root().get_node("Map/re_spawn").translation
