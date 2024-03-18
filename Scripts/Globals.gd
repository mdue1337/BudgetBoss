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
var upgrades : int;
var bills : int;

# signaler db
signal response()
signal login()
signal signup()
signal get_leaderboard()

# signaler other
signal dayCounter()
signal moneyCounter()
