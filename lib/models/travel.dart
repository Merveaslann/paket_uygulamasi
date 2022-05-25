import 'package:cloud_firestore/cloud_firestore.dart';

class Travel {
  final String title;
  final String owner;
  final date;
  final String from;
  final String to;
  final int weight;
  final String description;
  List assignedOrders; // Atanmış siparişlerin uid'si

  Travel(this.title, this.owner, this.date, this.from, this.to, this.weight, this.description, {this.assignedOrders = const []});

  Travel.fromMap(Map<String, dynamic> map) : this (
      map["title"], map["owner"], map["date"], map["from"], map["to"], map["weight"], map["description"], assignedOrders: map["assignedOrders"]
  );

  Map<String, dynamic> toMap(){
    return {
      "title": title,
      "owner": owner,
      "date": date,
      "from": from,
      "to": to,
      "weight": weight,
      "description": description,
      "assignedOrders": assignedOrders
    };
  }
}