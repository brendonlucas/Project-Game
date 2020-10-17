extends Control

var scene_path_sair
var scene_change
var menu_pause_active = false
var menu_2_active = false
var player
var cam

var sun
var option_sombra
var sensibilidade
var v_distance
var d_grass


func _ready():
	Gamestate.ativar_menu = true
	get_tree().paused = false
	set_options_grafcs()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	sun = get_tree().get_root().get_node_or_null("Map/Sol")
	option_sombra = get_node_or_null("Menu_2/ColorRect/Sombra/OptionButton")
	sensibilidade = get_node_or_null("Menu_2/ColorRect/Sensibilidade/HSlider")
	v_distance = get_node_or_null("Menu_2/ColorRect/Distancia/HSlider_v_distance")
	d_grass = get_node_or_null("Menu_2/ColorRect/Densidade_grama/HSlider_d_grass")
	
	var option_sombra = get_node_or_null("Menu_2/ColorRect/sombra/OptionButton")
	
func _process(delta):
	pass
		
func _on_Button_sair_pressed():
	get_tree().quit()
#	scene_change = "res://Menu_pausa/teste.tscn"
#	$FadeIn.show()
#	$FadeIn.fade_in()
	
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_change)

func _on_Button_opcoes_pressed():
	if menu_2_active:
		menu_2_active = false
		$Menu_2.hide()
		update_options()
	elif !menu_2_active:
		menu_2_active = true
		update_options()
		$Menu_2.show()

func _on_Button_start_pressed():
	hide()
	BackgroundLoad.load_scene("res://maps/Map_limpo.tscn")
	
func set_options_grafcs():
	var sun_map = get_tree().get_root().get_node_or_null("Map/Sol")
	var grass_map = get_tree().get_root().get_node_or_null("Map/HTerrain/HTerrainDetailLayer")
	
	sun_map.set_shadow_mode(Gamestate.type_shadow_mode)
	if Gamestate.type_shadow_mode == 0:
		sun_map.directional_shadow_normal_bias = 3
	else:
		sun_map.directional_shadow_normal_bias = 0.8
	
	if grass_map != null:
		grass_map.view_distance = Gamestate.view_distance
		grass_map.density = Gamestate.grass_dencidade

func update_options():
	option_sombra.select(Gamestate.type_shadow_mode)
	$Menu_2/ColorRect/Sensibilidade/HSlider.value = Gamestate.camera_sensibilidade
	$Menu_2/ColorRect/Sensibilidade/Label_sensi.set_text(str(Gamestate.camera_sensibilidade))
	$Menu_2/ColorRect/Distancia/HSlider_v_distance.value = Gamestate.view_distance
	$Menu_2/ColorRect/Distancia/Label_v_distance.set_text(str(Gamestate.view_distance))
	$Menu_2/ColorRect/Densidade_grama/HSlider_d_grass.value = Gamestate.grass_dencidade
	$Menu_2/ColorRect/Densidade_grama/Label2.set_text(str(Gamestate.grass_dencidade))
	
func _on_Button_aplicar_pressed():
	var sun = get_tree().get_root().get_node_or_null("Map/Sol")
	# var env = get_tree().get_root().get_node_or_null("Map/WorldEnvironment")
	var terrain_grass = get_tree().get_root().get_node_or_null("Map/HTerrain/HTerrainDetailLayer")
	var option_sombra = get_node("Menu_2/ColorRect/Sombra/OptionButton").selected
	Gamestate.type_shadow_mode = option_sombra
	Gamestate.camera_sensibilidade = sensibilidade.value
	Gamestate.view_distance = v_distance.value
	Gamestate.grass_dencidade = d_grass.value
	sun.set_shadow_mode(option_sombra)
	if terrain_grass != null:
		terrain_grass.view_distance = Gamestate.view_distance
		terrain_grass.density = Gamestate.grass_dencidade

func _on_HSlider_value_changed(value):
	$Menu_2/ColorRect/Sensibilidade/Label_sensi.set_text(str($Menu_2/ColorRect/Sensibilidade/HSlider.value)) 

func _on_HSlider_v_distance_value_changed(value):
	$Menu_2/ColorRect/Distancia/Label_v_distance.set_text(str($Menu_2/ColorRect/Distancia/HSlider_v_distance.value))

func _on_HSlider_d_grass_value_changed(value):
	$Menu_2/ColorRect/Densidade_grama/Label2.set_text(str($Menu_2/ColorRect/Densidade_grama/HSlider_d_grass.value))
