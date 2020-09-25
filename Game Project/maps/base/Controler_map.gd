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
var part1 = {'1':{"text":"O lugar parece estar vazio e não encontrou sinais de vida.", "duracao":5,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part2 = {'1':{'text':'O elevador está bloqueado... Talvez encontre alguma forma de destravar-lo.','duracao': 7, 'audio':"res://audio/falas/p1/p1a7.wav"}}
var part3 = {'1':{'text':'humm.. sala de controle. talvez encontre algo aqui.','duracao': 4, 'audio':"res://audio/falas/p1/p1a7.wav"}}
var part4 = {'1':{'text':'Ela? Quem?', "duracao": 2,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'O que será que eles faziam aqui.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part5 = {'1':{'text':'Consegui !!! O elevador deve funcionar agora.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part6 = {'1':{'text':'Mais um elevador bloqueado.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part7 = {'1':{'text':'Eles a trancaram nessa base... mas porque?', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part8 = {'1':{'text':'Humm... geradores talvez se ligar-los destrave aquela porta.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part9 = {'1':{'text':'Algo me diz que não era para ter feito isso.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part10 = {'1':{'text':'Vieram me matar de vez agora?', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'Irei matar todos que fizeram isso comigo.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part11 = {'1':{'text':'Terei minha vingança.', "duracao": 3,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'Obrigada por deixar a porta aberta.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part12 = {'1':{'text':'A base está entrando em autodestruição devido a fuga da nija.', "duracao": 6,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'Tenho que sair daqui.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part13 = {'1':{'text':'Droga ela trancou a porta...', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'Mas a outra porta se abriu....', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part14 = {'1':{'text':'Por aqui', "duracao": 1.5,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'Espere...', "duracao": 1.5,"audio":"res://audio/falas/p1/p1a7.wav"},
'3':{'text':'Por aqui.', "duracao": 1.5,"audio":"res://audio/falas/p1/p1a7.wav"},
'4':{'text':'Ei espere... quem é você?', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"},}
var part15 = {'1':{'text':'Sinal obtido, iniciando upload de dados.', "duracao": 3,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'Dados enviados para a base, chance de fuga de 0%...', "duracao": 3,"audio":"res://audio/falas/p1/p1a7.wav"},
'3':{'text':'Backup concluído.', "duracao": 2,"audio":"res://audio/falas/p1/p1a7.wav"},}

var player

func _ready():
	player = get_tree().get_root().get_node_or_null("Map/Player_v4")
	legenda = get_tree().get_root().get_node_or_null("Map/legendas")
	timer = get_tree().get_root().get_node_or_null("Map/legendas/Timer")
	legenda_label = get_tree().get_root().get_node_or_null("Map/legendas/text/Label")

#var drop_game_test = 0
var cam_turrent = preload("res://player/nave/turret.tscn")
var cam_normal = preload("res://player/nave/target.tscn")
		
func _process(delta):
	if executando_legenda:
		aplly_text()

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
	elif text_info == 8:
		legenda_executando = 8
		text_in_execution = part8
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
	
func start_legenda_elevador():
	set_dados_legenda(2, 2, true)
	
func start_legenda_gerador():
	set_dados_legenda(8, 8, true)
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		BackgroundLoad.load_scene("res://maps/map_sistema/Map_sistema.tscn")
