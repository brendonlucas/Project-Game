extends ColorRect


func _ready():
	pass 

func load_game():
	get_tree().paused = false
	Gamestate.load_checkpoint()
