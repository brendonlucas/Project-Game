extends Node

var name_scene_change

var deletar = 0
var in_mine_game = false

var dado :int = 0
var camera_sensibilidade :float = 0.3
var type_shadow_mode = 0
var view_distance = 100
var grass_dencidade = 1

var ativar_menu = true

var game1 = preload("res://maps/mine_games/game_map_1.tscn")
var game2 = preload("res://maps/mine_games/game_map_2.tscn")
var game3 = preload("res://maps/mine_games/game_map_3.tscn")

var hack_nija = preload("res://maps/mine_games/game_map_hack.tscn")

var cam_turrent = preload("res://player/nave/turret.tscn")
var cam_normal = preload("res://player/nave/target.tscn")

var plane_agua = preload("res://props/agua/agua.tscn")

var drop_game_test = 0

var cam
var player
var player_nave
var fade_final

var elevador_1 = false
var elevador_2 = false
var gerador_1 = false
var gerador_2 = false
var solicitante_minigame = ""

var map_loading = ""
var final_game

var checkpoint_local

func reset_dados_game():
	elevador_1 = false
	elevador_2 = false
	gerador_1 = false
	gerador_2 = false
	final_game = null
	checkpoint_local = null
	PlayerStatus.reset_dados()
	solicitante_minigame = ""
	drop_game_test = 0
	in_mine_game = false
	
func set_checkpoint():
	PlayerStatus.set_point()
	var player = get_tree().get_root().get_node_or_null("Map/Player_v4")
	if player:
		checkpoint_local = player.translation
		
func load_checkpoint():
	PlayerStatus.load_points()
	var player = get_tree().get_root().get_node_or_null("Map/Player_v4")
	if player:
		get_tree().get_root().get_node_or_null("Map/Player_v4/AnimationPlayer").play("idle")
		player.translation = checkpoint_local
	reset_all_enemys()
	get_tree().get_root().get_node("Map/HUD_UI").update_values()


	
func reset_all_enemys():
	var pilar = get_tree().get_root().get_node_or_null("Map/pilar_enemys/cube_enemy")
	var sentinela = get_tree().get_root().get_node_or_null("Map/BolvankaRobotCA")
	if pilar:
		get_tree().get_root().get_node_or_null("Map/pilar_enemys").reset()
	if sentinela:
		get_tree().get_root().get_node_or_null("Map/BolvankaRobotCA").reset()
	var nija = get_tree().get_root().get_node_or_null("Map/nija")
	if nija:
		get_tree().get_root().get_node_or_null("Map/nija").reset()

func boss_kill():
	get_tree().get_root().get_node("Map/target/AnimationPlayer").play("tremer")
	get_tree().get_root().get_node("Map/limbo/curva/Area_close_door").set_active(false)
	
func set_music_battle():
	get_tree().get_root().get_node("Map/bg_map").stream = load("res://audio/bg_battle.ogg")
	get_tree().get_root().get_node("Map/bg_map").play()

func set_music_map():
	get_tree().get_root().get_node("Map/Controler_map").set_music_map()
	get_tree().get_root().get_node("Map/bg_map").play()
	pass

func done_game():
	if solicitante_minigame == "gerador_1":
		gerador_1 = true
		get_tree().get_root().get_node("Map/galpao/Generator/Area").queue_free()
		get_tree().get_root().get_node("Map/galpao/Light_refletor").show()
	if solicitante_minigame == "gerador_2":
		gerador_2 = true
		get_tree().get_root().get_node("Map/galpao/Generator2/Area").queue_free()
		get_tree().get_root().get_node("Map/galpao/Light_refletor2").show()
	if solicitante_minigame == "elevador_1":
		elevador_1 = true
		get_tree().get_root().get_node("Map/Controler_map").start_legenda_elevador_1()
		get_tree().get_root().get_node("Map/builds_2/central_1/Area_active_elevador").queue_free()
		get_tree().get_root().get_node("Map/builds_2/elevador/capsula/door_elevator").set_active(true)
		
	if solicitante_minigame == "elevador_2":
		elevador_2 = true
		get_tree().get_root().get_node("Map/builds_3/Central_2/Area_active_elevador").queue_free()
		get_tree().get_root().get_node("Map/builds_3/elevador2/capsula/door_elevator").set_active(true)
	
	elif solicitante_minigame == "hack_nija":
		get_tree().get_root().get_node("Map/limite_plane/Parede_bloqueio").disabled = true
		get_tree().get_root().get_node("Map/limbo/curva/Area_close_door").set_active(false)
		get_tree().get_root().get_node("Map/target/AnimationPlayer").play("tremer")
		get_tree().get_root().get_node("Map/Controler_map").start_legenda_base_alerta()
		get_tree().get_root().get_node("Map/Area_legenda6").active = true
		PlayerStatus.add_exp(7000)
		Gamestate.ativar_menu = true
		get_tree().get_root().get_node("Map/HUD_UI").show()
		
	elif solicitante_minigame == "torre_1":
		get_tree().get_root().get_node("Map/bloqueio").queue_free()
		get_tree().get_root().get_node("Map/Controler_map").start_legenda5()
		get_tree().get_root().get_node("Map/bloqueio_combate/AnimationDrop").play("drop")
		 
	elif solicitante_minigame == "torre_2":
		get_tree().get_root().get_node("Map/SM_Console_Fellming/MeshInstance").queue_free()
		
	elif solicitante_minigame == "elevador_base":
		get_tree().get_root().get_node("Map/animations/Animation_open_gate").play("open_gate")
		
		
	var game = get_tree().get_root().get_node("Map/map_game")
	game.queue_free()
	get_tree().get_root().get_node_or_null("Map/Player_v4").block_moviments(true)
	get_tree().get_root().get_node_or_null("Map/target").block_cam(true)
	Gamestate.in_mine_game = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	drop_game_test = 0
		
func _ready():
	fade_final = get_tree().get_root().get_node_or_null("Map/fade_final/AnimationPlayer")
	player = get_tree().get_root().get_node_or_null("Map/Player_v4")
	player_nave = get_tree().get_root().get_node_or_null("Map/Player_nave")
	cam = get_tree().get_root().get_node_or_null("Map/target")

var cam_atual = 1

func _process(delta):
	pass
		
func instancia_game(solicitante):
	get_tree().get_root().get_node_or_null("Map/Player_v4").block_moviments(false)
	get_tree().get_root().get_node_or_null("Map/target").block_cam(false)
	get_tree().get_root().get_node("Map/Player_v4/UI/interact_label").set_visible(false)
	Gamestate.in_mine_game = true
	if solicitante != "hack_nija":
		instancia_objetos()
	else:
		instance_hack_nija()
	drop_game_test = 1
	solicitante_minigame = solicitante
	
func instance_hack_nija():
	var clone = hack_nija.instance()
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(clone)
	
func drop_game():
	var game_teste = get_node_or_null("map_game")
	game_teste.queue_free()
	get_tree().get_root().get_node_or_null("Map/Player_v4").block_moviments(true)
	get_tree().get_root().get_node_or_null("Map/target").block_cam(true)
	Gamestate.in_mine_game = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	drop_game_test = 0
	
	if solicitante_minigame == "gerador_1":
		get_tree().get_root().get_node("Map/galpao/Generator/Area").set_active(false)
	elif solicitante_minigame == "gerador_2":
		get_tree().get_root().get_node("Map/galpao/Generator2/Area").set_active(false)
	elif solicitante_minigame == "elevador_1":
		get_tree().get_root().get_node("Map/builds_2/central_1/Area_active_elevador").set_active(false)
	elif solicitante_minigame == "elevador_2":
		get_tree().get_root().get_node("Map/builds_3/Central_2/Area_active_elevador").set_active(false)
	elif solicitante_minigame == "torre_2":
		get_tree().get_root().get_node("Map/SM_Console_Fellming3/Area_active_painel").set_active(false)
	elif solicitante_minigame == "torre_1":
		get_tree().get_root().get_node("Map/SM_Console_Fellming2/Area_active_torre").set_active(false)
	elif solicitante_minigame == "elevador_base":
		get_tree().get_root().get_node("Map/SM_Console_Fellming/Area_painel").set_active(false)
	
func randomNumber():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(1, 3)
	return my_random_number

#teste instanciar mine game hacker
func instancia_objetos():
	var nun = 1 #randomNumber()
	var mini_game
	if nun == 1:
		mini_game = game1
	elif nun == 2:
		mini_game = game2
	elif nun == 3:
		mini_game = game3
		
	var clone = mini_game.instance()
#	var scene_root = get_tree().root.get_children()[0]
	var scene_root = get_tree().get_root().get_node("Map")
	scene_root.add_child(clone)
	#clone.translation = novo_lugar
	
#var localizacao_prox_agua = 0
#var delete_agua = 1
#
## instanciar agua
#func instanciar_agua():
#	var clone = plane_agua.instance()
#	var scene_root = get_tree().root.get_children()[1]
#	scene_root.add_child(clone)
#	localizacao_prox_agua += -13000
#	clone.translation = Vector3(0,0,localizacao_prox_agua)
#	if delete_agua == 1:
#		clone.name = "agua1"
#		delete_agua = 2
#		return
#	elif delete_agua == 2:
#		clone.name = "agua"
#		delete_agua = 1
#		return
#
