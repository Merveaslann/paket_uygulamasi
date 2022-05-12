import 'package:bootcamp_app/pages/order_listings_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';
import '../widgets/bottom_nav_bar_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paket"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Row(
                  children: [
                    const Icon(Icons.person, size: 40),
                    Text("${FirebaseAuth.instance.currentUser?.email}")
                  ],
                )
            ),
            ListTile(
              title: const Text("Çıkış Yap"),
              onTap: (){
                signOut(context);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hoşgeldin ${FirebaseAuth.instance.currentUser?.email}"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrderListings()));
              },
              child: const Text("Açık Siparişler")
            )
          ],
        ),
      ),
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