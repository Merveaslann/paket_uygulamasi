import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // DateTime icin

import '../models/order.dart';

class OrderView extends StatefulWidget {
  final Order order;
  const OrderView(this.order, {Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.order.title, style: const TextStyle(fontSize: 20)),
              Row(
                children: [
                  const Icon(Icons.location_on_rounded, size: 20,),
                  Text("${widget.order.from} - ${widget.order.to}"),
                ],
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 4)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.order.owner),
              Text(DateFormat("dd/MM/yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(widget.order.date)))),
              Text(widget.order.size),
            ],
          )
        ],
      ),
    );
  }
}
