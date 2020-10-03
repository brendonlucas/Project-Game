extends Spatial

func _ready():
	pass

func up_speed_ataque():
	pass

func done_game():
	Gamestate.map_loading = "res://maps/Map_limpo.tscn"
#	get_tree().change_scene("res://maps/Load Map/Loading_scene.tscn")
	get_tree().change_scene("res://maps/Map_limpo.tscn")
#	BackgroundLoad.load_scene("")
	pass
	
func passs():
	BackgroundLoad.load_scene("res://maps/Map_limpo.tscn")
