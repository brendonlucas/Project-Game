extends Control

var nota_ativa

func _ready():
	pass

func mostrar(imagem):
	Gamestate.ativar_menu = false
	get_tree().paused = true
	$base_nota/AnimationPlayer.play("move")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$base_nota/Notas.texture = load(imagem)
	show()
	
func _input(event):
	if Input.is_action_just_pressed("menu_pause") and !Gamestate.ativar_menu:
		$base_nota/AnimationPlayer.play("close")

		
func _on_Button_fechar_pressed():
	$base_nota/AnimationPlayer.play("close")

	
func fechar():
	print(nota_ativa)
	hide()
	get_tree().paused = false
	if nota_ativa == "015":
		get_tree().get_root().get_node("Map/Controler_map").start_legenda_sala_2()
	elif nota_ativa == "021":
		get_tree().get_root().get_node("Map/Controler_map").start_legenda_sala_3()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Gamestate.ativar_menu = true
	
