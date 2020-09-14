extends KinematicBody

var speed = 5
var space_state
var target

var timer_attack
var target_attack

var life = 500

func _ready():
	space_state = get_world().direct_space_state
	timer_attack = get_node("gun/Timer")
func _process(delta):
	if life <= 0:
		queue_free()
		
	if target:
		var result = space_state.intersect_ray(global_transform.origin, target.global_transform.origin)
		if target.is_in_group("Player_hack"):
			var olhar = target.global_transform.origin
			#olhar.y = 1
			#look_at_from_position(translation, olhar, Vector3.UP)
			look_at(olhar, Vector3.UP)
			move_to_target(delta)
			if $gun/Timer.time_left == 0:
				atacar()
				$gun/Timer.start()
				
	var velocity = Vector3()
	velocity.y -= 1
	rotation_degrees.x = 0
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	
			
func atacar():
	$gun.fire_weapon()

func _on_Area_body_entered(body):
	if body.is_in_group("Player_hack"):
		target = body
		#print(body.name + " entered")

func _on_Area_body_exited(body):
	if body.is_in_group("Player_hack"):
		target = null
		#print(body.name + " exited")

func move_to_target(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction * speed , Vector3.UP)
	
func hit_damage(BULLET_DAMAGE):
	life -= BULLET_DAMAGE
