import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Order {
  final String title;
  final String owner;
  final DateTime date;
  final String from;
  final String to;
  final String size;
  final double weight;
  final String description;

  Order(this.title, this.owner, this.date, this.from, this.to, this.size, this.weight, this.description);

}

