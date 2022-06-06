import 'package:bootcamp_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/travel.dart';
import '../widgets/travel_view.dart';
import '../services/database.dart';
import 'login_page.dart';

class OpenPage extends StatefulWidget {
  const OpenPage({Key? key}) : super(key: key);

  @override
  State<OpenPage> createState() => _OpenPageState();

}
class _OpenPageState extends State<OpenPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paket"),
      ),
        body: Center(
          child: Container(
            child: Stack(
              alignment: Alignment.center,
                children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: getTravels(),
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
              Positioned(
                  bottom: 20,
                  child: FloatingActionButton.extended(
                    label: const Text('İlan Vermek İçin Giriş Yapın veya Kaydolun',style: TextStyle(
                      color: Colors.white,
                    ),
                    ), // <-- Text
                    backgroundColor: Colors.deepPurple,
                    icon: const Icon( // <-- Icon
                      Icons.person,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage(),));
                    },
                  ),
              ),
            ]),
          ),
        ),
    );
  }
}