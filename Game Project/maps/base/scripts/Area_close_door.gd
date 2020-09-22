extends Area

var active = true

func _ready():
	pass 

func _on_Area_close_door_body_entered(body):
	if body.name == "Player_v4" and !active:
		get_parent().get_parent().get_parent().get_node("galpao/door_metal5/AnimationPlayer").play("close")
		get_parent().get_parent().get_parent().get_node("saida/door_metal3/AnimationPlayer").play("open")
		
		active = false

func set_active(option):
	active = option
