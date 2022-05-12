import 'package:bootcamp_app/widgets/order_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/bottom_nav_bar_view.dart';

class OrderListings extends StatefulWidget {
  const OrderListings({Key? key}) : super(key: key);

  @override
  State<OrderListings> createState() => _OrderListingsState();
}

class _OrderListingsState extends State<OrderListings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Açık Siparişler", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      bottomNavigationBar: BottomNavBar(1),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            SizedBox(
              height: 500,
              child: ListView(
                children: const [
                  OrderView(),
                  OrderView(),
                  OrderView(),
                  OrderView(),
                  OrderView(),
                  OrderView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
