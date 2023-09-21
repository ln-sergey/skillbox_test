import 'package:flutter/material.dart';
import 'package:skillbox_test/pages/todos_tab.dart';
import 'package:skillbox_test/pages/users_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ActionChip(
                label: const Text('Chat'),
                onPressed: () => Navigator.of(context).pushNamed('/chat'),
              ),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.people)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UsersTab(key: PageStorageKey('UsersTab')),
            TodosTab(key: PageStorageKey('TodosTab')),
          ],
        ),
      ),
    );
  }
}
