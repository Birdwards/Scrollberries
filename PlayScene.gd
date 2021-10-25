extends Node2D

const Berry = preload("res://Berry.tscn")

const SCROLL_SPEED = 2500

var scroll_dir = 0
var scroll_height = 0

func _ready():
	randomize()
	add_plant($Plant)

func add_plant(plant):
	plant.connect("grow_plant", self, "add_plant")

func _process(delta):
	scroll_height = min(scroll_height + scroll_dir*delta*5000, 0)
	scroll_dir = 0
	$Camera.position.y = lerp($Camera.position.y, scroll_height, pow(0.97,1/delta))
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP:
			scroll_dir = -1
		elif event.button_index == BUTTON_WHEEL_DOWN:
			scroll_dir = 1
