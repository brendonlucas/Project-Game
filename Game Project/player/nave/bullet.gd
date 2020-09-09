extends Spatial

# The speed the bullet travels at
var BULLET_SPEED = 200
# The damage the bullet does on whatever it hits
var BULLET_DAMAGE = 15
# NOTE: for both BULLET_SPEED and BULLET_DAMAGE, we are keeping their
# names uppercase because we do not want their values to change outside of
# when they are instanced/spawned.

# The length of time this bullet last (in seconds) before we free it.
# (because we do not want the bullet to travel forever, as it will consume resources)
const KILL_TIMER = 4
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
	if hit_something == false:
		if body.has_method("bullet_hit"):
			body.bullet_hit(BULLET_DAMAGE, self.global_transform.origin)
			
	hit_something = true
	if body.name != "Player_nave":
		queue_free()
