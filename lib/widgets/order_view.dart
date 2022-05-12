import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  Order temp = Order("Halı", "Ahmet Sertaç Dinçer", DateTime(2022, 5, 10), "İzmir", "İstanbul", "10cm x 10cm", 20.0, "Lorem ipsum");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(temp.title, style: const TextStyle(fontSize: 20)),
              Row(
                children: [
                  const Icon(Icons.location_on_rounded, size: 20,),
                  Text("${temp.from} - ${temp.to}"),
                ],
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 4)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(temp.owner),
              Text(DateFormat("dd/MM/yyyy").format(temp.date)),
              Text("\t${temp.size}"),
            ],
          )
        ],
      ),
    );
  }
}
