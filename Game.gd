extends Node

var cena_atual = null
var inimigos = 0

func _ready():
	cena_atual = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)

func nova_cena(cena):
	cena_atual.queue_free()
	var s = ResourceLoader.load(cena)
	cena_atual = s.instance()
	get_tree().get_root().add_child(cena_atual)