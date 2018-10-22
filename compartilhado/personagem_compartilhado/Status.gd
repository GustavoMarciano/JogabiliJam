extends "res://compartilhado/personagem_compartilhado/PersonagemCompartilhado.gd"

signal mudar_nivel(valor)

var hp = 0
var nivel = 1
var xp = 0
var xp_total = 0
var xp_necessario = experiencia_necessaria(nivel+1)
var tempo_knock_back = 0
var tempo_atordoamento = 0
var critico = false
var last_hit


export(String,"Player","Inimigo") var side 
export(int,10,999) var max_hp = 9
export(int,0,100) var critico_base = 1
export(int,100,600) var velocidade_base = 300
export(float,1,2) var velocidade_ataque_base = 1
export(int,1,100) var defesa_base = 1
export(float,0,8) var reducao_cd_base = 0
export(float,0,8) var dano_base = 1
export(float,0,2) var bonus_velocidade_ataque = 0
export(int,0,100) var bonus_velocidade_movimento = 0
export(int,0,100) var bonus_critico = 0

var dmg_range = [dano_base,dano_base * 4]

func row_crit():
	randomize()
	var crit_chance = critico_base + bonus_critico
	var dice = randi() % 100
	if dice < crit_chance:
		critico = true
	else:
		critico = false

func add_xp(value):
	xp_total += value
	xp += value
	while xp >= xp_necessario:
		xp -= xp_necessario
		mudar_nivel()

func mudar_nivel():
	if !dead:
			xp_necessario = experiencia_necessaria(nivel + 1)
			nivel += 1  
			max_hp += 2
			hp = max_hp
			dano_base += 1
			critico_base += 1
			$"HP".emit_signal("mudar_hp",hp) 
			emit_signal("mudar_nivel",nivel)
func _on_HP_died():
	dead = true

func experiencia_necessaria(nivel):
	return round(pow(nivel,1.8) + nivel * 4)