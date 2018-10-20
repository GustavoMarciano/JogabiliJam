extends Position2D

export (float) var min_waitTime
export (float) var max_waitTime

onready var enemy = load("res://personagens/inimigo_teste/InimigoTeste.tscn")

var visible_spawns = []
var enemy_count = 0

func _ready():
	randomize()
	$Timer.wait_time = rand_range(min_waitTime,max_waitTime)
	$Timer.start()

func _on_Timer_timeout():
	if enemy_count<40:
		var sort = rand_range(0,visible_spawns.size())
		var new_enemy = Utils.create_object(enemy,self)
		var n_position = visible_spawns[sort]
		var enemy_shape = new_enemy.get_node("CollisionShape2D").shape.get_extents().y
		new_enemy.set_position(Vector2(n_position.global_position.x + rand_range(0,n_position.get_rect().size.x * n_position.get_scale().x),n_position.global_position.y - enemy_shape+1))
	enemy_count += 1
	$"Timer".set_wait_time(rand_range(min_waitTime,max_waitTime))
	$"Timer".start()