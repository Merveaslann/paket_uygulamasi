import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/travel.dart';
import '../widgets/travel_view.dart';
import '../services/database.dart';
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
        StreamBuilder<QuerySnapshot>(
          stream: readTravels(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                Travel travel = Travel.fromMap(document.data() as Map<String, dynamic>);

                return TravelView(travel);
              }).toList(),
            );
          },
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


