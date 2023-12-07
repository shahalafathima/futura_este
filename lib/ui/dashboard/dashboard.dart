import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ff/ui/login/loginn.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> carouselImages = [
    'assets/images/0.png',
    'assets/images/3333.png',
    'assets/images/33.jpeg',
    'assets/images/333.jpeg',
    'assets/images/3.jpeg',
  ];

  final Map<String, String> categoryImages = {
    'Flutter': 'assets/images/0.png',
    'Mern': 'assets/images/2.jpeg',
    'Python': 'assets/images/8.png',
    'Java': 'assets/images/1.jpeg',
    'Php': 'assets/images/6.jpeg',
    'Digital Marketing': 'assets/images/5.jpeg',
    'Data Analyst': 'assets/images/33.jpeg',
    'Graphic Design': 'assets/images/55.jpeg',
  };

  final List<String> Course = [
    'Flutter',
    'Mern',
    'Python',
    'Java',
    'Php',
    'Digital Marketing',
    'Data Analyst',
    'Graphic Design',
  ];

  final List<String> positions = [
    'Flutter Developer',
    'Mern Stack Developer',
    'Graphic Designer',
    'UI Designer'
  ];

  bool showAllCourse = false;
  bool showAllJobs = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 1),
                      child: Image.asset(
                        'assets/images/f1.png',
                        width: 98,
                        height: 98,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () {
                            _showLogoutConfirmationDialog(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 200),
                  child: TyperAnimatedTextKit(
                    text: ["Let's Find a Job"],
                    speed: Duration(milliseconds: 150),
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 236),
                  child: TyperAnimatedTextKit(
                    text: ['With NetDev'],
                    speed: Duration(milliseconds: 150),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: CarouselSlider.builder(
                      itemCount: carouselImages.length,
                      options: CarouselOptions(
                        height: 160,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {},
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (context, index, realIndex) {
                        final imagePath = carouselImages[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: index == 0
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    )
                                  : BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Course',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showAllCourse = !showAllCourse;
                          });
                        },
                        child: Text(
                          showAllCourse ? 'See Less' : 'See All',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: showAllCourse ? Course.length : 5,
                    itemBuilder: (context, index) {
                      final categoryName = Course[index];
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 131, 160, 185),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              categoryImages[categoryName] ??
                                  'assets/images/default.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8),
                            Center(
                              child: Text(
                                categoryName,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hiring Positions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showAllJobs = !showAllJobs;
                          });
                        },
                        child: Text(
                          showAllJobs ? 'See Less' : 'See All',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (showAllJobs)
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: positions.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 131, 160, 185),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              Center(
                                child: Text(
                                  positions[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '2 year experience',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Calicut',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                'Skills',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              Text(
                                '? IOS,?Version Controll System,?Scrum',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                ),
                                child: Text(
                                  'Apply',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 131, 160, 185),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to logout?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
