extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		stop()
		play("hack_nija")
		
func change_position():
	var n_pos_m = get_parent().get_node("Position_meya")
	var n_pos_n = get_parent().get_node("Position_nija")
	
	get_parent().get_node("Player_v4").block_moviments(false)
	get_parent().get_node("nija").block_moviments(false)
	get_parent().get_node("Player_v4/AnimationPlayer").play("idle")
	get_parent().get_node("Camera").current = true
	get_parent().get_node("Player_v4").transform = n_pos_m.transform
	get_parent().get_node("nija").transform = n_pos_n.transform

func play_hack_nija():
	get_parent().get_node("nija/AnimationPlayer").play("hack")

func play_kill_meya():
	get_parent().get_node("Player_v4/AnimationPlayer").play("dying")
	
func instance_game():
	Gamestate.instancia_game("hack_nija")
	
	
func nija_walk():
	get_parent().get_node("nija").block_moviments(true)
	get_parent().get_node("nija").set_pos_target(get_parent().get_node("Position_nija_saida"))
	
func remove_cam():
	get_parent().get_node("Camera").current = false

func remove_nija():
	get_parent().get_node("nija").queue_free()

func play_legenda():
	get_parent().get_node("Controler_map").start_legenda_nija_2()
	
