import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/styles.dart';
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
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.card_giftcard_outlined,size: 100),
            const SizedBox(height: 25),
            const Text(
              "PAKET",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                    onSaved: (newValue) => email = newValue!,
                    validator: (value) => value == null || value.isEmpty ? 'Mail adresiniz boş olamaz' : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(border: InputBorder.none,
                      hintText: 'Şifre',
                    ),
                    onSaved: (value) => password = value!,
                    validator: (value) => value == null || value.isEmpty ? 'Şifreniz boş olamaz' : null,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButtonStyle(),
              child: const Text("Giriş Yap"),
              onPressed: () async {
                // Form valid (geçerli/yazdığımız kurallara uyuyor ise) kontrolü yapıyoruz.
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  await signIn(context);
                }
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  )
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Üye değil misiniz? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Hemen üye olun",
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
            ),
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
        },
      );
  }
}