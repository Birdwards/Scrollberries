extends Node2D

const Berry = preload("res://Berry.tscn")

const SCROLL_SPEED = 2500

var scroll_dir = 0
var scroll_height = 0
#var grabbed_berry = null
var max_plant

func _ready():
	randomize()
	add_plant($Plant)
	#$Berry.connect("grabbed", self, "grab_berry")

func add_plant(plant):
	plant.connect("grow_plant", self, "add_plant")
	max_plant = plant.index
	#if max_plant == 2:
	#	_on_BerryTimer_timeout()
	#	$BerryTimer.start()
	#plant.connect("grow_berry", self, "add_berry")		
	
#func add_berry(berry):
#	berry.connect("grabbed", self, "grab_berry")

func _process(delta):
	scroll_height = min(scroll_height + scroll_dir*delta*5000, 0)
	scroll_dir = 0
	$Camera.position.y = lerp($Camera.position.y, scroll_height, pow(0.97,1/delta))
	
	#if grabbed_berry != null:
	#	grabbed_berry.position = get_viewport().get_mouse_position() + $Camera.position
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP:
			scroll_dir = -1
		elif event.button_index == BUTTON_WHEEL_DOWN:
			scroll_dir = 1
		#elif event.button_index == BUTTON_LEFT and not event.pressed:
		#	if grabbed_berry != null:
		#		grabbed_berry.drop()
		#		grabbed_berry = null
			
#func grab_berry(berry):
#	if berry.get_parent().is_in_group("plant"):
#		var new_pos = berry.global_position
#		berry.get_parent().remove_child(berry)
#		berry.position = new_pos
#		add_child(berry)
#	grabbed_berry = berry

#func _on_BerryTimer_timeout():
#	var pick = randi() % (max_plant - 1)
#	var pick_plant = $Plant
#	for i in range(pick):
#		pick_plant = pick_plant.child
#	var new_berry = Berry.instance()
#	new_berry.position = Vector2.UP * randf() * 45
#	if randf() < 0.5:
#		new_berry.position += Vector2.LEFT*22.5
#	else:
#		new_berry.position += Vector2.RIGHT*22.5
#	pick_plant.add_child(new_berry)
	#new_berry.connect("grabbed", self, "grab_berry")
