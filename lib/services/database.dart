import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/order.dart';
import '../models/travel.dart';
import '../models/user.dart';

Stream<QuerySnapshot<Map<String, dynamic>>> getOrders(){
  Stream<QuerySnapshot<Map<String, dynamic>>> dbStream = FirebaseFirestore.instance.collection("orders")
      .orderBy("date", descending: true).snapshots();
  return dbStream;
}

Future<void> createOrder(Order order) async {
  FirebaseFirestore.instance.collection('orders').add(order.toMap());
}

Stream<QuerySnapshot<Map<String, dynamic>>> getTravels(){
  // Stream<List<Travel>> dbStream = FirebaseFirestore.instance.collection("travels").snapshots().map((snapshot) => snapshot.docs.map((doc) => Travel.fromMap(doc.data())).toList());
  Stream<QuerySnapshot<Map<String, dynamic>>> dbStream = FirebaseFirestore.instance.collection("travels")
      .orderBy("date", descending: true).snapshots();
  return dbStream;
}

Future<DocumentReference<Map<String, dynamic>>> createTravel(Travel travel) {
  return FirebaseFirestore.instance.collection('travels').add(travel.toMap());
}

Future<QuerySnapshot<Map<String, dynamic>>> getOwnTravels() {
  Future<QuerySnapshot<Map<String, dynamic>>> dbStream = FirebaseFirestore.instance.collection("travels")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

  return dbStream;
}

void createUser(){
  FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set(
      UserO(FirebaseAuth.instance.currentUser!.uid, "", "", "", "", FirebaseAuth.instance.currentUser!.email.toString(), FieldValue.serverTimestamp()).toMap()
  );
}

void addOrderToUser(String orderId){
  final Future<QuerySnapshot<Map<String, dynamic>>> user = FirebaseFirestore.instance.collection("users").where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

  user.then((value){
    value.docs.first.reference.update({
      "travels": FieldValue.arrayUnion([orderId])
    });
  });
}

Future<Map<String, dynamic>?> getUser(String uid) {
  Future<DocumentSnapshot<Map<String, dynamic>>> dbStream = FirebaseFirestore.instance.collection("users").doc(uid).get();
  return dbStream.then((value){
    return value.data();
  });
}

















// Future resetPassword(String email, BuildContext context) async {
//   try {
//     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//   } on FirebaseAuthException catch (e) {
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error: ${e.message}')),
//     );
//     return null;
//   }
//   ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(content: Text('Şifre sıfırlama maili gönderildi.')),
//   );
// }