import 'package:flutter/material.dart';
import 'package:maristcommerce/screen_pages/merch.dart';
import 'package:maristcommerce/screen_pages/my_account.dart';
import 'package:maristcommerce/screen_pages/my_cart.dart';
import 'package:maristcommerce/screen_pages/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  final initialIndex;
  const BottomNavBar({Key? key, this.initialIndex}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex ?? 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        _navigateToRoute(context, '/home', HomeScreen());
        break;
      case 1:
        _navigateToRoute(context, '/upcoming', Merch());
        break;
      case 2:
        _navigateToRoute(context, '/cart', MyCart());
        break;
      case 3:
        _navigateToRoute(context, '/myaccount', MyAccount());
        break;
    }
  }

  void _navigateToRoute(BuildContext context, String routeName, Widget screen) {
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists = currentRouteName == routeName;

    if (routeExists) {
      Navigator.popUntil(
        context,
        ModalRoute.withName(routeName),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
          settings: RouteSettings(name: routeName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF00BE62),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFF7ED957),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 28,
              color: Colors.white.withOpacity(0.9),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              size: 28,
              color: Colors.white.withOpacity(0.9),
            ),
            label: 'Upcomming',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 28,
              color: Colors.white.withOpacity(0.9),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 28,
              color: Colors.white.withOpacity(0.9),
            ),
            label: 'My Account',
          ),
        ],
      ),
    );
  }
}
