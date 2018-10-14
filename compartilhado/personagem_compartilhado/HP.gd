extends Node
 
func _ready():
	owner.hp = owner.max_hp

func dano(valor):
	owner.hp -= valor - owner.defesa
	owner.hp = max(0, owner.hp)
	if owner.hp == 0:
		owner.mudar_estado("Morto")

func cura(valor):
	owner.hp += valor
	owner.hp = max(owner.hp, owner.max_hp)