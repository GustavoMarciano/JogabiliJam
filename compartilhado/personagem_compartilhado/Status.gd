extends "res://compartilhado/personagem_compartilhado/PersonagemCompartilhado.gd"

var hp = 0
export(int,9,999) var max_hp = 9
export(int,100,600) var velocidade_base = 300
export(float,1,2) var velocidade_ataque_base = 1
export(int,1,100) var defesa = 1
export(float,0,8) var reducao_cd = 0
export(float,0,2) var buff_velocidade_ataque = 0
export(int,0,100) var buff_velocidade_movimento = 0