import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/model.dart';

class Futura extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<List<User>>(
          future: fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<User> users = snapshot.data!;
              User firstUser = users[0];

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return UserCard(user: users[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.black),
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              user.username,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.email,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              user.website,
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Address
                Text(
                  "Address:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${user.address.street}, ${user.address.suite}, ${user.address.city}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),

                // Zipcode
                Text(
                  "Zipcode:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${user.address.zipcode}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),

                // Phone
                Text(
                  "Phone:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${user.phone}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),

                // Company
                Text(
                  "Company:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${user.company.name}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Catch Phrase:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${user.company.catchPhrase}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Business:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${user.company.bs}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),

                // Geo
                Text(
                  "Geo:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Lat: ${user.geo.lat}, Lng: ${user.geo.lng}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
