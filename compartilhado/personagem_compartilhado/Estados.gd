extends Node

var estado_atual = ""
var ultimo_estado = ""

func mudar_estado(estado):
	if estado == "Ultimo":
		estado = ultimo_estado

	if estado == "Parado" || estado == "Andando" || estado ==  "Caindo" :
		ultimo_estado = estado

	if estado == "Pulando":
		ultimo_estado = "Caindo"

	if get_node(estado):
		print(estado)
		estado_atual = get_node(estado)
		estado_atual.start()
		return estado_atual
	else:
		print("invalido")