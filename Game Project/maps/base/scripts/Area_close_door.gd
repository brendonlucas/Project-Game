extends Area

var active

func _ready():
	pass 

func _on_Area_close_door_body_entered(body):
	if body.name == "Player_v4" and active:
		get_parent().get_parent().get_parent().get_node("saida/door_metal5").close_the_door()
