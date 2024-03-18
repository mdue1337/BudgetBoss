extends TextureButton

func _on_LoginButton_pressed():
	var login = get_owner().get_node("LogIn")
	login.visible = false
	var signup = get_owner().get_node("SignUp")
	signup.visible = true
