import 'package:bootcamp_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../models/travel.dart';
import 'travel_add_page.dart';

class TravelListings extends StatefulWidget {
  const TravelListings({Key? key}) : super(key: key);

  @override
  State<TravelListings> createState() => _TravelListingsState();
}

class _TravelListingsState extends State<TravelListings> {
  List travelItems = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Text("Burada acik seyahatler listelenecek"),
        ListView.builder(
          itemCount: travelItems.length,
          itemBuilder: (context, index) => travelItems[index],
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TravelAddPage(),));
            },
          )
        )
      ]
    );
  }
}


