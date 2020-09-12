extends Spatial

# The speed the bullet travels at
var BULLET_SPEED = 100

# The damage the bullet does on whatever it hits
var BULLET_DAMAGE = 100

const KILL_TIMER = 10
var timer = 0
var hit_something = false

func _ready():
	$Area.connect("body_entered", self, "collided")
	

func _physics_process(delta):
	var forward_dir = global_transform.basis.x.normalized()
	global_translate(forward_dir * BULLET_SPEED * delta)
	
	timer += delta
	if timer >= KILL_TIMER:
		queue_free()


func collided(body):
	print(body.name)
	if hit_something == false:
		if body.has_method("bullet_hit"):
			body.bullet_hit(BULLET_DAMAGE, self.global_transform.origin)
			
	hit_something = true
	if body.is_in_group("enemy"):
		body.hit_damage(BULLET_DAMAGE)
		
	if body.name != "Player_nave":
		queue_free()
	
