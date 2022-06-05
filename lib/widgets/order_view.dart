import 'package:cloud_firestore/cloud_firestore.dart';
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(widget.order.title, style: const TextStyle(fontSize: 20))
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded, size: 20,),
                    Text("${widget.order.from} - ${widget.order.to}"),
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.order.owner_readable == null ? "" : widget.order.owner_readable!),
                Text(DateFormat("dd/MM/yyyy").format(DateTime.parse((widget.order.date as Timestamp).toDate().toString()))),
                Text("Kapasite: ${widget.order.weight.toString()} Kg"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
