extends KinematicBody

var life = 5000

func _ready():
	pass 

func _physics_process(delta):
	if life <= 0:
		print("morreu")
		queue_free()
	
	
func hit_damage(BULLET_DAMAGE):
	life -= BULLET_DAMAGE
	#print(life)
