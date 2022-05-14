import "package:flutter/material.dart";

class TravelAddPage extends StatefulWidget {
  const TravelAddPage({Key? key}) : super(key: key);

  @override
  State<TravelAddPage> createState() => _TravelAddPageState();
}

class _TravelAddPageState extends State<TravelAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text("Travel ekleme sayfasi"),
      ),
    );
  }
}
