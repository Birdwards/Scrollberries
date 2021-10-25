extends Area2D

signal grabbed

#var old_pos
#var old_parent

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		get_parent().remove_child(self)
		queue_free()
		#old_pos = Vector2(position.x, position.y)
		#old_parent = get_parent()
		#emit_signal("grabbed", self)

#func drop():
#	var closest_points = []
#	for p in get_overlapping_areas():
#		if p.is_in_group("plant"):
#			var p1 = p.to_global(Vector2.ZERO)
#			var p2 = p.to_global(Vector2(0, -45))
#			var closest_segment_point = Geometry.get_closest_point_to_segment_2d(position, p1, p2)
#			var closest_edge_point
#			if closest_segment_point == p1:
#				closest_edge_point = p1 + (position-p1).normalized()*22.5
#			elif closest_segment_point == p2:
#				closest_edge_point = p2 + (position-p2).normalized()*22.5
#			elif (position-p1).angle_to(closest_segment_point-p1) < 0:
#				closest_edge_point = closest_segment_point + Vector2.RIGHT.rotated(p.rotation)*22.5
#			else:
#				closest_edge_point = closest_segment_point + Vector2.LEFT.rotated(p.rotation)*22.5
#			closest_points.append([p, closest_edge_point])
#	if closest_points.size() == 0:
#		if old_parent != null:
#			get_parent().remove_child(self)
#			old_parent.add_child(self)
#			position = old_pos
#	else:
#		get_parent().remove_child(self)
#		closest_points[0][0].add_child(self)
#		position = closest_points[0][0].to_local(closest_points[0][1]) #change to closest among these
