extends Interactable

var dor
var ativo = false
var status_porta

func _ready():
	pass
	#dor = get_parent().get_node("AnimationPlayer")

func get_interactable_text():
	return "Ativar gerador" + str(ativo)
		
func set_active(option):
	ativo = option

func interact():
	if !ativo :
		Gamestate.instancia_game("gerador_1")
		# instanciar minigame
		ativo = true
