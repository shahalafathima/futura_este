import 'package:ff/ui/profile/userdetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/model.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Page'),
          backgroundColor: Color.fromARGB(255, 131, 160, 185),
        ),
        body: FutureBuilder<List<User>>(
          future: fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<User> users = snapshot.data!;

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserDetailsPage(user: users[index]),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.all(10),
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: ListTile(
                        title: Text(users[index].name),
                        subtitle: Text(users[index].email),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<User>> fetchUsers() async {
    final Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => User.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
