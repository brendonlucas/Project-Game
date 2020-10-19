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
var part1 = {'1':{"text":"O lugar parece estar vazio e não encontrou sinais de vida.", "duracao":5,"audio":"res://audio/falas/p3/a13.wav"}}
var part2 = {'1':{'text':'O elevador está bloqueado... Talvez encontre alguma forma de destravar-lo.','duracao': 6, 'audio':"res://audio/falas/p3/a14.wav"}}
var part3 = {'1':{'text':'humm.. sala de controle. talvez encontre algo aqui.','duracao': 4, 'audio':"res://audio/falas/p3/a15.wav"}}
var part4 = {'1':{'text':'Ela? Quem?', "duracao": 2,"audio":"res://audio/falas/p3/a16.wav"},
'2':{'text':'O que será que eles faziam aqui?', "duracao": 4,"audio":"res://audio/falas/p3/a17.wav"}}
var part5 = {'1':{'text':'Consegui !!! O elevador deve funcionar agora.', "duracao": 4,"audio":"res://audio/falas/p3/a18.wav"}}
var part6 = {'1':{'text':'Mais um elevador bloqueado.', "duracao": 3,"audio":"res://audio/falas/p3/a19.wav"}}
var part7 = {'1':{'text':'Eles a trancaram nessa base... mas por quê?', "duracao": 4,"audio":"res://audio/falas/p3/a20.wav"}}
var part8 = {'1':{'text':'Humm... geradores talvez se ligar-los destrave aquela porta.', "duracao": 5,"audio":"res://audio/falas/p3/a21.wav"}}
var part9 = {'1':{'text':'Algo me diz que não era para ter feito isso.', "duracao": 4,"audio":"res://audio/falas/p3/a22.wav"}}
var part10 = {'1':{'text':'Vieram me matar de vez agora?', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'Irei matar todos que fizeram isso comigo.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part11 = {'1':{'text':'Terei minha vingança.', "duracao": 3,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'Obrigada por deixar a porta aberta.', "duracao": 4,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part12 = {'1':{'text':'A base está entrando em autodestruição devido a fuga da nija.', "duracao": 6,"audio":"res://audio/falas/p3/a23.wav"},
'2':{'text':'Tenho que sair daqui.', "duracao": 4,"audio":"res://audio/falas/p3/a24.wav"}}
var part13 = {'1':{'text':'Droga... ela trancou a porta...', "duracao": 4,"audio":"res://audio/falas/p3/a25.wav"},
'2':{'text':'Mas a outra porta se abriu....', "duracao": 4,"audio":"res://audio/falas/p3/a26.wav"}}
var part14 = {'1':{'text':'Por aqui', "duracao": 1.5,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'Espere...', "duracao": 1.5,"audio":"res://audio/falas/p1/p1a7.wav"},
'3':{'text':'Por aqui.', "duracao": 1.5,"audio":"res://audio/falas/p1/p1a7.wav"},
'4':{'text':'Ei espere... quem é você?', "duracao": 4,"audio":"res://audio/falas/p3/a27.wav"}}
var part15 = {'1':{'text':'Sinal obtido, iniciando upload de dados.', "duracao": 3,"audio":"res://audio/falas/p1/p1a7.wav"}}
var part16 = {'1':{'text':'Dados enviados para a base, chance de fuga de 0%...', "duracao": 3,"audio":"res://audio/falas/p1/p1a7.wav"},
'2':{'text':'Backup concluído.', "duracao": 2,"audio":"res://audio/falas/p1/p1a7.wav"}}

var player

func _ready():
	player = get_tree().get_root().get_node_or_null("Map/Player_v4")
	legenda = get_tree().get_root().get_node_or_null("Map/legendas")
	timer = get_tree().get_root().get_node_or_null("Map/legendas/Timer")
	legenda_label = get_tree().get_root().get_node_or_null("Map/legendas/text/Label")

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
	elif text_info == 10:
		legenda_executando = 10
		text_in_execution = part10
	elif text_info == 11:
		legenda_executando = 11
		text_in_execution = part11
	elif text_info == 12:
		legenda_executando = 12
		text_in_execution = part12
	elif text_info == 13:
		legenda_executando = 13
		text_in_execution = part13
	elif text_info == 14:
		legenda_executando = 14
		text_in_execution = part14
	elif text_info == 15:
		legenda_executando = 15
		text_in_execution = part15
	elif text_info == 16:
		legenda_executando = 16
		text_in_execution = part16
		
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
	
func start_legenda_sala_de_controle():
	set_dados_legenda(3, 3, true)
	
func start_legenda_sala_2():
	set_dados_legenda(4, 4, true)
	
func start_legenda_elevador_1():
	set_dados_legenda(5, 5, true)
	
func start_legenda_elevador_2_bloqueado():
	set_dados_legenda(6, 6, true)
	
func start_legenda_sala_3():
	set_dados_legenda(7, 7, true)
	
func start_legenda_gerador():
	set_dados_legenda(8, 8, true)
	
func start_legenda_limbo_entrada():
	set_dados_legenda(9, 9, true)

func start_legenda_nija():
	set_dados_legenda(10, 10, true)
	
func start_legenda_nija_2():
	set_dados_legenda(11, 11, true)
	
func start_legenda_base_alerta():
	set_dados_legenda(12, 12, true)
		
func start_legenda_fechar_portas():
	set_dados_legenda(13, 13, true)

func start_legenda_voz_desconhecida():
	set_dados_legenda(14, 14, true)
	
func start_legenda_sinal_obtido():
	set_dados_legenda(15, 15, true)
	
func start_legenda_upload():
	set_dados_legenda(16, 16, true)
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		BackgroundLoad.load_scene("res://maps/map_sistema/Map_sistema.tscn")
