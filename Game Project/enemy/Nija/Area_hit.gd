extends Area

var entrou = false

func _ready():
	pass 


func _on_Area_hit_body_entered(body):
	if body.name == "Player_v4" and !entrou:
		print("entrou no player")
		entrou = true


func _on_Area_hit_body_exited(body):
	if body.name == "Player_v4" and entrou:
		print("saiu do player")
		entrou = false
