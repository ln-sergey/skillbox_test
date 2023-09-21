import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:skillbox_test/models/todo.dart';

import 'package:skillbox_test/providers/todos_provider.dart';

class TodosTab extends ConsumerWidget {
  const TodosTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);

    return RefreshIndicator.adaptive(
      onRefresh: () async => ref.refresh(todosProvider),
      child: todos.map(
          data: (data) => _TodosList(todosList: data.value),
          error: (error) => Center(
                  child: switch (error.error) {
                FormatException _ => const Text('Format error'),
                http.ClientException _ => const Text('Network error'),
                _ => const Text('Error'),
              }),
          loading: (loading) => const Center(
                child: CircularProgressIndicator.adaptive(),
              )),
    );
  }
}

class _TodosList extends StatelessWidget {
  const _TodosList({
    required this.todosList,
  });

  final List<Todo> todosList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todosList.length,
        itemBuilder: (context, index) {
          final todo = todosList[index];

          return ListTile(
            tileColor: todo.completed ? Colors.green : null,
            textColor: todo.completed ? Colors.white : null,
            title: Text(todo.title),
          );
        });
  }
}
