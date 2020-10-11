extends Area

func _ready():
	pass

func _on_Area_target_body_entered(body):
	if body.name == "Player_v4":
		Gamestate.set_music_battle()
		get_parent().get_node("pilar").ativo = true
		get_parent().get_node("pilar2").ativo = true
		get_parent().get_node("pilar3").ativo = true
		get_parent().get_node("pilar4").ativo = true
	

func _on_Area_target_body_exited(body):
	if body.name == "Player_v4":
		Gamestate.set_music_map()
		get_parent().get_node("pilar").ativo = false
		get_parent().get_node("pilar2").ativo = false
		get_parent().get_node("pilar3").ativo = false
		get_parent().get_node("pilar4").ativo = false
		
		get_parent().get_node("pilar/Timer_reload").stop() 
		get_parent().get_node("pilar/Timer_reload").wait_time = 20 
		get_parent().get_node("pilar").estado_gun = false 
		
		get_parent().get_node("pilar2/Timer_reload").stop() 
		get_parent().get_node("pilar2/Timer_reload").wait_time = 20
		get_parent().get_node("pilar2").estado_gun = false
		
		get_parent().get_node("pilar3/Timer_reload").stop() 
		get_parent().get_node("pilar3/Timer_reload").wait_time = 20
		get_parent().get_node("pilar3/").estado_gun = false
		
		get_parent().get_node("pilar4/Timer_reload").stop() 
		get_parent().get_node("pilar4/Timer_reload").wait_time = 20 
		get_parent().get_node("pilar4").estado_gun = false
	
