import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillbox_test/providers/users_provider.dart';
import 'package:skillbox_test/widgets/user_list_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: _SelectedUsersList(),
    );
  }
}

class _SelectedUsersList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUsers = ref.watch(selectedUsersProvider).values.toList();

    return ListView.builder(
        itemCount: selectedUsers.length,
        itemBuilder: (context, index) {
          final user = selectedUsers[index];

          return UserListTile(
            user: user,
          );
        });
  }
}
