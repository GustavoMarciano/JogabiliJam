extends Position2D

func _ready():
	$TextureProgress.max_value = owner.max_hp

func _on_HP_hp_changed(hp_atual):
	$TextureProgress.value = owner.hp