import 'dart:convert';

import 'package:target/constants.dart';
import 'package:target/src/models/user.dart';

import 'package:http/http.dart' as http;
import 'package:test/test.dart';

Future<String> fetchToken() async {
  final body = {'email': 'eve.holt@reqres.in', 'password': 'cityslicka'};

  final response = await http.post(Uri.parse("$URL_BASE/login"), body: body);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final token = data['token'];
    return token;
  } else {
    throw Exception('Erro na solicitação: ${response.statusCode}');
  }
}

void main() {
  test('Testa usuários válidos', () {
    User user1 = users[0];
    User user2 = users[1];

    expect(user1.name.toString(), equals('User1'));
    expect(user1.password.toString(), equals('password1'));
    expect(user1.email.toString(), equals('user1@login.com'));
    expect(user1.token.toString(), equals('tokenuser1'));

    expect(user2.name.toString(), equals('User2'));
    expect(user2.password.toString(), equals('password2'));
    expect(user2.email.toString(), equals('user2@login.com'));
    expect(user2.token.toString(), equals('tokenuser2'));
  });

  test('Teste de solicitação POST', () async {
    final token = await fetchToken();
    expect(token, isNotEmpty);
    print('Token recebido: $token');
  });
}
