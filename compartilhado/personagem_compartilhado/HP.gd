extends Node

signal died
signal hp_changed(hp_atual)
 
func _ready():
	owner.hp = owner.max_hp

func dano(valor):
	owner.hp -= valor - owner.defesa_base
	owner.hp = clamp(owner.hp,0,owner.max_hp)
	emit_signal("hp_changed",owner.hp)
	if owner.hp < 1:
		owner.dead = true

func cura(valor):
	owner.hp += valor
	owner.hp = max(owner.hp, owner.max_hp)