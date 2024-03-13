extends Node2D

# Define the scenes you want to transition to
var hospital_scene = preload("res://Scenes/Hospital.tscn")
var bank_scene = preload("res://Scenes/Bank.tscn")
var market_scene = preload("res://Scenes/Market.tscn")
var camp_scene = preload("res://Scenes/Camp.tscn")
var factory_scene = preload("res://Scenes/Factory.tscn")

func _on_Camp_pressed():
	get_tree().change_scene("res://Scenes/Camp.tscn")

func _on_Factory_pressed():
	get_tree().change_scene("res://Scenes/Factory.tscn")

func _on_Bank_pressed():
	get_tree().change_scene("res://Scenes/Bank.tscn")

func _on_Hospital_pressed():
	get_tree().change_scene("res://Scenes/Hospital.tscn")

func _on_Market_pressed():
	get_tree().change_scene("res://Scenes/Market.tscn")
