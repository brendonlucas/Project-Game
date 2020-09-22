extends Interactable

var dor
var open = false
var status_porta
func _ready():
	dor = get_parent().get_node("AnimationPlayer")

func get_interactable_text():
	return "Usar"
	
func interact():
	if open and get_parent().get_node(".").get_active():
		dor.play("close")
		open = false
			
	elif !open and get_parent().get_node(".").get_active():
		dor.play("open")
		open = true
		
func set_open(option):
	open = option
