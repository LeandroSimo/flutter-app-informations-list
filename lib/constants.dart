import 'package:target/src/models/user.dart';

const String LIST_TOKEN = 'listToken';

const String URL_BASE = "https://reqres.in/api";

List<User> users = [
  User(
    id: "1",
    name: "User1",
    password: "password1",
    email: "user1@login.com",
    token: "tokenuser1",
  ),
  User(
    id: "2",
    name: "User2",
    password: "password2",
    email: "user2@login.com",
    token: "tokenuser2",
  ),
];
