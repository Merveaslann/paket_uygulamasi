import 'package:bootcamp_app/widgets/order_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/order.dart';
import '../services/database.dart';
import 'order_add_page.dart';


class OrderListings extends StatelessWidget {
  const OrderListings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: getOrders(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Bir hatayla karşılaşıldı');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator()
                    )
                );
              }

              return ListView(
                children: snapshot.data!.docs.map((document) {
                  Order order = Order.fromMap(document.data() as Map<String, dynamic>);

                  return OrderView(order);
                }).toList(),
              );
            },
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
