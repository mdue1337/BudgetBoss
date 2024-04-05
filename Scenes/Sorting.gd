extends Node2D

var selected = false


func _ready():
	pass # Replace with function body.

func _process(delta):
	if selected:
		followMouse()

func followMouse():
	position = get_global_mouse_position()

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			$Nut.selected = true
			$Bolt.selected = true
		else:
			$Nut.selected = false
			$Bolt.selected = false


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			selected = true
			print("pressed")
		else:
			selected = false
			print("released")



""""
extends Node2D


const NUM_NUTS = 10
const NUM_BOLTS = 10


onready var NutBox = $NutBox
onready var BoltBox = $BoltBox


func _on_NutBox_body_entered(body):

	if body.name.contains("Nut"):
		body.sort_into_box(NutBox)

func _on_BoltBox_body_entered(body):

	if body.name.contains("Bolt"):
		body.sort_into_box(BoltBox)


func sort_into_box(box):
	
	get_parent().remove_child(self)
	queue_free()

	
	box.add_child(self)


func get_random_spawn_position():

	return Vector2(rand_range(0, 100), rand_range(0, 100))

func spawn_nuts_and_bolts():

	for i in range(NUM_NUTS):
		spawn_random("nut")

	
	for i in range(NUM_BOLTS):
		spawn_random("bolt")

func spawn_random(type):
	
	var position = get_random_spawn_position()

	# Duplicate the nut or bolt node
	var node
	if type == "nut":
		node = $Nut.duplicate()
	else:
		node = $Bolt.duplicate()

	# Set the node position and add it to the scene
	node.position = position
	add_child(node)

func _ready():
	spawn_nuts_and_bolts()
"""

