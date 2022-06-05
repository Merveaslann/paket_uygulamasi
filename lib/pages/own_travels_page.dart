import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/travel.dart';
import '../widgets/travel_view.dart';
import '../services/database.dart';

class OwnTravelsPage extends StatelessWidget {
  const OwnTravelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seyahatlerim"),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: getOwnTravels().asStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Bir hatayla karşılaşıldı');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator()
                  )
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                Travel travel = Travel.fromMap(document.data() as Map<String, dynamic>);

                return TravelView(travel);
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
