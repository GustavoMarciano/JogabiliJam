extends Node

var timer

export (int) var velocidade_pulo 

func start():
	owner.mudar_animacao("Pulando",1,0.2)
	owner.mudar_mobilidade_e_gravidade("ar","normal")
	owner.movimento.y = - velocidade_pulo 

func update(delta):
	if owner.movimento.y > 0:
		exit("Caindo")

func exit(estado):
	owner.mudar_estado(estado)