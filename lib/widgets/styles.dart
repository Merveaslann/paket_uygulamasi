import 'package:flutter/material.dart';

ButtonStyle ElevatedButtonStyle(){
  return ElevatedButton.styleFrom(
    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
    primary: Colors.deepPurple,
    onPrimary: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 40),
  );
}
