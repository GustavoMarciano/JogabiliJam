extends Node

signal died
signal mudar_hp(valor)
signal cura(valor)
 
func _ready():
	owner.hp = owner.max_hp

func dano(valor):
	owner.hp -= valor
	owner.hp = clamp(owner.hp,0,owner.max_hp)
	emit_signal("mudar_hp",owner.hp)
	if owner.hp < 1:
		emit_signal("died")

func cura(valor):
	owner.hp += valor
	owner.hp = max(owner.hp, owner.max_hp)
	emit_signal("cura",valor)