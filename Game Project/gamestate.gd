extends Node

var name_scene_change

var deletar = 0
var in_mine_game = false

var dado :int = 0
var camera_sensibilidade :float = 0.3
var type_shadow_mode = 0
var view_distance = 100
var grass_dencidade = 1

# exp variaveis
var nivel : int
var exp_total : int
var exp_atual : int
var a = {'1': 1000,'2': 1500, '3': 2500,
 '4':3000,'5': 3500,'6': 4000,'7':5000,
'8':6000,'9':7000,'10':0}
var exp_active

var text_atual = 1
var executando_legenda = false
var legenda_executando = 0


var legenda
var text_in_execution
var timer
var legenda_label

var game1 = preload("res://maps/mine_games/game_map_1.tscn")
var game2 = preload("res://maps/mine_games/game_map_2.tscn")
var game3 = preload("res://maps/mine_games/game_map_3.tscn")

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

func done_game():
	if solicitante_minigame == "gerador_1":
		gerador_1 = true
	if solicitante_minigame == "gerador_2":
		gerador_2 = true
	if solicitante_minigame == "elevador_1":
		elevador_1 = true
	if solicitante_minigame == "elevador_2":
		elevador_2 = true
		
func _ready():
	
	fade_final = get_tree().get_root().get_node_or_null("Map/fade_final/AnimationPlayer")
	player = get_tree().get_root().get_node_or_null("Map/Player_v4")
	player_nave = get_tree().get_root().get_node_or_null("Map/Player_nave")
	cam = get_tree().get_root().get_node_or_null("Map/target")
	#var nodess = get_tree().get_root().get_node_or_null("cena 1")
	legenda = get_tree().get_root().get_node_or_null("Map/legendas")
	timer = get_tree().get_root().get_node_or_null("Map/legendas/Timer")
	legenda_label = get_tree().get_root().get_node_or_null("Map/legendas/text/Label")

var cam_atual = 1

# teste de mudança de camera do jato ()game parte 1

func _process(delta):
	pass
	# a ser removido teste de chamada da instancia de minigame
	#print(solicitante_minigame)
		
func instancia_game(solicitante):
	player.block_moviments(false)
	cam.block_cam(false)
	Gamestate.in_mine_game = true
	instancia_objetos()
	drop_game_test = 1
	solicitante_minigame = solicitante
	
func drop_game():
	var game_teste = get_node_or_null("map_game")
	game_teste.queue_free()
	player.block_moviments(true)
	cam.block_cam(true)
	Gamestate.in_mine_game = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	drop_game_test = 0
	
	if solicitante_minigame == "gerador_1":
		get_tree().get_root().get_node("Map/galpao/Generator/Area").set_active(false)
	elif solicitante_minigame == "gerador_2":
		get_tree().get_root().get_node("Map/galpao/Generator2/Area").set_active(false)
	
# controle de experiencia optida
func add_exp(xp_value):
	#Salvar_BD: nivel/ exp total / exp restante / exp nivel atual
	if nivel < 10:
		exp_active = false
		var exp_prox_nivel : int = a[str(nivel)]
		var exp_restante = a[str(nivel)] - exp_atual
		
		if exp_restante < xp_value:
			print("entrou na sobra")
			var sobra_exp = xp_value - exp_restante
			var exp_usada = xp_value - sobra_exp
			exp_total += exp_usada
			exp_atual += exp_usada
			print(exp_usada)
			print(sobra_exp)
			
			if exp_atual >= exp_prox_nivel and nivel < 10:
				nivel += 1
				exp_atual = 0
			add_exp(sobra_exp)
		else:
			print("foi normal")
			exp_total += xp_value
			exp_atual += xp_value
			
			if exp_atual >= exp_prox_nivel and nivel < 10:
				nivel += 1
				exp_atual = 0
	
		exp_restante = a[str(nivel)] - exp_atual
		#label_exp_total.set_text(str(exp_total))
		#label_nivel.set_text(str(nivel))
		#label_exp_nivel_atual.set_text(str(exp_atual))
		#label_exp_restante.set_text(str(exp_restante))

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
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(clone)
	#clone.translation = novo_lugar
	
var localizacao_prox_agua = 0
var delete_agua = 1

# instanciar agua
func instanciar_agua():
	var clone = plane_agua.instance()
	var scene_root = get_tree().root.get_children()[1]
	scene_root.add_child(clone)
	localizacao_prox_agua += -13000
	clone.translation = Vector3(0,0,localizacao_prox_agua)
	if delete_agua == 1:
		clone.name = "agua1"
		delete_agua = 2
		return
	elif delete_agua == 2:
		clone.name = "agua"
		delete_agua = 1
		return
		
		
	
	
	
	
