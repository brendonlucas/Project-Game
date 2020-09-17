extends Spatial

export var follow_player = true


func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_parent().get_node("Player_nave")
	if follow_player:
		translation = player.translation
	
func stop_follow_player():
	follow_player = false

func turn_position():
	$AnimationPlayer.play("MOVE_TOP")
	stop_follow_player()
	get_parent().get_node("Player_nave").change_moves(2)
