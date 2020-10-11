extends Node

var legenda
var timer
var legenda_label

var executou = false
var executou2 = false

var executando_legenda = false
var text_in_execution
var text_atual = 1
var legenda_executando = 0
var part1 = {'1':{"text":"Maldito virus.", "duracao":2,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{"text":"Sempre atrapalhando nas missôes.", "duracao":3,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part2 = {'1':{'text':'Talvez este seja o local de da missão.','duracao': 4, 'audio':"res://audio/falas/p1/p1a7.wav"},
'2':{"text":"É melhor dá uma olhada na ilha em busca de algo.", "duracao":4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part3 = {'1':{'text':'Que estruturas estranhas. Talvez encontre algo.','duracao': 4, 'audio':"res://audio/falas/p1/p1a7.wav"}}
var part4 = {'1':{'text':'Que interessante. Um painel de controle.', "duracao": 2,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'Se eu conseguisse invadir-lo, talvez descobriria para que serve.', "duracao": 3,"audio":"res://audio/falas/p1/p1a7.wav"},
'3':{'text':'Mas estou captando alguns sinais bloqueando o painel.', "duracao": 3,"audio":"res://audio/falas/p1/p1a7.wav"},
'4':{'text':'Tenho que procurar-los.', "duracao": 1,"audio":"res://audio/falas/p1/p1a7.wav"}}

var part5 = {'1':{'text':'Um já foi, falta mais um.', "duracao": 2,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part6 = {'1':{'text':'Os dois já foram. Agora devo conseguir conectar ao painel.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}

var part7 = {'1':{'text':'Droga... mais uma sentinela.', "duracao": 2,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part8 = {'1':{'text':'Pronto acho q agora não irão mais aparecer.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part9 = {'1':{'text':'Vamos la.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}



var player

func _ready():
	player = get_tree().get_root().get_node_or_null("Map/Player_v4")
	legenda = get_tree().get_root().get_node_or_null("Map/legendas")
	timer = get_tree().get_root().get_node_or_null("Map/legendas/Timer")
	legenda_label = get_tree().get_root().get_node_or_null("Map/legendas/text/Label")

func _process(delta):
	if executando_legenda:
		aplly_text()
		
func set_music_map():
	get_parent().get_node("bg_map").stream = load("res://audio/gb_2.ogg")

func set_dados_legenda(execution_text, text_info, audio):
	executando_legenda = true
	text_in_execution = execution_text
	text_atual = 1
	
	if text_info == 1:
		legenda_executando = 1
		text_in_execution = part1
	elif text_info == 2:
		legenda_executando = 2
		text_in_execution = part2
	elif text_info == 3:
		legenda_executando = 3
		text_in_execution = part3
	elif text_info == 4:
		legenda_executando = 4
		text_in_execution = part4
	elif text_info == 5:
		legenda_executando = 5
		text_in_execution = part5
	elif text_info == 6:
		legenda_executando = 6
		text_in_execution = part6
	elif text_info == 7:
		legenda_executando = 7
		text_in_execution = part7
	elif text_info == 8:
		legenda_executando = 8
		text_in_execution = part8
	elif text_info == 9:
		legenda_executando = 9
		text_in_execution = part9
	
	
		
func aplly_text():
	legenda.show()
	if text_atual > text_in_execution.size() and timer.time_left == 0:
		executando_legenda = false
		legenda.hide()
		if legenda_executando == 1:
			pass
		elif legenda_executando == 2:
			pass
		elif legenda_executando == 3:
			pass
		return
		
	if timer.time_left == 0:
		timer.wait_time = 5
		var audio = get_tree().get_root().get_node_or_null("Map/som_vozes")
		audio.stream = load(text_in_execution[str(text_atual)]['audio'])
		timer.wait_time = text_in_execution[str(text_atual)]['duracao']
		audio.play()
		if legenda_executando == 1 and text_atual == 1:
			pass

		legenda_label.set_text(text_in_execution[str(text_atual)]['text'])
		text_atual += 1
		timer.start()

func start_legenda1():
	set_dados_legenda(1, 1, true)

func start_legenda2():
	set_dados_legenda(2, 2, true)
	
func start_legenda3():
	set_dados_legenda(3, 3, true)
	
func start_legenda4():
	set_dados_legenda(4, 4, true)
	
func start_legenda5():
	set_dados_legenda(5, 5, true)



	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		BackgroundLoad.load_scene("res://maps/map_sistema/Map_sistema.tscn")

func change_map():
	BackgroundLoad.load_scene("res://maps/base/base.tscn")

func kill_sentinela():
	get_parent().get_node("ST_Tower2/escudo/AnimationRemove").play("drop")
