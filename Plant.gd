extends Area2D

const Berry = preload("res://Berry.tscn")

const ROTATION_SPEED = 0.1
const GROW_SPEED = 10

var length = 0
var index = 1.0
var max_index = 1.0
var child = null
var parent = null

#signal grow_berry
signal grow_plant

func _process(delta):
	if length < 45:
		length = min(length + GROW_SPEED*delta, 45)
		$Line2D.set_point_position(1, Vector2.UP*length)
		if length >= 45:
			var new_plant = duplicate()
			new_plant.get_node("Line2D").set_point_position(1, Vector2.ZERO)
			new_plant.position = Vector2.UP * 45
			new_plant.index = index + 1.0
			child = new_plant
			new_plant.parent = self
			new_plant.set_max_index(new_plant.index)
			add_child(new_plant)
			emit_signal("grow_plant", new_plant)
			$BerryTimer.wait_time = randf()*5+5
			$BerryTimer.start()
			#if index == 1:
			#	var new_berry = Berry.instance()
			#	new_berry.position = Vector2.UP * randf() * 45
			#	if randf() < 0.5:
			#		new_berry.position += Vector2.LEFT*22.5
			#	else:
			#		new_berry.position += Vector2.RIGHT*22.5
			#	add_child(new_berry)
			#	emit_signal("grow_berry", new_berry)
	var berry_factor = 0
	for c in get_children():
		if c.is_in_group("berry"):
			berry_factor += sign(c.position.x)
	rotation += berry_factor*ROTATION_SPEED*delta*pow(index/max_index,2)

func set_max_index(mi):
	max_index = mi
	if parent != null:
		parent.set_max_index(mi)

func _on_BerryTimer_timeout():
	var new_berry = Berry.instance()
	new_berry.position = Vector2.UP * randf() * 45
	if randf() < 0.5:
		new_berry.position += Vector2.LEFT*22.5
	else:
		new_berry.position += Vector2.RIGHT*22.5
	add_child(new_berry)
	$BerryTimer.wait_time = (randf()+1)*5*max_index/index
	$BerryTimer.start()
