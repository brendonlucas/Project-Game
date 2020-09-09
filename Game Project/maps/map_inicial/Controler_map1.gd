extends Node


var enemy_kill = 0
var executou = false
var executou2 = false
func _ready():
	pass
	
func _process(delta):
	if enemy_kill == 5 and !executou:
		start_legenda2()
		executou = true
		
	if Input.is_action_just_pressed("ataque_pesado"):
		enemy_kill +=1
	if enemy_kill == 6 and !executou2:
		executou2 = true
		start_legenda3()
		
func start_legenda1():
	Gamestate.text_in_execution = 1
	Gamestate.executando_legenda = true
	Gamestate.set_dados_legenda(1)
	Gamestate.aplly_text()

func set_enemys_kill():
	enemy_kill += 1

func start_legenda2():
	Gamestate.text_in_execution = 2
	Gamestate.executando_legenda = true
	Gamestate.set_dados_legenda(2)
	Gamestate.aplly_text()

func start_legenda3():
	Gamestate.text_in_execution = 3
	Gamestate.executando_legenda = true
	Gamestate.set_dados_legenda(3)
	Gamestate.aplly_text()
	
func instance_enemy():
	pass
	
func start_final():
	pass
