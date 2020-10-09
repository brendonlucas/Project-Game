extends Control

var text = preload("res://maps/creditos/texto.tscn")
var textos_creditos = {'1':{"referente":"Programadores","nome":"Brendon"},
'2':{"referente":"Programadores","nome":"Brendon"},
'3':{"referente":"asfasf","nome":"Brendon \n nome54 nome6"},
'4':{"referente":"sdf sdfsd","nome":"Brendon"},
'5':{"referente":"asd fsdf asd","nome":"Brendon"},
}
var text_atual = 1

func _ready():
	pass

func _process(delta):
	if $Timer_text.time_left == 0 and text_atual <= 5:
		instance()
		$Timer_text.start()
		
func instance():
	var clone = text.instance()
	clone.set_values(textos_creditos[str(text_atual)])
	var scene_root
	
	var local = randomNumber()
	if local == 1:
		scene_root = get_tree().get_root().get_node("creditos/Posicoes/p1")
		scene_root.add_child(clone)
		#clone.rect_position = $Posicoes/Position1.position
		#scene_root = get_tree().get_root().get_node("creditos/p1")
	elif local == 2:
		scene_root = get_tree().get_root().get_node("creditos/Posicoes/p2")
		scene_root.add_child(clone)
		#clone.rect_position = $Posicoes/Position2.position
		
	elif local == 3:
		scene_root = get_tree().get_root().get_node("creditos/Posicoes/p3")
		scene_root.add_child(clone)
		#clone.rect_position = $Posicoes/Position3.position

	elif local == 4:
		scene_root = get_tree().get_root().get_node("creditos/Posicoes/p4")
		scene_root.add_child(clone)
		#clone.rect_position = $Posicoes/Position4.position

	elif local == 5:
		scene_root = get_tree().get_root().get_node("creditos/Posicoes/p5")
		scene_root.add_child(clone)
		#clone.rect_position = $Posicoes/Position5.position
	
	text_atual += 1
	
	
func randomNumber():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(1, 5)
	return my_random_number
