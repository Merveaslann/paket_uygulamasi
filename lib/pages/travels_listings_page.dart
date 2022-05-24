import 'package:bootcamp_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../models/travel.dart';
import '../widgets/travel_view.dart';
import 'travel_add_page.dart';

class TravelListings extends StatefulWidget {
  const TravelListings({Key? key}) : super(key: key);

  @override
  State<TravelListings> createState() => _TravelListingsState();
}

class _TravelListingsState extends State<TravelListings> {
  final Travel temp = Travel("İstanbuldan İzmire gidiyorum", "Ahmet Sertaç Dinçer", DateTime(2022, 5, 10).millisecondsSinceEpoch.toString(), "İstanbul", "İzmir", 3, "3 orta boy paketlik yerim var.");
  
  @override
  Widget build(BuildContext context) {
    final List travelItems = [
      TravelView(temp),
      TravelView(temp),
      TravelView(temp),
      TravelView(temp),
      TravelView(temp),
    ];

    return Stack(
      fit: StackFit.expand,
      children: [
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


