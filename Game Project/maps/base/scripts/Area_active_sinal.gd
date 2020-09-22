extends Area

var active = true
var entrou = false

func _ready():
	pass 

func set_active(option):
	active = option


func _on_Area_active_sinal_body_entered(body):
	if body.name == "Player_v4" and !entrou:
		entrou = true
		print("leo")
		get_tree().get_root().get_node("Map/HUD_UI").set_active_sinal()
		


func _on_Area_active_sinal_body_exited(body):
	if body.name == "Player_v4" and entrou:
		print("kk")
		get_tree().get_root().get_node("Map/HUD_UI").set_desative_sinal()
		entrou = false
