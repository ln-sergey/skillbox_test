import 'package:flutter/material.dart';
import 'package:skillbox_test/models/user.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user,
    this.onTap,
    this.selected = false,
  });

  final User user;
  final bool selected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      selected: selected,
      leading: CircleAvatar(
        child: Text(user.initials),
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
    );
  }
}
