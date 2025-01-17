extends Area

func _ready():
	pass

func _on_Area_target_body_entered(body):
	if body.name == "Player_v4" and get_tree().get_root().get_node_or_null("Map/pilar_enemys/cube_enemy"):
		
		var nucleo = get_tree().get_root().get_node("Map/pilar_enemys/cube_enemy/nucleo/MeshInstance/colision_nucleo")
		get_tree().get_root().get_node_or_null("Map/hp_enemy").set_values(nucleo.vida, nucleo.vida_maxima)
		get_tree().get_root().get_node_or_null("Map/hp_enemy").set_name("Núcleo")
		get_tree().get_root().get_node_or_null("Map/hp_enemy").show()
		get_tree().get_root().get_node_or_null("Map/hp_enemy/pilar_hp").show()
		
		Gamestate.set_music_battle()
		get_parent().get_node("pilar/esfera/gun").target = body
		#get_parent().get_node("pilar").ativo = true
		get_parent().get_node("pilar2/esfera/gun").target = body
		get_parent().get_node("pilar3/esfera/gun").target = body
		get_parent().get_node("pilar4/esfera/gun").target = body
	
		get_parent().get_node("pilar").ativo = true
		get_parent().get_node("pilar2").ativo = true
		get_parent().get_node("pilar3").ativo = true
		get_parent().get_node("pilar4").ativo = true
		
func _on_Area_target_body_exited(body):
	
	if body.name == "Player_v4" and get_tree().get_root().get_node_or_null("Map/pilar_enemys/cube_enemy"):
		get_tree().get_root().get_node_or_null("Map/hp_enemy").hide()
		get_tree().get_root().get_node_or_null("Map/hp_enemy/pilar_hp").hide()
		Gamestate.set_music_map()
		get_parent().get_node("pilar/esfera/gun").target = null
		get_parent().get_node("pilar2/esfera/gun").target = null
		get_parent().get_node("pilar3/esfera/gun").target = null
		get_parent().get_node("pilar4/esfera/gun").target = null
		
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
	
