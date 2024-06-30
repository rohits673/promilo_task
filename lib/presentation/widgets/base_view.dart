import 'package:flutter/material.dart';
import '../screens/account_screen.dart';
import '../screens/explore_screen.dart';
import '../screens/home_screen.dart';
import '../screens/meetup/meetup_screen.dart';
import '../screens/prolet_screen.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _selectedIndex = 2;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    ProletScreen(),
    MeetupScreen(),
    ExploreScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black12, blurRadius: 10.0)
          ],
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.home_filled,
                      color: _selectedIndex == 0
                          ? Colors.cyan
                          : const Color(0xFF1E1C57),
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedIndex == 0
                            ? Colors.cyan
                            : const Color(0xFF1E1C57),
                      ),
                    )
                  ],
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.apps,
                      color: _selectedIndex == 1
                          ? Colors.cyan
                          : const Color(0xFF1E1C57),
                    ),
                    Text(
                      "Prolet",
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedIndex == 1
                            ? Colors.cyan
                            : const Color(0xFF1E1C57),
                      ),
                    )
                  ],
                ),
                label: 'Prolet',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.handshake,
                      color: _selectedIndex == 2
                          ? Colors.cyan
                          : const Color(0xFF1E1C57),
                    ),
                    Text(
                      "Meetup",
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedIndex == 2
                            ? Colors.cyan
                            : const Color(0xFF1E1C57),
                      ),
                    )
                  ],
                ),
                label: 'Meetup',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.explore,
                      color: _selectedIndex == 3
                          ? Colors.cyan
                          : const Color(0xFF1E1C57),
                    ),
                    Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedIndex == 3
                            ? Colors.cyan
                            : const Color(0xFF1E1C57),
                      ),
                    )
                  ],
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: _selectedIndex == 4
                          ? Colors.cyan
                          : const Color(0xFF1E1C57),
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedIndex == 4
                            ? Colors.cyan
                            : const Color(0xFF1E1C57),
                      ),
                    )
                  ],
                ),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
