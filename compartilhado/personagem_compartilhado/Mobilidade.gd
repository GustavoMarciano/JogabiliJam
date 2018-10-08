extends Node

export (float) var velocidade
var tipo = ""

func _physics_process(delta):
	match tipo:
		"normal":
			owner.movimento.x = owner.direcao * velocidade
		"desabilitar":
			owner.movimento.x = 0
		"ar":
			owner.movimento.x = owner.direcao * velocidade / 1.5

func modificar_mobilidade(novo_tipo):
	tipo = novo_tipo