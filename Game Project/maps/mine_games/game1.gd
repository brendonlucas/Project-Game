extends Spatial

var player
var timer
var timer_iniciado = false
var enemys_kill = 0
var door_close = true

func _ready():
	
	timer = $Timer_reset

func _process(delta):
	player = get_node_or_null("Player_hack")
	if !player and !timer_iniciado:
		timer.start()
		timer_iniciado = true
	elif !player and timer.time_left == 0:
		Gamestate.drop_game()
	if enemys_kill >= 7 and door_close:
		$Porta/AnimationPlayer.play("drop")
		door_close = false
		
func done_game():
	Gamestate.done_game()
	# Gamestate.drop_game()

func up_speed_ataque():
	enemys_kill += 1
	if get_node_or_null("enemy_hack2"):
		$enemy_hack2.up_bullet_speed()
	if get_node_or_null("enemy_hack3"):
		$enemy_hack3.up_bullet_speed()
	if get_node_or_null("enemy_hack_stop"):
		$enemy_hack_stop.up_bullet_speed()
	if get_node_or_null("enemy_hack_stop2"):
		$enemy_hack_stop2.up_bullet_speed()
	if get_node_or_null("enemy_hack_stop3"):
		$enemy_hack_stop3.up_bullet_speed()
	if get_node_or_null("enemy_hack_stop4"):
		$enemy_hack_stop4.up_bullet_speed()
	if get_node_or_null("enemy_hack_stop5"):
		$enemy_hack_stop5.up_bullet_speed()
