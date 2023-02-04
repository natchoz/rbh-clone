import 'package:flutter/material.dart';
import 'package:robinhood_clone/features/home/presentation/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const routeName = '/main';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _navigationItems = [
    const HomePage(),
    const Text('รายการโปรด'),
    const Text('กิจกรรม'),
    const Text('ข้อความ'),
    const Text('บัญชี'),
  ];

  void _onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    // if (index == 0) {
    //   Modular.to.navigate('/');
    // } else if (index == 1) {
    //   Modular.to.navigate('/favorites');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _navigationItems,
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าหลัก'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'รายการโปรด'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'กิจกรรม'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: 'ข้อความ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'บัญชี'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black87,
        onTap: _onNavigationTap,
      ),
    );
  }
}

class NavigationItem {
  NavigationItem(this.title, this.icon, this.page, {this.key});

  final Key? key;
  final String title;
  final Widget icon;
  final Widget page;
}
