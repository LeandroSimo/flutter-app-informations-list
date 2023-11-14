class User {
  String? id, name, email, password, token;

  User({this.id, this.name, this.email, this.password, this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
  }
  Map<String, dynamic> json() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'token': token,
      };
}
