import 'package:bootcamp_app/widgets/order_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/order.dart';
import 'order_add_page.dart';


class OrderListings extends StatefulWidget {
  const OrderListings({Key? key}) : super(key: key);

  @override
  State<OrderListings> createState() => _OrderListingsState();
}

class _OrderListingsState extends State<OrderListings> {
  final Order temp = Order("Halı", "Ahmet Sertaç Dinçer", DateTime(2022, 5, 10), "İzmir", "İstanbul", "10cm x 10cm", 20.0, "Lorem ipsum");
  final Order koli = Order("Koli", "Ahmet Sertaç Dinçer", DateTime(2022, 5, 10), "İzmir", "İstanbul", "10cm x 10cm", 20.0, "Lorem ipsum");

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            OrderView(temp),
            OrderView(koli),
            OrderView(temp),
            OrderView(koli),
            OrderView(temp),
            OrderView(koli),
            OrderView(temp),
            OrderView(koli),
            OrderView(temp),
            OrderView(koli),
          ],
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed:() {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrderAddPage(),));
            }
          )
        )
      ]
    );
  }
}
