extends Node

# variabler
var fullName : String = "error"
var password : String = "test";
var email : String  = "test@gmail.com";
var userId : int = 1;
var gameId : int;
var money : int;
var days : int;
var upgrades : int;

# signaler
signal response()
signal login()
signal signup()
signal get_leaderboard()
