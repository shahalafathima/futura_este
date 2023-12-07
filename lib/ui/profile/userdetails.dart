import 'package:flutter/material.dart';
import '../../model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserDetailsPage extends StatefulWidget {
  final User user;

  UserDetailsPage({required this.user});

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late Future<User> userDetailsFuture;

  @override
  void initState() {
    super.initState();
    userDetailsFuture = fetchUserDetails();
  }

  Future<User> fetchUserDetails() async {
    final Uri uri = Uri.parse(
        'https://jsonplaceholder.typicode.com/users/${widget.user.id}');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Color.fromARGB(255, 131, 160, 185),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder<User>(
            future: userDetailsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                User userDetails = snapshot.data!;
                String address =
                    'Street: ${userDetails.address.street}, Suite: ${userDetails.address.suite}, City: ${userDetails.address.city}, ZipCode: ${userDetails.address.zipcode}';
                String geo =
                    'Lat: ${userDetails.geo.lat}, Lng: ${userDetails.geo.lng}';
                String company =
                    'Name: ${userDetails.company.name}, catchPhrase: ${userDetails.company.catchPhrase}, bs: ${userDetails.company.bs}';
                String phone = 'phone:${userDetails.phone}';
                String website = 'website:${userDetails.website}';
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${userDetails.name}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'User Name: ${userDetails.username}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Email: ${userDetails.email}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Address: $address',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Geo: $geo',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Phone: $phone',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'website: $website',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Company: $company',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
