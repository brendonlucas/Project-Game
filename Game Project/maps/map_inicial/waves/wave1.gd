extends Spatial


onready var drone1 = $drone_L1
onready var drone2 = $drone_L2
onready var drone3 = $drone_L3
onready var drone4 = $drone_L4
onready var drone5 = $drone_L5
var mortes = 0

func _ready():
	pass

func active_wave():
	drone1.set_ativo()
	drone2.set_ativo()
	drone3.set_ativo()
	drone4.set_ativo()
	drone5.set_ativo()
	$AnimationPlayer.play("wave1")
	
func _process(delta):
	if mortes >= 5:
		queue_free()

func mortes():
	print("add morte")
	mortes += 1
