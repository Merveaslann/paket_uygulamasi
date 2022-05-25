import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/travel.dart';

Stream<QuerySnapshot<Map<String, dynamic>>> readData(){
  // Stream<List<Travel>> dbStream = FirebaseFirestore.instance.collection("travels").snapshots().map((snapshot) => snapshot.docs.map((doc) => Travel.fromMap(doc.data())).toList());
  Stream<QuerySnapshot<Map<String, dynamic>>> dbStream = FirebaseFirestore.instance.collection("travels").snapshots();
  return dbStream;
}