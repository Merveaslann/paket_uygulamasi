import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'E-posta:'),
            onSaved: (newValue) => email = newValue!,
            validator: (value) => value == null || value.isEmpty ? 'Mail adresiniz boş olamaz' : null,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Şifre:'),
            onSaved: (value) => password = value!,
            validator: (value) => value == null || value.isEmpty ? 'Şifreniz boş olamaz' : null,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
          ),
          ElevatedButton(
            onPressed: () async {
              // Form valid (geçerli/yazdığımız kurallara uyuyor ise) kontrolü yapıyoruz.
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                await signUp(context);
              }
            },
            child: const Text('Kayıt ol'),
          ),
        ]),
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
      .then((UserCredential usercredential) {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute<void>(builder: (context) => const HomePage()), (route) => false
          );
        }
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Üyelik oluşturulurken bir hatayla karşılaşıldı.')),
        );
      });
    }
}
