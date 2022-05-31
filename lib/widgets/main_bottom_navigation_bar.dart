import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/provider/navigation_provider.dart';
import 'package:projekt_broker_frontend/screens/crash/crash_screen.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/screens/order_overview/order_overview_screen.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_screen.dart';
import 'package:projekt_broker_frontend/screens/stock_search/stock_search_screen.dart';
import 'package:provider/provider.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
        builder: (context, navigationProvider, _) {
      return BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: UiTheme.lightTheme.primaryColor,
        currentIndex: navigationProvider.currentRouteIndex,
        onTap: (index) {
          Navigator.pushReplacementNamed(
            context,
            NavigationProvider.routes[index],
          );
          navigationProvider.currentRouteIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Suche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      );
    });
  }
}
