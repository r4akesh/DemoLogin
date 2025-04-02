

import 'package:bloc_login/sqlite/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class DbHomeScreen extends StatefulWidget {
  const DbHomeScreen({super.key});

  @override
  State<DbHomeScreen> createState() => _DbHomeScreenState();
}

class _DbHomeScreenState extends State<DbHomeScreen> {
  List<Map<String, dynamic>> users = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final data = await DatabaseHelper.instance.fetchUsers();
    setState(() {
      users = data;
    });
  }
  Future<void> _addUser(int name ) async {
    await DatabaseHelper.instance.insertUser({'name': "User$name", 'age': 30});
    _loadUsers();
  }

  Future<void> _updateUser(int id) async {
    await DatabaseHelper.instance.updateUser(id, {'name': 'Jane Doe$name', 'age': id});
    _loadUsers();
  }

  Future<void> _deleteUser(int id) async {
    await DatabaseHelper.instance.deleteUser(id);
    _loadUsers();
  }
  var name=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLite Example")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user['name']),
            subtitle: Text("Age: ${user['age']}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.edit), onPressed: () => _updateUser(name++)),
                IconButton(icon: Icon(Icons.delete), onPressed: () => _deleteUser(user['id'])),
               // IconButton(icon: Icon(Icons.add), onPressed: () => _addUser(name++)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _addUser(name++);
        },
      ),
    );
  }
}
