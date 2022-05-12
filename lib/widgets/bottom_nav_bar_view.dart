import 'package:bootcamp_app/pages/order_listings_page.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class BottomNavBar extends StatefulWidget {
  int _selected_index;
  BottomNavBar(this._selected_index, {Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Paketler"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Seyahatler"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil"
        )
      ],
      currentIndex: widget._selected_index,
      selectedItemColor: Colors.blue,
      onTap: (value) {
        setState(() {
          widget._selected_index = value;
        });
        switch(value){
          case 0:
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
            break;
          case 1:
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const OrderListings()));
            break;
          case 2:
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
            break;
        }
      },
    );
  }
}
