extends Area

var entrou = false

func _ready():
	pass 


func _on_Area_hit_body_entered(body):
	if body.name == "nija" and !entrou:
		print("entrou")
		entrou = true


func _on_Area_hit_body_exited(body):
	if body.name == "nija" and entrou:
		print("saiu")
		entrou = false
