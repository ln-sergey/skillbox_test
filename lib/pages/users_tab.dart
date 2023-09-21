import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:skillbox_test/models/user.dart';
import 'package:skillbox_test/providers/users_provider.dart';
import 'package:skillbox_test/widgets/user_list_tile.dart';

class UsersTab extends ConsumerWidget {
  const UsersTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);

    return RefreshIndicator.adaptive(
      onRefresh: () async => ref.refresh(usersProvider),
      child: users.map(
          data: (data) => _UsersList(usersList: data.value.toList()),
          error: (error) {
            return Center(
                child: switch (error.error) {
              FormatException _ => const Text('Format error'),
              http.ClientException _ => const Text('Network error'),
              _ => const Text('Error'),
            });
          },
          loading: (loading) => const Center(
                child: CircularProgressIndicator.adaptive(),
              )),
    );
  }
}

class _UsersList extends ConsumerWidget {
  const _UsersList({
    required this.usersList,
  });

  final List<User> usersList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUsers = ref.watch(selectedUsersProvider);

    return ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          final user = usersList[index];

          final newSelectedUsers = Map.of(ref.read(selectedUsersProvider));

          return UserListTile(
              user: user,
              selected: selectedUsers.containsKey(user.email),
              onTap: () {
                if (newSelectedUsers.containsKey(user.email)) {
                  newSelectedUsers.remove(user.email);
                } else {
                  newSelectedUsers[user.email] = user;
                }

                ref.read(selectedUsersProvider.notifier).state =
                    newSelectedUsers;
              });
        });
  }
}
