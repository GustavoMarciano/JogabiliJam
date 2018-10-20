extends "res://compartilhado/personagem_compartilhado/PersonagemCompartilhado.gd"

signal nivel_changed(valor)

var hp = 0
var nivel = 1
var xp = 0
var tempo_knock_back = 0
var tempo_atordoamento = 0
var critico = false
var last_hit

export(String,"Player","Inimigo") var side 
export(int,9,999) var max_hp = 9
export(int,0,100) var critico_base = 1
export(int,100,600) var velocidade_base = 300
export(float,1,2) var velocidade_ataque_base = 1
export(int,1,100) var defesa_base = 1
export(float,0,8) var reducao_cd_base = 0
export(float,0,8) var dano_base = 0

export(float,0,2) var bonus_velocidade_ataque = 0
export(int,0,100) var bonus_velocidade_movimento = 0
export(int,0,100) var bonus_critico = 0

func row_crit():
	randomize()
	var crit_chance = critico_base + bonus_critico
	var dice = randi() % 100
	if dice < crit_chance:
		critico = true
	else:
		critico = false

func add_xp(value):
	xp = xp + value
	if xp > nivel * 100:
		mudar_nivel(1)

func mudar_nivel(valor):
		nivel += valor
		max_hp += 1 * nivel
		hp = max_hp
		defesa_base +=1 * nivel
		dano_base += 1 * nivel
		critico_base += 1 * nivel
		print(critico_base)
		$"HP".emit_signal("hp_changed",hp) 
		emit_signal("nivel_changed",nivel)