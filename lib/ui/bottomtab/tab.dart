import 'package:ff/ui/bottomtab/bottomtab.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(),
          unselectedLabelStyle: const TextStyle(),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 131, 160, 185),
          unselectedItemColor: Colors.black,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
