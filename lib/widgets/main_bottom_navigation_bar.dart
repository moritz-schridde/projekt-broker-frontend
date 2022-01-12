import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/screens/crash/crash_screen.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/screens/order_overview/order_overview_screen.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_screen.dart';
import 'package:projekt_broker_frontend/screens/stock_search/stock_search_screen.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  static const _routes = [
    HomeScreen.routeName,
    OrderOverviewScreen.routeName,
    StockSearchScreen.routeName,
    ProfileScreen.routeName,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex:
          (_routes.indexOf(ModalRoute.of(context)?.settings.name ?? "")).abs(),
      onTap: (index) {
        Navigator.pushReplacementNamed(
          context,
          _routes[index],
        );
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
  }
}
