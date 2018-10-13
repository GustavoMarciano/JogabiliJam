extends Area2D

const DamageSource = preload("res://compartilhado/hitbox/HitBox.tscn")

func _on_area_entered(area):
	if !(area == DamageSource):
		return
	owner.tomar_dano(area)