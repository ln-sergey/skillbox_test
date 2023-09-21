import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:skillbox_test/models/todo.dart';

final todosProvider = FutureProvider<List<Todo>>((ref) async {
  final response = (await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/')));

  final json = jsonDecode(response.body);
  if (json case List todos) {
    return todos.map((todo) => Todo.fromJson(todo)).toList();
  } else {
    throw const FormatException();
  }
});
