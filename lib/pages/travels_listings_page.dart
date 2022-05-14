import 'package:bootcamp_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'travel_add_page.dart';

class TravelListings extends StatefulWidget {
  const TravelListings({Key? key}) : super(key: key);

  @override
  State<TravelListings> createState() => _TravelListingsState();
}

class _TravelListingsState extends State<TravelListings> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Text("Burada acik seyahatler listelenecek"),
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


