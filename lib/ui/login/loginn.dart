import 'package:ff/ui/bottomtab/tab.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 131, 160, 185),
        child: Center(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.white,
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your mobile number';
    }
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  void _showWelcomeBackDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Welcome back!'),
          content: Text('You have successfully logged in.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TabsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 131, 160, 185),
                onPrimary: Color.fromARGB(255, 131, 160, 185),
              ),
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Image.asset(
              "assets/images/f1.png",
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 131, 160, 185),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 131, 160, 185),
                  ),
                ),
              ),
              validator: (value) => _validateEmail(value!),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 131, 160, 185),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 131, 160, 185),
                  ),
                ),
              ),
              obscureText: true,
              validator: (value) => _validatePassword(value!),
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showWelcomeBackDialog();
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  primary: Color.fromARGB(255, 131, 160, 185),
                  onPrimary: Color.fromARGB(255, 131, 160, 185),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  minimumSize: Size(double.infinity, 0),
                ),
                child: Text(
                  'LOG IN',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity * 0.8,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  primary: Colors.white70,
                  onPrimary: Color.fromARGB(255, 131, 160, 185),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  minimumSize: Size(double.infinity, 0),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color.fromARGB(255, 131, 160, 185),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text('Forgot password'),
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 131, 160, 185),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
