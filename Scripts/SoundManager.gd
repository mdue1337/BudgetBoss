extends Node

func _ready():
	# Connect the _on_tree_changed function to the tree_changed signal
	get_tree().connect("tree_changed", self, "_on_tree_changed")
	# Perform the initial recursive search
	perform_recursive_search()

# Function to perform the recursive search
func perform_recursive_search():
	var nodes = get_nodes_of_type_recursive(TextureButton, get_tree().get_root())
	connect_buttons(nodes)

# Recursive function to find nodes of a given type
func get_nodes_of_type_recursive(type, node):
	var result = []
	_get_nodes_of_type_recursive(node, type, result)
	return result

func _get_nodes_of_type_recursive(node, type, result):
	if node == null:
		return
	
	if node is type:
		result.append(node)
	
	for child in node.get_children():
		_get_nodes_of_type_recursive(child, type, result)

# Function to connect button signals
func connect_buttons(buttons):
	for button in buttons:
		# Check if the signal is already connected
		if not button.is_connected("pressed", self, "play_sound"):
			# Connect the signal only if it's not already connected
			button.connect("pressed", self, "play_sound")

# Function to play the sound
func play_sound():
	get_node("button_sound").play()
	print("click sfx played and stopped")

# Function called when the scene tree changes
func _on_tree_changed():
	# Perform the recursive search whenever the scene tree changes
	perform_recursive_search()
