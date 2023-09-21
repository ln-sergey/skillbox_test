import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:skillbox_test/models/user.dart';

final usersProvider = FutureProvider<List<User>>((ref) async {
  final response = (await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users/')));

  final json = jsonDecode(response.body);
  if (json case List users) {
    return users.map((user) => User.fromJson(user)).toList();
  } else {
    throw const FormatException();
  }
});

final selectedUsersProvider = StateProvider((ref) => <String, User>{});
