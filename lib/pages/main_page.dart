import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:tatantanuwijaya_19552011132/pages/dashboard_page.dart';
import 'package:tatantanuwijaya_19552011132/pages/date_page.dart';
import 'package:tatantanuwijaya_19552011132/pages/time_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          children: const [
            DashboadPage(),
            DatePage(),
            TimePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            activeColor: Colors.blue,
            inactiveColor: Colors.lightBlueAccent.shade100,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.date_range),
            title: Text('Date'),
            activeColor: Colors.redAccent.shade700,
            inactiveColor: Colors.red,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.date_range),
            title: Text('Date'),
            activeColor: Colors.greenAccent.shade400,
            inactiveColor: Colors.greenAccent.shade700
          ),
        ],
      ),
    );
  }
}