extends Area


func _ready():
	pass


var entrou = false
func _on_Area_body_entered(body):
	if body.name ==  "Player_hack" and !entrou:
		get_parent().get_parent().get_node(".").done_game()
		entrou = true
	
