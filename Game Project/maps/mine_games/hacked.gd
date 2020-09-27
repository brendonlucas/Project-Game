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
		pass
		#Gamestate.drop_game()


func done_game():
	get_tree()
	Gamestate.done_game()
	# Gamestate.drop_game()