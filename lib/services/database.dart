import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/travel.dart';

Stream<QuerySnapshot<Map<String, dynamic>>> readTravels(){
  // Stream<List<Travel>> dbStream = FirebaseFirestore.instance.collection("travels").snapshots().map((snapshot) => snapshot.docs.map((doc) => Travel.fromMap(doc.data())).toList());
  Stream<QuerySnapshot<Map<String, dynamic>>> dbStream = FirebaseFirestore.instance.collection("travels").snapshots();
  return dbStream;
}

List<Travel> readOwnTravels(){
  late List travelUids;
  List<Travel> travels = [];

  Future<QuerySnapshot<Map<String, dynamic>>> dbQuery = FirebaseFirestore.instance.collection("users").where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

  dbQuery.then((value){
    travelUids = value.docs.first.data()["travels"];
  }).then((value){
    String travel;

    for (travel in travelUids){
      FirebaseFirestore.instance.collection("travels").doc(travel).get().then((value){
        travels.add(Travel.fromMap(value.data() as Map<String, dynamic>));
      });
    }
  });

  return travels;
}