import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signup_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email;
  late String password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
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
                  await signIn(context);
                }
              },
              child: const Text('Giriş Yap'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const SignupPage(),
                  )
                );
              },
              child: const Text("Üye ol")
            )
          ]),
        ),
      ),
    );
  }

  Future<void> signIn(BuildContext context) async {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
      .then((UserCredential usercredential) {
        if (usercredential.user != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(
              builder: (context) => const HomePage(),
            ),
          );
        }
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kullanıcı adınız veya şifreniz yanlış.')),
        );
      },);
  }
}
