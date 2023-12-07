import 'package:ff/ui/login/loginn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SliderPage());
}

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            Page1(
              onNextPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
            Page2(
              onNextPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              onPreviousPressed: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
            Page3(
              onPreviousPressed: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              onNextPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final VoidCallback onNextPressed;

  Page1({required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Image.asset(
            'assets/images/Q.png',
            height: 300,
          ),
          Padding(padding: EdgeInsets.all(20)),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text(
              "Search job easier and more effective ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Text(
              'Make your experience of searching jobs more easier and more effective',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 19,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: ElevatedButton(
              onPressed: onNextPressed,
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 131, 160, 185),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                minimumSize: Size(35.0, 59.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  Page2({required this.onNextPressed, required this.onPreviousPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Image.asset('assets/images/h.jpg'),
          Padding(padding: EdgeInsets.all(20)),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text(
              "Apply for job anywhere & anytime",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Text(
              'NetDev makes you can apply for job from anywhere and anytime',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 19,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: onPreviousPressed,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 131, 160, 185),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    minimumSize: Size(35.0, 59.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: onNextPressed,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 131, 160, 185),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    minimumSize: Size(35.0, 59.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final VoidCallback onPreviousPressed;
  final VoidCallback onNextPressed;

  Page3({required this.onPreviousPressed, required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Image.asset(
            'assets/images/27.jpg',
            height: 300,
          ),
          Padding(padding: EdgeInsets.all(20)),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text(
              "Help find the right job with desire ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Text(
              ' NetDev can help the right job with your desire',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 19,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: onPreviousPressed,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 131, 160, 185),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    minimumSize: Size(35.0, 59.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: onNextPressed,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 131, 160, 185),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    minimumSize: Size(35.0, 59.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
