extends Node

#audios
var audio_1 = preload("res://audio/falas/p1/p1a1.wav")
var audio_2 = preload("res://audio/falas/p1/p1a2.wav")
var audio_3 = preload("res://audio/falas/p1/p1a3.wav")
var audio_4 = preload("res://audio/falas/p1/p1a4.wav")
var audio_5 = preload("res://audio/falas/p1/p1a5.wav")
var audio_6 = preload("res://audio/falas/p1/p1a6.wav")
var audio_7 = preload("res://audio/falas/p1/p1a7.wav")
var audio_8 = preload("res://audio/falas/p1/p1a8.wav")

var legenda
var timer
var legenda_label

var enemy_kill = 0
var executou = false
var executou2 = false

var executando_legenda = false
var text_in_execution
var text_atual = 1
var legenda_executando = 0
var part1 = {'1':{"text":"Ano de 3400, este planeta conhecido como Terra, sofreu com guerras pelo poder durante anos, poucos sobreviveram.",
	"duracao":8,"audio":"res://audio/falas/p1/p1a1.wav"},
	'2':{"text":"Os que restaram, criaram duas facções tecnológicas...","duracao":4,"audio":"res://audio/falas/p1/p1a2.wav"},
	'3':{"text":"RaySpawn… Organização criminosa que fabrica armas militares e androids de combate, com pretensões desconhecidas.",
	"duracao":8,"audio":"res://audio/falas/p1/p1a3.wav"},
	'4':{"text":"Gênesis… Organização criada para combater os atos terroristas da RaySpawn.","duracao":6.5,"audio":"res://audio/falas/p1/p1a4.wav"},
	'5':{"text":"E eu? sou Meya, uma andróide super inteligente da facção Gênesis….","duracao":6,"audio":"res://audio/falas/p1/p1a5.wav"},
	'6':{"text":"Meya? falando sozinha de novo? Foco na missão!","duracao":6,"audio":"res://audio/falas/p1/p1a6.wav"},
	'7':{"text":"Ok!","duracao":2,"audio":"res://audio/falas/p1/p1a7.wav"},
	'8':{"text":"Alerta! inimigos próximos, preparar para o combate.","duracao":4,"audio":"res://audio/falas/p1/p1a8.wav"},
}

var part2 = {'1':'Alerta!, inimigo forte está se aproximando.',
}

var part3 = {'1':{'text':'Alerta! vírus detectado no sistema da nave.',
	"duracao":5,"audio":"link"},
	'2':{'text':'Funções de navegação indisponível','duracao':3,'audio':'link'},
	'3':{'text':'Perdendo altitude.','duracao':3,'audio':'link'},
	'4':{'text':'Preparar para impacto.','duracao':3,'audio':'link'}
}


var player_nave
var fade_final

func _ready():
	fade_final = get_tree().get_root().get_node_or_null("Map/fade_final/AnimationPlayer")
	player_nave = get_tree().get_root().get_node_or_null("Map/Player_nave")
	legenda = get_tree().get_root().get_node_or_null("Map/legendas")
	timer = get_tree().get_root().get_node_or_null("Map/legendas/Timer")
	legenda_label = get_tree().get_root().get_node_or_null("Map/legendas/text/Label")


func _process(delta):
	if executando_legenda:
		aplly_text()
	
	if enemy_kill == 5 and !executou:
		start_legenda2()
		executou = true
		
	if Input.is_action_just_pressed("ataque_pesado"):
		enemy_kill +=1
	if enemy_kill == 6 and !executou2:
		executou2 = true
		start_legenda3()
		
func start_legenda1():
	set_dados_legenda(1, 1, true)
	#Gamestate.executando_legenda = true

func set_enemys_kill():
	enemy_kill += 1

func start_legenda2():
	Gamestate.text_in_execution = 2
	Gamestate.executando_legenda = true
	#Gamestate.set_dados_legenda(2)
	Gamestate.aplly_text()

func start_legenda3():
	Gamestate.text_in_execution = 3
	Gamestate.executando_legenda = true
	#Gamestate.set_dados_legenda(3)
	Gamestate.aplly_text()
	
func instance_enemy():
	pass
	
func start_final():
	pass

func set_dados_legenda(execution_text, text_info, audio):
	executando_legenda = true
	text_in_execution = execution_text
	text_atual = 1
	
	if text_info == 1:
		text_in_execution = part1
		legenda_executando = 1
	elif text_info == 2:
		text_in_execution = part2
	elif text_info == 3:
		legenda_executando = 3
		text_in_execution = part3
		
func aplly_text():
	legenda.show()
	if text_atual > text_in_execution.size() and timer.time_left == 0:
		executando_legenda = false
		legenda.hide()
		if legenda_executando == 1:
			player_nave.ativar_moves(true)
		elif legenda_executando == 3:
			fade_final.play("fade_out")
			player_nave.ativar_moves(false)
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
