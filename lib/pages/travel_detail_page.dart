
import 'package:flutter/material.dart';

import '../models/travel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TravelDetail extends StatefulWidget {
  final Travel travel;
  const TravelDetail(this.travel, {Key? key}) : super(key: key);

  @override
  State<TravelDetail> createState() => _TravelDetailState();
}

class _TravelDetailState extends State<TravelDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.travel.title),
      ),
      body: Center(
        child: Container(

          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Image.asset("images/logo.jpeg"),
              const SizedBox(height: 15),
              Text(
                "${widget.travel.title}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                  "${widget.travel.from} - ${widget.travel.to}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.location_on_outlined),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30, top: 20),
                          child: Text("Taşınabilecek en fazla ağırlık (kg): ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 10),
                        child: Text("${widget.travel.weight}",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30, top: 10),
                        child: Text("Açıklama: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 10),
                        child: Text("${widget.travel.description}",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
