extends Spatial

export var follow_player = true

func _ready():
	pass

func _process(delta):
	var player = get_parent().get_node_or_null("Player_nave")
	if player:
		if follow_player:
			translation = player.translation
	
func stop_follow_player():
	follow_player = false

func turn_position():
	$AnimationPlayer.play("MOVE_TOP")
	stop_follow_player()
	get_parent().get_node("Player_nave").change_moves(2)
