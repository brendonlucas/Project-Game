extends Control

var text = preload("res://maps/creditos/texto.tscn")
var textos_creditos = {'1':{"referente":"Programadores","nome":"Brendon Lucas \n Daniel Veras \n Juliana"},
'2':{"referente":"Modelos 3D","nome":"Nomad Photo Reference - Ibrahim Lancoln"},
'3':{"referente":"Modelos 3D","nome":"Vladek"},
'4':{"referente":"Modelos 3D","nome":"Amarveer"},
'5':{"referente":"Modelos 3D","nome":"robomax"},
'6':{"referente":"Modelos 3D","nome":"NinKorr3D"},
'7':{"referente":"Modelos 3D","nome":"decstar77"},
'8':{"referente":"Modelos 3D","nome":"Fellming"},
'9':{"referente":"Modelos 3D","nome":"oussamaazz12h"},
'10':{"referente":"Modelos 3D","nome":"igor.tesV"},

'11':{"referente":"Musica","nome":"ugonna Onyekwe"},
'12':{"referente":"Musica","nome":"sextile"},
'13':{"referente":"Musica","nome":"Yung Logos"},

'14':{"referente":"Animações","nome":"Mixamo"},
'15':{"referente":"Modelos","nome":"Sketchfab"},

}


var text_atual = 1
var finalizou = false

func _ready():
	get_tree().paused = false

func _process(delta):
	if $Timer_text.time_left == 0 and text_atual <= 15:
		instance()
		$Timer_text.start()
	if text_atual and !finalizou and $Timer_text.time_left == 0:
		$Final_tipo.set_text("Final " + str(Gamestate.final_game))
		$Final_tipo/AnimationPlayer.play("fade")
		finalizou = true
		
func instance():
	var clone = text.instance()
	clone.set_values(textos_creditos[str(text_atual)])
	var scene_root
	
	var local = randomNumber()
	if local == 1:
		scene_root = get_tree().get_root().get_node("creditos/Posicoes/p1")
		scene_root.add_child(clone)
		
	elif local == 2:
		scene_root = get_tree().get_root().get_node("creditos/Posicoes/p2")
		scene_root.add_child(clone)
		
	elif local == 3:
		scene_root = get_tree().get_root().get_node("creditos/Posicoes/p3")
		scene_root.add_child(clone)

	elif local == 4:
		scene_root = get_tree().get_root().get_node("creditos/Posicoes/p4")
		scene_root.add_child(clone)

	elif local == 5:
		scene_root = get_tree().get_root().get_node("creditos/Posicoes/p5")
		scene_root.add_child(clone)
	
	text_atual += 1
	
func randomNumber():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(1, 5)
	return my_random_number

func change_menu():
	BackgroundLoad.load_scene("res://maps/menu_inicial/menu_principal.tscn")
