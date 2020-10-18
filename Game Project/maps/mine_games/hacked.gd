extends Spatial

var player
var timer
var timer_iniciado = false
func _ready():
	timer = $Timer_reset


func _process(delta):
	player = get_node_or_null("Player_hack")
	if !player and !timer_iniciado:
		timer.start()
		timer_iniciado = true
	elif !player and timer.time_left == 0:
		get_tree().get_root().get_node("Map/finalizacao/fim_2/fade/AnimationPlayer").play("fade")
		Gamestate.in_mine_game = false
		Gamestate.drop_game_test = 0

func done_game():
	get_tree()
	Gamestate.done_game()
	# Gamestate.drop_game()

func up_speed_ataque():
	pass
