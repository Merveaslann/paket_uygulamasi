import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';
import 'order_listings_page.dart';
import 'travels_listings_page.dart';
import 'profile_page.dart';
import 'order_add_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> _pageList = const [OrderListings(), TravelListings(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paket"),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const SizedBox(height: 30),
              UserAccountsDrawerHeader(
                  accountName: const Text(
                    "Hoşgeldiniz",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  accountEmail: Text("${FirebaseAuth.instance.currentUser?.email}")),
              ListTile(
                title: const Text("Çıkış Yap",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: (){
                  signOut(context);
                },
              ),
            ],

          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              label: "Paketler"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping),
              label: "Seyahatler"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profil"
          )
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: _pageList.elementAt(selectedIndex),
    );
  }

  void signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        )
    );
  }
}