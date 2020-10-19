extends Area

var damage = 250

func _ready():
	pass 

func _on_laser_red_body_entered(body):
	if body.name == "Player_v4":
		body.hit_damage(damage)
