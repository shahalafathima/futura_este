import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Futura());
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String website;
  final Address address;
  final String phone;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.website,
    required this.address,
    required this.phone,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      company: Company.fromJson(json['company']),
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
    );
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}

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
        appBar: AppBar(
          title: Text('User List'),
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
              User firstUser = users[0];

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black),
                    ),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            users[index].name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set text color to black
                            ),
                          ),
                          Text(
                            users[index].username,
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
                            users[index].email,
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 5),
                          Text(
                            users[index].website,
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
                                  fontWeight:
                                      FontWeight.bold, // Make heading bold
                                ),
                              ),
                              Text(
                                "${users[index].address.street}, ${users[index].address.suite}, ${users[index].address.city}",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),

                              // Zipcode
                              Text(
                                "Zipcode:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight:
                                      FontWeight.bold, // Make heading bold
                                ),
                              ),
                              Text(
                                "${users[index].address.zipcode}",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),

                              // Phone
                              Text(
                                "Phone:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight:
                                      FontWeight.bold, // Make heading bold
                                ),
                              ),
                              Text(
                                "${users[index].phone}",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),

                              // Company
                              Text(
                                "Company:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight:
                                      FontWeight.bold, // Make heading bold
                                ),
                              ),
                              Text(
                                "${users[index].company.name}",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Catch Phrase:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight:
                                      FontWeight.bold, // Make heading bold
                                ),
                              ),
                              Text(
                                "${users[index].company.catchPhrase}",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Business:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight:
                                      FontWeight.bold, // Make heading bold
                                ),
                              ),
                              Text(
                                "${users[index].company.bs}",
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
                },
              );
            }
          },
        ),
      ),
    );
  }
}
