extends Interactable

var dor
var open = true
var status_porta
var timer

func _ready():
	dor = get_parent().get_node("AnimationPlayer")
	timer =  get_node("Timer")
	
func get_interactable_text():
	return "Descer elevador"
	
var descer = false

func _process(delta):
	if descer and timer.time_left == 0:
		print("active descer")
		get_parent().get_parent().get_parent().get_node("AnimationPlayer").play("active_down")
		descer = false
	
func interact():
	if open:
		dor.play("close")
		get_parent().get_node("dor").play()
		timer.start()
		descer = true
		open = false
		
