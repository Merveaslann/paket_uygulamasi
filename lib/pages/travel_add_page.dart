import 'package:bootcamp_app/pages/home_page.dart';
import 'package:bootcamp_app/pages/travels_listings_page.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cool_alert/cool_alert.dart';

import '../models/travel.dart';
import '../widgets/styles.dart';

class TravelAddPage extends StatefulWidget {
  const TravelAddPage({Key? key}) : super(key: key);

  @override
  State<TravelAddPage> createState() => _TravelAddPageState();
}

class _TravelAddPageState extends State<TravelAddPage> {
  late String title;
  late String owner;
  late String from;
  late String to;
  late int weight;
  late String description;
  final _formKey = GlobalKey<FormState>();
  List<String> cities = ['Adana', 'Adıyaman', 'Afyonkarahisar', 'Aksaray', 'Amasya', 'Ankara', 'Antalya', 'Ardahan', 'Artvin', 'Aydın', 'Ağrı', 'Balıkesir', 'Bartın', 'Batman', 'Bayburt', 'Bilecik', 'Bingöl', 'Bitlis', 'Bolu', 'Burdur', 'Bursa', 'Denizli', 'Diyarbakır', 'Düzce', 'Edirne', 'Elâzığ', 'Erzincan', 'Erzurum', 'Eskişehir', 'Gaziantep', 'Giresun', 'Gümüşhane', 'Hakkâri', 'Hatay', 'Isparta', 'Iğdır', 'Kahramanmaraş', 'Karabük', 'Karaman', 'Kars', 'Kastamonu', 'Kayseri', 'Kilis', 'Kocaeli', 'Konya', 'Kütahya', 'Kırklareli', 'Kırıkkale', 'Kırşehir', 'Malatya', 'Manisa', 'Mardin', 'Mersin', 'Muğla', 'Muş', 'Nevşehir', 'Niğde', 'Ordu', 'Osmaniye', 'Rize', 'Sakarya', 'Samsun', 'Siirt', 'Sinop', 'Sivas', 'Tekirdağ', 'Tokat', 'Trabzon', 'Tunceli', 'Uşak', 'Van', 'Yalova', 'Yozgat', 'Zonguldak', 'Çanakkale', 'Çankırı', 'Çorum', 'İstanbul', 'İzmir', 'Şanlıurfa', 'Şırnak'];
  String from_dropdown = "Nerden gideceksiniz?";
  String to_dropdown = "Nereye gideceksiniz?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seyahat Oluştur"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Başlık'),
                  onSaved: (newValue) => title = newValue!,
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan boş bırakılamaz' : null,
                ),
                DropdownButtonFormField(
                  value: to_dropdown,
                  items: ["Nereye gideceksiniz?", ...cities].map((e) {
                    return DropdownMenuItem(
                        value: e,
                        child: Text(e)
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      to_dropdown = value!;
                      to = value;
                    });
                  },
                  validator: (value) {
                    if(value == null){
                      return 'Bu alan boş bırakılamaz';
                    }
                    if(value == "Nereye gideceksiniz?"){
                      return 'Lütfen bir şehir seçiniz';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField(
                  value: from_dropdown,
                  items: ["Nerden gideceksiniz?", ...cities].map((e) {
                    return DropdownMenuItem(
                        value: e,
                        child: Text(e)
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      from_dropdown = value!;
                      from = value;
                    });
                  },
                  validator: (value) {
                    if(value == null){
                      return 'Bu alan boş bırakılamaz';
                    }
                    if(value == "Nerden gideceksiniz?"){
                      return 'Lütfen bir şehir seçiniz';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Taşınabilecek Ağırlık',
                    suffixText: 'Kg',
                  ),
                  onSaved: (newValue) => weight = int.parse(newValue!),
                  validator: (value) => value == null || value.isEmpty ? 'Bu alan boş bırakılamaz' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Açıklama'),
                  onSaved: (newValue) => description = newValue!,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButtonStyle(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();

                      Travel _travel = Travel(
                          title,
                          FirebaseAuth.instance.currentUser!.uid,
                          FieldValue.serverTimestamp(),
                          from,
                          to,
                          weight,
                          description
                      );

                      FirebaseFirestore.instance.collection('travels').add(
                        _travel.toMap()
                      ).then((result) {
                        final Future<QuerySnapshot<Map<String, dynamic>>> _u = FirebaseFirestore.instance.collection("users")
                            .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

                        _u.then((value){
                          value.docs.first.reference.update({
                            "travels": FieldValue.arrayUnion([result.id])
                          });
                        });

                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          autoCloseDuration: const Duration(seconds: 2),
                          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                          title: "Başarıyla seyahat oluşturdunuz!",
                        ).then((value) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            )
                          );
                        });
                      });
                    }
                  },
                  child: const Text("Seyahat Oluştur"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
