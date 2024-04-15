extends Node

# variabler
var fullName : String = "error"
var password : String = "test";
var email : String  = "test@gmail.com";
var userId : int;
var gameId : int;
var moneyBank : int;
var moneyPerson : int;
var days : int;
var bills : int;
var radioParts : int;
var work : int;
var hunger : int;
var hasWorkedToday : bool = false;
var illnessLevel : int;
var medicineCount : int;
var accident : bool = false;
var newPLayer: bool = true;

# shop
var upgradePricesWork : Array = [500, 1100, 2430];
var upgradePricesRadio : Array = [200, 298, 341, 400, 600] ## 2000, 2980, 3410, 4000, 6000

# signaler db
signal response()
signal login()
signal signup()
signal get_leaderboard_days()
signal get_leaderboard_money()
signal save_leaderboard()
signal create_game()
signal load_game()
signal save_game()

# signaler other
signal dayCounter()
signal moneyCounter()
signal hungerCounter()
signal bankCounter()
signal workpay()
