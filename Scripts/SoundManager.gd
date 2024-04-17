extends Node

func _ready():
	# gør så den kan se når scenen skifter, så det kan køre igen
	get_tree().connect("tree_changed", self, "_on_tree_changed")
	# searcher så også den først scene der loades blivver searched
	perform_recursive_search()

# definerer listen af knapper, og sender det videre til connect_buttons funktionen
func perform_recursive_search():
	var nodes = get_nodes_of_type_recursive(TextureButton, get_tree().get_root())
	connect_buttons(nodes)

# rekursive funktion der finder alle buttons
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

# connecter alle buttons sendt til den til lyd effekten
func connect_buttons(buttons):
	for button in buttons:
		# der var nogle problemer med at nogle noder allerede er connected, der kunne optimalt fixes, men det kan også bare undgås med et simppelt check
		if not button.is_connected("pressed", self, "play_sound"):
			button.connect("pressed", self, "play_sound")

# spil lyden
func play_sound():
	get_node("button_sound").play()
	print("click sfx played and stopped")

# så den kører når man går til ny scene
func _on_tree_changed():
	if get_tree() != null:
		perform_recursive_search()
