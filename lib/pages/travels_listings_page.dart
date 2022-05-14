import 'package:flutter/material.dart';

class TravelListings extends StatefulWidget {
  const TravelListings({Key? key}) : super(key: key);

  @override
  State<TravelListings> createState() => _TravelListingsState();
}

class _TravelListingsState extends State<TravelListings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Burada acik seyahatler listelenecek"),
    );
  }
}


