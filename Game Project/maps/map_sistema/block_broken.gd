extends StaticBody

var BULLET_DAMAGE = 100
var life = 200
var hit_something = false


func _ready():
	pass

func _process(delta):
	if life <= 0:
		queue_free()
		
func hit_damage(damage):
	life -= damage
