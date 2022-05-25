import 'package:flutter/material.dart';

import '../models/travel.dart';

class TravelDetail extends StatefulWidget {
  final Travel travel;
  const TravelDetail(this.travel, {Key? key}) : super(key: key);

  @override
  State<TravelDetail> createState() => _TravelDetailState();
}

class _TravelDetailState extends State<TravelDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.travel.title)
          ],
        ),
      ),
    );
  }
}
