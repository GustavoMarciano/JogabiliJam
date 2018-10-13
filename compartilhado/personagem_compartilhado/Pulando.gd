extends Node

var timer

export (int) var velocidade_pulo 

func start():
	owner.mudar_animacao("Pulando",1,0.2)
	owner.mudar_mobilidade_e_gravidade("ar","normal")
	owner.movimento.y = - velocidade_pulo 

func update(delta):
	owner.mudar_escala_sprite(owner.direcao,1)
	if owner.movimento.y > 0:
		exit("Caindo")

	if owner.habilidade0 != 0:
		 exit("Habilidade0")
	if owner.habilidade1 != 0:
		 exit("Habilidade1")
	if owner.habilidade2 != 0:
		 exit("Habilidade2")

func exit(estado):
	owner.mudar_estado(estado)