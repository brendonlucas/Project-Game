extends Control

func _ready():
	pass 

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		hide()
		show()
		get_tree().paused = true
		Gamestate.ativar_menu = false
		$fade.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$AnimationPlayer.play("show")
		
func show_menu():
	hide()
	show()
	get_tree().paused = true
	Gamestate.ativar_menu = false
	$fade.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$AnimationPlayer.play("show")
	
func load_game():
	Gamestate.load_checkpoint()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_parent().get_node("Fade/AnimationPlayer").play("fade_in")
	get_tree().paused = false
	Gamestate.ativar_menu = true
	
func _on_Button_M_P_pressed():
	$fade/AnimationPlayer.play("fade_normal")
	BackgroundLoad.load_scene("res://maps/menu_inicial/menu_principal.tscn")


func _on_Button_Continuar_pressed():
#	get_tree().get_root().get_node("Map/fade_load/AnimationPlayer").play("fade_load")
	$fade/AnimationPlayer.play("fade")
