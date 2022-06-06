import 'package:bootcamp_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/order.dart';
import '../widgets/styles.dart';
import 'home_page.dart';

class OrderAddPage extends StatefulWidget {
  const OrderAddPage({Key? key}) : super(key: key);

  @override
  State<OrderAddPage> createState() => _OrderAddPageState();
}

class _OrderAddPageState extends State<OrderAddPage> {
  late String title;
  late String owner;
  late String from;
  late String to;
  late int weight;
  late String description;
  final _formKey = GlobalKey<FormState>();
  List<String> cities = ['Adana', 'Adıyaman', 'Afyonkarahisar', 'Aksaray', 'Amasya', 'Ankara', 'Antalya', 'Ardahan', 'Artvin', 'Aydın', 'Ağrı', 'Balıkesir', 'Bartın', 'Batman', 'Bayburt', 'Bilecik', 'Bingöl', 'Bitlis', 'Bolu', 'Burdur', 'Bursa', 'Denizli', 'Diyarbakır', 'Düzce', 'Edirne', 'Elâzığ', 'Erzincan', 'Erzurum', 'Eskişehir', 'Gaziantep', 'Giresun', 'Gümüşhane', 'Hakkâri', 'Hatay', 'Isparta', 'Iğdır', 'Kahramanmaraş', 'Karabük', 'Karaman', 'Kars', 'Kastamonu', 'Kayseri', 'Kilis', 'Kocaeli', 'Konya', 'Kütahya', 'Kırklareli', 'Kırıkkale', 'Kırşehir', 'Malatya', 'Manisa', 'Mardin', 'Mersin', 'Muğla', 'Muş', 'Nevşehir', 'Niğde', 'Ordu', 'Osmaniye', 'Rize', 'Sakarya', 'Samsun', 'Siirt', 'Sinop', 'Sivas', 'Tekirdağ', 'Tokat', 'Trabzon', 'Tunceli', 'Uşak', 'Van', 'Yalova', 'Yozgat', 'Zonguldak', 'Çanakkale', 'Çankırı', 'Çorum', 'İstanbul', 'İzmir', 'Şanlıurfa', 'Şırnak'];
  String from_dropdown = "Çıkış şehrini seçiniz";
  String to_dropdown = "Varış şehrini seçiniz";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paket Oluştur"),
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
                  value: from_dropdown,
                  items: ["Çıkış şehrini seçiniz", ...cities].map((e) {
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
                    if(value == "Çıkış şehrini seçiniz"){
                      return 'Lütfen bir şehir seçiniz';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField(
                  value: to_dropdown,
                  items: ["Varış şehrini seçiniz", ...cities].map((e) {
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
                    if(value == "Varış şehrini seçiniz"){
                      return 'Lütfen bir şehir seçiniz';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Ağırlık', suffixText: "Kg"),
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

                      createOrder(Order(
                        title,
                        FirebaseAuth.instance.currentUser!.uid,
                        FirebaseAuth.instance.currentUser!.email,
                        FieldValue.serverTimestamp(),
                        from,
                        to,
                        weight,
                        description
                      )).then((value) {
                        customSuccessAlert(context, "Başarıyla paket oluşturdunuz!")
                          .then((value) {
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
                  child: const Text("Paket Oluştur"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
