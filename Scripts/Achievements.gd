extends Node2D
func _achievements():
	
	for data_point in database_data:
			# Opret ColorRect
			var color_rect = ColorRect.new()
			color_rect.rect_min_size = Vector2(200, 50)
			color_rect.color = Color(1, 1, 1)
			color_rect.position.y = y_position
			add_child(color_rect)

			# Opret Label for navn
			var name_label = Label.new()
			name_label.text = data_point["name"]
			name_label.position.x = 5
			name_label.position.y = y_position + 5
			add_child(name_label)

			# Opret Label for værdi
			var value_label = Label.new()
			value_label.text = "Value: " + str(data_point["value"])
			value_label.position.x = 5
			value_label.position.y = y_position + 25
			add_child(value_label)

			# Opdater y-position for næste element
			y_position += 60  # Juster dette tal for at ændre afstanden mellem elementerne
