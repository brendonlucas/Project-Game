extends Node
	
var dano_personagem = 135
var dano_arma = 48
var def_personagem = 30
var vida_atual = 2000
var vida_maxima = 2000

var nivel : int = 1
var exp_total : int
var exp_atual : int
var exp_active

var exp_niveis = {'1': 1000,'2': 1500, '3': 2500,
 '4':3000,'5': 3500,'6': 4000,'7':5000,
'8':6000,'9':7000,'10':0}

func upgrade_level_up_status():
	dano_personagem += 20
	def_personagem += 10
	vida_maxima += 100
	vida_atual = vida_maxima
	
# controle de experiencia optida
func add_exp(xp_value):
	if nivel < 10:
		exp_active = false
		var exp_prox_nivel : int = exp_niveis[str(nivel)]
		var exp_restante = exp_niveis[str(nivel)] - exp_atual
		
		if exp_restante < xp_value:
			var sobra_exp = xp_value - exp_restante
			var exp_usada = xp_value - sobra_exp
			exp_total += exp_usada
			exp_atual += exp_usada

			if exp_atual >= exp_prox_nivel and nivel < 10:
				nivel += 1
				exp_atual = 0
				upgrade_level_up_status()
				get_tree().get_root().get_node("Status_UI").update_values()
			add_exp(sobra_exp)
		else:
			exp_total += xp_value
			exp_atual += xp_value
			
			if exp_atual >= exp_prox_nivel and nivel < 10:
				nivel += 1
				exp_atual = 0
		exp_restante = exp_niveis[str(nivel)] - exp_atual
		get_tree().get_root().get_node("Status_UI").update_values()


func _process(delta):
	pass


func calculo_dano(def):
	var def_inimigo = def
	
	var attack_total_personagem = dano_personagem + dano_arma
	var dano_gerado = attack_total_personagem - def_inimigo
	var dano_final = random_damage(dano_gerado)
	
	if critico_gen(dano_final) <= 30:
		dano_final = dano_critico(dano_final)
	return dano_final
	
func dano_critico(dano):
	var parte_dano = dano * 0.5
	return dano + parte_dano
	
func random_damage(dano_maximo):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range((dano_maximo - 50), dano_maximo)
	return my_random_number

func critico_gen(dano):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var chance_critico = rng.randi_range(1, 100)
	return chance_critico
		
	
