import '/models/travel.dart';
import 'package:intl/intl.dart'; // DateTime icin
import 'package:flutter/material.dart';

class TravelView extends StatefulWidget {
  final Travel travel;
  const TravelView(this.travel, {Key? key}) : super(key: key);

  @override
  State<TravelView> createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.travel.title, style: const TextStyle(fontSize: 20)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.location_on_rounded, size: 20,),
                Text("${widget.travel.from} - ${widget.travel.to}"),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.travel.owner),
                Text(DateFormat("dd/MM/yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(widget.travel.date)))),
                Text("Kapasite: ${widget.travel.capacity}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
