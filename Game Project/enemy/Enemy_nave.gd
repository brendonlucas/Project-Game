extends KinematicBody

var life = 5000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if life <= 0:
		print("morreu")
		queue_free()
	
	
func hit_damage(BULLET_DAMAGE):
	print(life)
	life -= BULLET_DAMAGE
