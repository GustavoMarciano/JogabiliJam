extends Node

var hp = 0
export(int) var max_hp = 9
 
func _ready():
	hp = max_hp

func dano(valor):
	hp -= valor
	hp = max(0, hp)
	if hp == 0:
		owner.mudar_estado("Morto")

func cura(valor):
	hp += valor
	hp = max(hp, max_hp)