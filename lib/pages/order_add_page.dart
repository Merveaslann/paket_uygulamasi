import 'package:flutter/material.dart';

class OrderAddPage extends StatefulWidget {
  const OrderAddPage({Key? key}) : super(key: key);

  @override
  State<OrderAddPage> createState() => _OrderAddPageState();
}

class _OrderAddPageState extends State<OrderAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Order ekleme sayfasi"),
      ),
    );
  }
}
