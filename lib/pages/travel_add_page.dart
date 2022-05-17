import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
  late String size;
  late double weight;
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
                    decoration: const InputDecoration(labelText: 'Kaç paket götürebilirsin?'),
                    onSaved: (newValue) => size = newValue!,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Bu alan boş bırakılamaz';
                      }
                      if(value is! int){
                        return 'Lütfen bir sayı giriniz';
                      }
                      return null;
                    }
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Açıklama'),
                  onSaved: (newValue) => description = newValue!,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();

                        // FirebaseFirestore.instance.collection('travels').add({});
                      }
                    },
                    child: const Text("Yayınla")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
