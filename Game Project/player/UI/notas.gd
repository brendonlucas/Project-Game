extends Control


func _ready():
	pass # Replace with function body.

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
	hide()
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Gamestate.ativar_menu = true
