extends Node2D

var borders = Rect2(1,1,30,17)

onready var tilemap = $TileMap

func _ready():
	randomize()
	generate_level()

func generate_level():
	var walker = Walker.new(Vector2(15,8), borders)
	var map = walker.walk(300)
	walker.queue_free()
	for location in map:
		tilemap.set_cellv(location, -1)
	tilemap.update_bitmask_region(borders.position,borders.end)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
