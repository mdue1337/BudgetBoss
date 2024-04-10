extends Node

# variabler
var fullName : String = "error"
var password : String = "test";
var email : String  = "test@gmail.com";
var userId : int = 5;
var gameId : int;
var moneyBank : int;
var moneyPerson : int;
var days : int;
var bills : int;
var radioParts : int;
var work : int = 3;
var hunger : int = 10;
var hasWorkedToday : bool = false;
var illnessLevel : int;
var medicineCount : int;
var accident : bool = false;

# shop
var upgradePricesWork : Array = [500, 1100, 2430];
var upgradePricesRadio : Array = [2000, 2980, 3410, 4000, 6000]

# signaler db
signal response()
signal login()
signal signup()
signal get_leaderboard()
signal create_game()
signal load_game()
signal save_game()

# signaler other
signal dayCounter()
signal moneyCounter()
signal hungerCounter()
signal bankCounter()
signal workpay()
