import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/database.dart';
import '../widgets/travel_view.dart';
import '../models/travel.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Travel> _travels = readOwnTravels();

  @override
  Widget build(BuildContext context) {
    // SEYAHATLERİMİ LİSTELEYEN BUILDER
    return ListView.builder(
      itemCount: _travels.length,
      itemBuilder: (context, index){
        return TravelView(_travels[index]);
      }
    );
  }
}
