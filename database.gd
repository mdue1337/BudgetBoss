extends Control

# Declare member variables here. Examples:
var http_request : HTTPRequest = HTTPRequest.new()
const SERVER_URL = "http://baam-ddu.dk/db_test.php"
const SERVER_HEADERS = ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"]
const SECRET_KEY = 1234567890
var nonce = null
var request_queue : Array = []
var is_requesting : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(http_request)
	http_request.connect("request_completed",self,"_http_request_completed")
	
	# methods connect
	Gs.connect("login", self, "get_user");
	Gs.connect("signup", self, "create_user")
	Gs.connect("get_leaderboard", self, "get_leaderboard")
	Gs.connect("create_game", self, "create_game")
	Gs.connect("load_game", self, "load_game")

func _process(delta):
	if is_requesting:
		return
	
	if request_queue.empty():
		return
	
	is_requesting = true
	_send_request(request_queue.pop_front())
	
func _send_request(request: Dictionary):
	var client = HTTPClient.new()
	var data = client.query_string_from_dict({"data" : JSON.print(request['data'])})
	var body = "command=" + request['command'] + "&" + data
	
	var headers = SERVER_HEADERS.duplicate()
	
	var err = http_request.request(SERVER_URL, headers, true, HTTPClient.METHOD_POST, body)
		
	if err != OK:
		printerr("HTTPRequest error: " + String(err))
		return
		
	#$TextEdit.set_text(body)
	print("Requesting...\n\tCommand: " + request['command'] + "\n\tBody: " + body)
	
	
func _http_request_completed(_result, _response_code, _headers, _body):
	is_requesting = false
	if _result != http_request.RESULT_SUCCESS:
		printerr("Error w/ connection: " + String(_result))
		return
	
	var response_body = _body.get_string_from_utf8()
	var response = parse_json(response_body)
	
	Gs.emit_signal("response", response);

func create_user():
	var command = "add_user_login";
	var password = String(Gs.password.to_utf8()).sha256_text()
	var data = {"email": String(Gs.email), "name": String(Gs.fullName), "secret": password}
	request_queue.push_back({"command" : command, "data" : data})
	
func get_user():
	var command = "get_user_login";
	var password = String(Gs.password.to_utf8()).sha256_text()
	var data = {"email": String(Gs.email), "secret": password}
	request_queue.push_back({"command" : command, "data" : data})

func get_leaderboard():
	var command = "get_leaderboard"
	var data = {}
	request_queue.push_back({"command" : command, "data" : data})
	
func add_user_to_leaderboard():
	var command = "add_user_to_leaderboard"
	var data = {"userId": int(Gs.userId), "gameId": int(Gs.gameId)}
	request_queue.push_back({"command" : command, "data" : data})

func create_game():
	var command = "create_game"
	var data = {"userId": int(Gs.userId)};
	request_queue.push_back({"command" : command, "data" : data})

func load_game():
	var command = "load_game"
	var data = {"userId": int(Gs.userId)}
	request_queue.push_back({"command" : command, "data" : data})

func update_game():
	var command = "update_game"
	var data = {"userId": int(Gs.userId), "money": int(Gs.money), "days": int(Gs.days), "upgrades": int(Gs.upgrades), "bills" : int(Gs.bills), "work" : int(Gs.work), "radioparts": int(Gs.radioParts), "hunger" : int(Gs.hunger)}
	request_queue.push_back({"command" : command, "data" : data})
